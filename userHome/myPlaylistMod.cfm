<cfscript>

//  Instantiating all the services 
	userServices = new CFTunes.cfc.services.userServices();
	playlistServices = new CFTunes.cfc.services.playlistServices();

//  Getting the logged user Information
	userName = GetAuthUser();
	userObj = userServices.getUserObjByUserName(userName);

// 	Creating global page variables here
	songQuery = QueryNew("songId,name,path,album,artist");
	playlistId = ""; // this is set by url
	myPlaylists = arraynew(1);
	
	myPlaylists = userServices.getAllUserPlaylistByUserId(userObj.getUserId());
	
	subscribedPlaylist = userServices.getAllSubscribedPlaylistByUserId(userObj.getUserId());
	
//  For song list Grid
	if(isDefined("url.playlistId")){
		playlistId = url.playlistId;
		songs = playlistServices.getAllSongsByPlaylistId(url.playlistId);
		for(i=1;i <= Arraylen(songs);i++){
			newRow = QueryAddRow(songQuery);
			QuerySetCell(songQuery, "songId", songs[i].getSongId());
			QuerySetCell(songQuery, "name", songs[i].getName() );
			QuerySetCell(songQuery, "path", songs[i].getPath() );
			QuerySetCell(songQuery, "album", songs[i].getAlbum().getAlbumName() );
			QuerySetCell(songQuery, "artist", songs[i].getAlbum().getArtist().getArtistName());
		}
	}
</cfscript>
