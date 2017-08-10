package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.external.ExternalInterface;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;

	public class AudioPlayer extends Sprite
	{
		private var slc:SoundLoaderContext;
		private var s:Sound;
		private var urlRequest:URLRequest;
		private var songUrl:String;
		private var msg:String;
		private var sc:SoundChannel;
		private var pausePosition:int;
		private var playing:Boolean = false; // is the audioplayer is playing or is it stopped
		public function AudioPlayer()
		{
			slc = new SoundLoaderContext(3000);
            if (ExternalInterface.available) {
                try {
                    ExternalInterface.addCallback("sendToActionScript", receivedFromJavaScript);
                    ExternalInterface.addCallback("setSongUrl",setSongUrl);
                    ExternalInterface.addCallback("play",play);
                    ExternalInterface.addCallback("pause",pause);
                    ExternalInterface.addCallback("stop",stop);
                    ExternalInterface.addCallback("playNew",playNew);
                    ExternalInterface.addCallback("isPlaying",isPlaying);
                } catch (error:SecurityError) {
                    msg = "A SecurityError occurred: " + error.message + "\n";
                } catch (error:Error) {
                    msg = "An Error occurred: " + error.message + "\n";
                }
            } else {
                msg = "External interface is not available for this container.";
            }
		}
		
		private function isPlaying():Boolean{
			return this.playing;
		}
		
		private function setSongUrl(url:String):void{
			this.songUrl = url;
		}
		
		private function play():void{
			if(this.playing){
				sc = s.play(pausePosition);
				sc.addEventListener(Event.SOUND_COMPLETE,soundComplete);
			}
		}
		
		private function playNew():void{
			urlRequest = new URLRequest(this.songUrl);
			if(isPlaying()){
				this.stop();
			}
			s = new Sound(urlRequest,slc);
			pausePosition = 0;
			sc = s.play(pausePosition);
			sc.addEventListener(Event.SOUND_COMPLETE,soundComplete);
			this.playing = true;
		}
		
		private function stop():void{
			if(this.playing){
				sc.stop();
				this.playing = false;
			}
		}
		
		private function pause():void{
			pausePosition = sc.position;
			sc.stop();
		}
		
		private function soundComplete(e:Event):void{
			ExternalInterface.call("CFTunesPlayer.songComplete()");
		}
		
		private function receivedFromJavaScript(value:String):void {
//            output.appendText("JavaScript says: " + value + "\n");
        }
        private function checkJavaScriptReady():void {
//            var isReady:Boolean = ExternalInterface.call("isReady");
//            return isReady;
        }
        private function timerHandler(event:TimerEvent):void {
//            output.appendText("Checking JavaScript status...\n");
//            var isReady:Boolean = checkJavaScriptReady();
//            if (isReady) {
//                output.appendText("JavaScript is ready.\n");
//                Timer(event.target).stop();
//            }
        }
        private function clickHandler(event:MouseEvent):void {
            if (ExternalInterface.available) {
//                ExternalInterface.call("CFTunesPlayer.songComplete()", "gt");
            }
        }
		
	}
}