/* this is the playlist object
var plObj = {
	currentPlaylistId : 'currentPlaylist',
	currentPlaylistOnButtonId: 'currentPlaylistOnButton',	
	currentPlaylistOffButtonId: 'playListLink',
	playerId:'mainPlayer',
	playerLinkId:'playerLink',
	playerOpenerId:'playerLinkImg'
}
*/


CFTunes.currentPlaylist = Ext.extend(Object, {
	isCurrentPlaylistVisible:false,
	constructor: function(plObj){
        this.currentPlaylist = Ext.get(plObj.currentPlaylistId);
		this.currentPlaylistOnButton =  Ext.get(plObj.currentPlaylistOnButtonId);
		this.currentPlaylistOffButton = Ext.get(plObj.currentPlaylistOffButtonId);
		this.currentPlaylistInit();
    },
	currentPlaylistInit:function(){
		this.currentPlaylistOnButton.on('click',this.toggleCurrentPlaylist,this,{
			 stopEvent : true
		});
		this.currentPlaylistOffButton.on('click',this.toggleCurrentPlaylist,this,{
			 stopEvent : true
		});
	},
	toggleCurrentPlaylist:function(){
		if(this.isCurrentPlaylistVisible){
			this.playlistSlideUp();
		}else{
			this.playlistSlideDown();
		}
//		this.togglePlaylistOnButton();
		this.isCurrentPlaylistVisible = ! this.isCurrentPlaylistVisible;
	},
	togglePlaylistOnButton:function(){
		if(this.currentPlaylistOnButton.getStyle('display') == 'block'){
			this.currentPlaylistOnButton.setStyle('display','none');
		}else{
			this.currentPlaylistOnButton.setStyle('display','block');
		}
	},
	playlistSlideDown:function(){
		this.togglePlaylistOnButton();
		this.currentPlaylist.slideIn('t', {
		    easing: 'easeOut',
		    duration: 1.5
		});
	},
	playlistSlideUp:function(){
		this.currentPlaylist.slideOut('t', {
		    easing: 'easeOut',
		    duration: .5,
			scope:this,
			callback:this.togglePlaylistOnButton
		});
	}
	
	
});


CFTunes.playerOpener = Ext.extend(CFTunes.currentPlaylist, {
    constructor: function(plObj){
        this.openerId = plObj.playerOpenerId;
		this.isOpen = false;
		CFTunes.playerOpener.superclass.constructor.call(this,plObj);
    },
	
    toggleOpener: function(){
        if(this.isOpen){
			Ext.get(this.openerId).dom.src = "../img/player_slice_right_in.png";
		}else{
			Ext.get(this.openerId).dom.src = "../img/player_slice_right_out.png";
		}
		this.isOpen = ! this.isOpen;
    }
});



CFTunes.PlayerAnimation = Ext.extend(CFTunes.playerOpener, {
	isPlayerOpen:false,
	constructor:function(plObj){
		this.eplayerLinkId = plObj.playerLinkId;
		this.playerId = plObj.playerId;
		CFTunes.PlayerAnimation.superclass.constructor.call(this,plObj);
		this.player = Ext.get(plObj.playerId);
		this.playerLink = Ext.get(plObj.playerLinkId);
		this.addHandler();
	},
	
	addHandler:function(){
		this.playerLink.on('click',this.togglePlayer,this,{
			 stopEvent : true
		})
	},
	moveOut:function(){
		this.player.shift({
			x: -237,
			easing: 'backOut',
			duration: 1.5
			});
	},
	
	moveIn:function(){
		this.player.shift({x: -782});
	},
	togglePlayer:function(){
		this.toggleOpener();
		if(this.isPlayerOpen){
			this.moveIn();
			this.isPlayerOpen = false;
		}else{
			this.moveOut();
			this.isPlayerOpen = true;
		}
	}
	
}
);
