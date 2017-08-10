<cfsetting enablecfoutputonly="true">
<cfscript>
	errors = structNew();
	playlistServices = new CFTunes.cfc.services.playlistServices();
	userServices = new CFTunes.cfc.services.userServices();
	
	// form.addToCurrentPlaylist;
	songId = form.songId;
	playlistId = form.addToPlaylist;
	if(isDefined("form.addToPlaylistCkBox")){
		try
        {
        	playlistServices.addSongToPlaylist(songId,playlistId);
        }
        catch(Any e)
        {
			errors["alreadyInPlaylist"] = "Song already in Playlist";
        }
	}

	if(StructisEmpty(errors)){
		
	}else{
		writeOutput(serializeJSON(errors));
	}
</cfscript>
<cfsetting enablecfoutputonly="false">