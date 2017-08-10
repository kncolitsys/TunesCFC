	<cfif isDefined("form.search")>
		<cfif isDefined("form.searchString") AND (form.searchString IS NOT "")>
			<cfset x = Form.searchString & "*" >
			<cfsearch name="mySearch" collection="cftunes" criteria="#x#">
			<cfscript>
				songServices = new CFTunes.cfc.services.SongServices();
				songQuery = QueryNew("songId,name,path,album,artist,artistId");
			</cfscript>
			<!---<cfdump var = "#mySearch#" />--->
			<cfloop query="mySearch">
				<cfset songId = key>
				<cfset oSong =  songServices.getSongDetailsbySongId(songId)>
				<cfscript>
					newRow = QueryAddRow(songQuery);
					QuerySetCell(songQuery, "songId", oSong.getSongId());
					QuerySetCell(songQuery, "name", oSong.getName() );
					QuerySetCell(songQuery, "path", oSong.getPath() );
					QuerySetCell(songQuery, "album", oSong.getAlbum().getAlbumName() );
					QuerySetCell(songQuery, "artist", oSong.getAlbum().getArtist().getArtistName());
					QuerySetCell(songQuery, "artistId", oSong.getAlbum().getArtist().getArtistId());
                </cfscript>
            </cfloop>
			<cfif mySearch.RecordCount eq 0>
				<div style="margin-top:30px">
					No songs containing all your search terms were found.
					<br/>
					<br/>
					Your search - <b><cfoutput>#Form.searchString#</cfoutput></b> - did not match any documents.
					<br/>
					<br/>
					Suggestions:<br/>
					<ul>
						<li>Make sure all words are spelled correctly.</li>
						<li>Try different keywords.</li>
						<li>Try more general keywords.</li>
					</ul>
				</div>
				<cfelse>
				
					<div align="center" >
					<div id="libraryAlbumToolBar" style="width:940px"></div>
				</div>
				<div style="height:5px"></div>
						<!-- Song Grid starts here -->
						<div align="center">
								<cfform name="songGridForm" method="post">
									<cfgrid name="songGrid"
											format="html"
											preservePageOnSort="true"
											autoWidth="true"
											query="songQuery"
											width="940"
											title="Search Result"
											height="300"
											sort="true"
											stripeRows="true">
										<cfgridcolumn name="songId" header="ID" width="100"/>
										<cfgridcolumn name="artistId" display="false" header="Artist Id" />
										<cfgridcolumn name="name" header="Title" width="200" />
										<cfgridcolumn name="artist" header="Artist" width="300" />
										<cfgridcolumn name="album" header="Album" width="220" />
									</cfgrid>
									</cfform>
						</div>		
						<!-- Song Grid ends here -->
			</cfif>
		</cfif>
	</cfif>














