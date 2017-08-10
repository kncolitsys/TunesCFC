<cfscript>
	playlistServices = new CFtunes.cfc.services.PlaylistServices();
	latestPlaylist =  playlistServices.getNewPlaylists();
</cfscript>
<div align="left">
<cfoutput>
<table cellspacing="15" border="0" class="playlistTable">
	<cfloop array="#latestPlaylist#" index="playlist">
		<tr>
			<td><img src="../img/user_photu.png" /></td>
			<td>
				<div class="playlistTableHeading"><a href="javascript:playlistLinkClicked(#playlist.getPlaylistId()#,'#playlist.getPlaylistName()#');">#playlist.getPlaylistName()#</a></div>
				<div class="subgenresOfPlaylist">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
								<img src="../icons/vector.png" />
							</td>
							<td>&nbsp;</td>
							<cfloop array="#playlist.getSubgenres()#" index="subgenre">
								 <td>	
									<a href="##">#subgenre.getSubGenreName()#</a>
								</td>	
								<td>
									<img align="absbottom" src="../icons/bullet_red.png" />
								</td>
		                    </cfloop>
						</tr>
					</table>
				</div>
				<div class="moodsOfPlaylist">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
								<img src="../icons/asterisk_yellow.png" 
							</td>
							<td>&nbsp;</td>
							<cfloop array="#playlist.getMoods()#" index="mood">
								 <td>	
									<a href="##">#mood.getMoodName()#</a>
								</td>	
								<td>
									<img align="absbottom" src="../icons/bullet_orange.png" />
								</td>
		                    </cfloop>
						</tr>
					</table>
				</div>
				<div class="tagsOfPlaylist">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
								<img src="../icons/tag_blue.png" />
							</td>
							<td>&nbsp;</td>
							<cfloop array="#playlist.getTags()#" index="tag">
								 <td>	
									<a href="##">#tag.getTagName()#</a>
								</td>	
								<td>
									 <img align="absbottom" src="../icons/bullet_blue.png" />
								</td>
		                    </cfloop>
						</tr>
					</table>
				</div>
			</td>
		</tr>
    </cfloop>
</table>
</cfoutput>
</div>

