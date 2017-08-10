<cfsetting enablecfoutputonly="true">
<cfscript>
	errors = structNew();
	playlistServices = new CFTunes.cfc.services.playlistServices();
	userServices = new CFTunes.cfc.services.userServices();
	formHandler = new CFTunes.cfc.services.playlistFormHandling();
	
	if(form.playlistName == "" || (Len(form.playlistName) < 6)){
		errors["playlistName"] = "Playlist Title must be greater than 6 letters.";
	}else{
		try
        {
        	playlistServices.getPlaylistByPlaylistName(form.playlistName);
			errors["playlistName"] = "Playlist with the same name exists.";
        }
        catch(noRecordFound e)
        {
			
        }
	}
	playlistFormTags = form.playlistTags;
</cfscript>

	<cfset aTagString = arrayNew(1)>
	<cfloop list="#playlistFormTags#" delimiters=" " index="t">
		<cfset arrayAppend(aTagString,t)>
    </cfloop>
	
<cfscript>
	if(StructisEmpty(errors)){
		aSubgenreId = formHandler.getAllSubgenreOfTextBox(); // this is an array of subgenre object
		aMoodId = formHandler.getAllMoodsOfTextBox(); // this is an array of mood object
		
		tArray = playlistServices.getTagArrayByTagNameArray(aTagString);
		
		aMood = arraynew(1);
		aSubgenre = arraynew(1);
		aMood = aMoodId;
		aSubgenre = aSubgenreId;
		if(isDefined("form.playlistId") && form.playlistId != ""){
			playlist = playlistServices.getPlaylistByPlaylistId(form.playlistId);
		}else{
			playlist = new CFTunes.cfc.model.playlist();
			userName = GetAuthUser();
			userObj = userServices.getUserObjByUserName(userName);
			playlist.setCreatedBy(userObj);
			playlist.setCreatedOn(now());
			
		}
		playlist.settags(tArray);
		playlist.setPlaylistName(form.playlistName);
		playlist.setDescription(form.desc);
		playlist.setMoods(aMood);
		playlist.setSubgenres(aSubgenre);
		playlistServices.savePlaylist(playlist);
	}else{
		writeOutput(serializeJSON(errors));
	}
</cfscript>
<cfsetting enablecfoutputonly="false">