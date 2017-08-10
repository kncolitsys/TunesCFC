<cfscript>
	if(structKeyExists(Session,"playlist")){
		// start with a clean form
		StructDelete(session,"playlist",false);
	}
	
	oPlaylist = new CFTunes.cfc.model.playlist();
	formHandler = new CFTunes.cfc.services.playlistFormHandling();
	
	if(isDefined("url.playlistId")){
		// load the variables for edit form
		playlistServices = new CFTunes.cfc.services.playlistServices();
		oPlaylist = playlistServices.getPlaylistByPlaylistId(url.playlistId);
		aSubgenres = oPlaylist.getSubgenres();
		aMoods = oPlaylist.getMoods();
		for(i=1; i<= Arraylen(aSubgenres);i++){
			formHandler.addSubGenreToTextBox(aSubgenres[i].getSubgenreId());
		}
		for(i=1;Arraylen(aMoods);i++){
			formHandler.addMoodToTextBox(aMoods[i].getMoodId());
		}
	}else{
		// show the form for new playlist
	}
</cfscript>

<cfform name="playlistForm" id="playlistForm">
	<cfinput type="hidden" name="playlistId" value="#oPlaylist.getPlaylistId()#">
	<div id="newPlaylistToolBar" style="width:735px"></div>
	<cflayout name="bor01" type="border" style="height:575;width:735">
	   	<cflayoutarea position="left" style="width:200px" collapsible="false" splitter="true" >
	   		<cfinclude template="../userHome/tree2.cfm">
	    </cflayoutarea>    
	   	<cflayoutarea position="center">
		<div id="newPlayListMainContainer">
    	<div style="margin: 0pt auto; width: 500px; height: 220px; text-align: left;">
        	<div style="height: 40px;">
    			<span class="labelText">Title:</span>&nbsp;&nbsp;&nbsp;&nbsp;<cfinput type="text" style="margin: 0pt; width: 260px;" value="#oPlaylist.getPlaylistName()#" class="form-input" name="playlistName" id="playlistName"/>
				<div id="playlistNameError" style="color:red;margin-left:40px" class="error"></div>
  			</div>
		  	<div style="height: 40px;">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td><span class="labelText">Tags:</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><cfinput type="text" style="margin: 0pt; width: 260px;" value="" autosuggest="cfc:CFTunes.cfc.services.autosuggest.getTagSuggestion({cfautosuggestvalue})" class="form-input" name="playlistTags" id="playlistTags"/></td>
						</tr>
						<tr><td></td><td><div class="formHelp" style="margin-left:0px">Separate Tags with space</div></td></tr>
					</table>
  			</div>
          <div style="float: left; width: 470px; text-align: left; padding-top: 7px;"><span class="labelText">Description:</span> Write a good description about the playlist.</div>
    	 	<cftextarea tabindex="102" maxlength="5000"  style="width: 400px; height: 80px;" class="form-textarea" id="desc" value="#oPlaylist.getDescription()#" name="desc" >
			</cftextarea>
			
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<div style="float: left; width: 195px; text-align: left; padding-top: 7px;"><span class="labelText">Genres:</span> Click on the Genres from left.</div>
						<cfdiv id="playlistGenreBox" style="width: 197px; height: 200px;margin-top:21px; background-color: white; border:2px inset black">
						</cfdiv>
					</td>
					<td style="width:6px"></td>
					<td>
						<div style="float: left; width: 195px; text-align: left; padding-top: 7px;"><span class="labelText">Moods:</span> Click on the Moods from left.</div>
						<cfdiv id="playlistMoodBox" style="width: 197px; height: 200px;margin-top:21px; background-color:white; border:2px inset black">
						</cfdiv>
					</td>
				</tr>
			
			</table>
		  </div>
    	</div>
	    </cflayoutarea>
	</cflayout>
</cfform>