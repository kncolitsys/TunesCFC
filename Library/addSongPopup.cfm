<cfscript>
	songId = "";
	if(isDEfined("url.songId")){
		songId = url.songId;
	}else{
		
	}
</cfscript>
<cfinclude template="model.cfm">

<cfoutput>
<cfform name="addSongToPlaylist" id="addSongToPlaylist" preservedata="true" >
	<cfinput type="hidden" value="#songId#" name="songId">
	<div id="newPlayListMainContainer">
    	<div style="margin: 0pt auto; width: 500px; height: 220px; text-align: left;">
        	<div style="height: 40px;">
    			<span><cfinput type="checkbox" name="addToCurrentPlaylist"></span><span class="labelText">Add to current Playlist</span>
				<div id="addToCurrentPlaylistError" style="color:red;" class="error"></div>
  			</div>
        	<div style="height: 40px;">
    			<span><cfinput type="checkbox" name="addToPlaylistCkBox"></span><span class="labelText">Add to Playlist</span>
				<span>
					<cfselect name="addToPlaylist" >
						<cfloop array="#myPlaylists#" index="playlist">
							<option value="#playlist.getPlaylistId()#">#playlist.getPlaylistName()#</option>
                        </cfloop>
					</cfselect>
				</span>
				<div id="addToPlaylistError" style="color:red;" class="error"></div>
  			</div>
		  </div>
    </div>
	<div style="text-align:center"><cfinput type="button" value="Add" name="CancelButton" onclick="submitFormAddToPlaylist()"><cfinput type="button" value="Cancel" name="CancelButton" onclick="ColdFusion.Window.hide('popUpWindow')"></div>
</cfform>
</cfoutput>