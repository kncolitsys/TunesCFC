import flash.media.Sound;
import flash.media.SoundLoaderContext;
import flash.net.URLRequest;

var slc:SoundLoaderContext = new SoundLoaderContext(3000);

var s:Sound = new Sound(new URLRequest("Battery.mp3"),slc);
s.play();