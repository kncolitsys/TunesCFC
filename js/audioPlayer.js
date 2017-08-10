// songURL = songFolder + path
// puttin song url in an object and pushing it in array
CFTunes.currentPlaylist = Ext.extend(Object,{
	// currentPlaylistSongList
	constructor:function(){
		this.songArray = new Array();
		this.ulObj = Ext.get('currentPlaylistSongList');
		this.currentTrack = -1;
		this.t = new Ext.Template(
					    '<li>',
							'<a href="javascript:CFTunesPlayer.currentPlaylistPlaySong({indexNo})" id="{id}">',
						        '{songName}',
							'</a>',
					    '</li>'
			); 
	},
	clearCurrentPlaylist:function(){
		this.ulObj.dom.innerHTML = ""; //setStyle('display','none')
		this.songArray = new Array();
	},
	addSongToCurrentPlaylist:function(songId){
		songservices = new SongServices();		
		songObjString = songservices.getSongDetailsInJson(songId);
		songObj = Ext.decode(songObjString);
		songId = 'currentPlaylistSong_'+ songObj.songId;
		sSongName = songObj.name;
		this.t.append(this.ulObj,{id:songId,songName:sSongName,indexNo:this.songArray.length});
		var songUrlId = new Object();
		songUrlId.id = songObj.songId;
		songUrlId.url = "http://localhost:8500/CFTunes/mp3" + songObj.path;
		this.songArray.push(songUrlId);
		return songId;
	},
	isBlank:function(){
		arrayObj = this.ulObj.select('li');
		if(arrayObj.length == 0){return true;}else{
			return false;
		} 
	},
	//this will append all the songs of a playlist in current playlist
	loadPlaylist:function(playlistId){
		playlistServices = new PlaylistServices();
		playlistObj = playlistServices.getPlaylistByPlaylistIdInJson(playlistId);
//		playlistObj = Ext.decode(playlistObjString);
		aSongs = playlistObj.songs;
		for (i = 0; i < aSongs.length; i++) {
			songObj = aSongs[i];
			songId = 'currentPlaylistSong_' + songObj.SongId;
			sSongName = songObj.name;
			this.t.append(this.ulObj, {
				id: songId,
				songName: sSongName,
				indexNo: this.songArray.length
			});
			var songUrlId = new Object();
			songUrlId.id = songObj.SongId;
			songUrlId.url = "http://localhost:8500/CFTunes/mp3" + songObj.path;
			this.songArray.push(songUrlId);
		}
	},
	//this will append all the songs of an album in current playlist
	loadAlbum:function(albumId){
		songservices = new SongServices();
		albumObjString = songservices.getSongsByAlbumIdInJson(albumId);
		albumObj = Ext.decode(albumObjString);
		aSongs = albumObj.songs;
		for(i=0;i<aSongs.length;i++){
			songObj = aSongs[i];
			sSongName = songObj.name;
			songId = 'currentPlaylistSong_'+ songObj.SongId;
			this.t.append(this.ulObj,{id:songId,songName:sSongName,indexNo:this.songArray.length});
			var songUrlId = new Object();
			songUrlId.id = songObj.SongId;
			songUrlId.url = "http://localhost:8500/CFTunes/mp3" + songObj.path;
			this.songArray.push(songUrlId);
		}
	}
	
});

CFTunes.audioPlayer = Ext.extend(Object, {
	constructor: function(){
		this.playlist = new CFTunes.currentPlaylist();
		this.player = getFlashMovie("AudioPlayer");
    },
	playSingleSong:function(songId){
		this.stop();
		this.playlist.clearCurrentPlaylist();
		this.playlist.addSongToCurrentPlaylist(songId);
		this.playlist.currentTrack = -1; // initiallizing the playlist
		this.playFirstSong();
	},
	playPlaylist:function(playlistId){
		this.stop();
		this.playlist.clearCurrentPlaylist();
		this.playlist.loadPlaylist(playlistId);
		this.playFirstSong();
	},
	playAlbum:function(albumId){
		this.stop();
		this.playlist.clearCurrentPlaylist();
		this.playlist.loadAlbum(albumId);
		this.playFirstSong();
	},
	addSongToCurrentPlaylist:function(songId){
		for(i=0;i<this.playlist.songArray.length;i++){
			songUrlId = this.playlist.songArray[i];
			if(songId == songUrlId.id){
				showInfoMessage("Song Already In Current Playlist","");
				return;
			}
		}
		this.playlist.addSongToCurrentPlaylist(songId);
	},
	play:function(){
		// check if there is a song already playing playit // $('playButton').show();$('pauseBotton').hide();
		// Check if the playlist empty if not play first song $('playButton').hide();$('pauseBotton').show();
		if(this.player.isPlaying()){
			this.player.play();
			Ext.fly('playButton').setStyle('display','none');
			Ext.fly('pauseBotton').setStyle('display','inline');
		}else if(this.playlist.songArray.length != 0){
			this.playFirstSong();
			Ext.fly('playButton').setStyle('display','none');
			Ext.fly('pauseBotton').setStyle('display','inline');
		}else{
			
		}

	},
	pause:function(){
		// pause the current playing song
		if(this.player.isPlaying()){
			Ext.fly('playButton').setStyle('display','inline');
			Ext.fly('pauseBotton').setStyle('display','none');
			this.player.pause();
		}
	},
	stop:function(){
		// clear the sound object
		Ext.fly('playButton').setStyle('display','none');
		Ext.fly('pauseBotton').setStyle('display','inline');
		this.player.stop();
	},
	next:function(){
		if(this.playlist.songArray.length == 0){
			// no song in the playlist
			return;
		}
		if(this.playlist.currentTrack == this.playlist.songArray.length){
			this.playlist.currentTrack = -1;
			this.stop();
		}else{
			songUrlId=this.playlist.songArray[++this.playlist.currentTrack];
			songUrl = songUrlId.url;
			this.player.setSongUrl(songUrl); // always set the url first before playing the song
			this.player.playNew();
		}
	},
	previous:function(){
		if(this.playlist.currentTrack == -1 || this.playlist.currentTrack == 0){
			// do nothing
		}else{
			songUrlId=this.playlist.songArray[--this.playlist.currentTrack];
			songUrl = songUrlId.url;
			this.player.setSongUrl(songUrl); // always set the url first before playing the song
			this.player.playNew();
		}
	},
	playFirstSong:function(){
		songUrlId=this.playlist.songArray[++this.playlist.currentTrack];
		songUrl = songUrlId.url;
		this.player.setSongUrl(songUrl); // always set the url first before playing the song
		Ext.fly('playButton').setStyle('display','none');
		Ext.fly('pauseBotton').setStyle('display','inline');
		this.player.playNew();
	},
	increaseVolume:function(){
		
	},
	decreaseVolume:function(){
		
	},
	songComplete:function(str)
	{
		this.next();
	},
	currentPlaylistPlaySong:function(indexNo){
		this.playlist.currentTrack = indexNo;
		songUrlId=this.playlist.songArray[indexNo];
		songUrl = songUrlId.url;
		this.player.setSongUrl(songUrl); // always set the url first before playing the song
		this.player.playNew();
		Ext.fly('playButton').setStyle('display','none');
		Ext.fly('pauseBotton').setStyle('display','inline');
	}
});



function getFlashMovie(movieName) {
 if (navigator.appName.indexOf("Microsoft") != -1) {
     return window[movieName];
 } else {
     return document[movieName];
 }
}