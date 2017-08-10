<cfscript>

//  Instantiating all the services 
	userServices = new CFTunes.cfc.services.userServices();
	playlistServices = new CFTunes.cfc.services.playlistServices();

//  Getting the logged user Information
	userName = GetAuthUser();
	userObj = userServices.getUserObjByUserName(userName);

// 	Creating global page variables here
	myPlaylists = arraynew(1);
	
	myPlaylists = userServices.getAllUserPlaylistByUserId(userObj.getUserId());

</cfscript>