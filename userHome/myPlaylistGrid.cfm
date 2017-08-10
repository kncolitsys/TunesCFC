<cfscript>
	playlistServices = new CFTunes.cfc.services.playlistServices();
	songQuery = QueryNew("songId,name,path,album,artist");
	playlist = playlistServices.getPlaylistByPlaylistId(url.playlistId);
	if(isDefined("url.playlistId")){
		playlistId = url.playlistId;
		songs = playlistServices.getAllSongsByPlaylistId(url.playlistId);
		for(i=1;i <= Arraylen(songs);i++){
			newRow = QueryAddRow(songQuery);
			QuerySetCell(songQuery, "songId", songs[i].getSongId());
			QuerySetCell(songQuery, "name", songs[i].getName());
			QuerySetCell(songQuery, "path", songs[i].getPath());
			QuerySetCell(songQuery, "album", songs[i].getAlbum().getAlbumName() );
			QuerySetCell(songQuery, "artist", songs[i].getAlbum().getArtist().getArtistName());
		}
	}
</cfscript>

<cfoutput >
<div align="left">
<table cellspacing="15" border="0" class="playlistTable">
		<tr>
			<td><img src="../img/user_photu.png" /></td>
			<td>
				<div class="playlistTableHeading"><a href="##">#playlist.getPlaylistName()#</a></div>
				<div class="subgenresOfPlaylist">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
								<img src="../icons/vector.png" 
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
</table>
</div>
</cfoutput>

<div align="center">
			<div style="width:776px;margin-bottom:15px" id="selectedPlaylistToolbar"></div>

<!-- Song Table will go here -->
		<cfform name="songGridForm" method="post">
			<cfgrid name="songGridSelectedPlaylist"
					format="html"
					preservePageOnSort="true"
					query="songQuery"
					autoWidth="true"
					width="776"
					height="398"
					title="Songs"
					sort="true"
					collapsible="true"
					stripeRows="true">
				<cfgridcolumn name="songId" header="ID" display="true" width="100"/>
				<cfgridcolumn name="name" header="Title" width="200" />
				<cfgridcolumn name="artist" header="Artist" width="300" />
				<cfgridcolumn name="album" header="Album" width="220" />
			</cfgrid>
		</cfform>
	<!-- Song Table ends here -->
</div>
<!---<div align="center" style="margin-top:15px">
			<cflayout type="tab" style="width:970px;" name="playlistCommentSection" height="600">
				<!---<cflayoutarea
					closable="false"
					disabled="false"
					overflow = "auto"
					selected="true"
					title="Comments" source="../playlist/playlistComments.cfm?playlistId=#url.playlistId#">
				</cflayoutarea>--->
				<cflayoutarea
					closable="false"
					disabled="false"
					overflow = "auto"
					selected="false" 
					title="Subscribers" source="../playlist/playlistSubscriber.cfm?playlistId=#url.playlistId#">
				</cflayoutarea>
            </cflayout>
</div>--->