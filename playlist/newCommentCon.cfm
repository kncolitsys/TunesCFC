<cfscript>
	returnMsg = structNew();
	errors = structNew();
	playlistServices = new CFTunes.cfc.services.playlistServices();
	userServices = new CFTunes.cfc.services.userServices();
	flag = false;
	favorite = 0;
	rating = 0;
	if(!isDefined("form.comment") || form.comment == "" ){
		returnMsg.errors["comment"] = "You must enter a comment";
	}else{
		comment = form.comment;
	}

	//errors["playlistName"] = "Playlist Title must be greater than 6 letters.";
	playlistId = form.playlistId;
	returnMsg.playlistId = playlistId;
	if(isDefined("form.newCommentRating")){
		rating = form.newCommentRating;
	}
	
	if(isDefined("form.isFavorite")){
		isFavorite = form.isFavorite;
		favorite = 1;
	}
	
	if(StructisEmpty(errors)){
			userName = GetAuthUser();
			userObj = userServices.getUserObjByUserName(userName);
			playlist= playlistServices.getPlaylistByPlaylistId(playlistId);
			playlistRating = new CFTunes.cfc.model.playlistRating();
			playlistRating.setcomment(comment);
			playlistRating.setfavorite(favorite);
			playlistRating.setRating(rating);
			playlistRating.setplaylist(playlist);
			playlistRating.setratedBy(userObj);
			playlistRating.setratedOn(now());
			playlistServices.saveRating(playlistRating);
			writeOutput(serializeJSON(returnMsg));
	}else{
		writeOutput(serializeJSON(errors));
	}
</cfscript>