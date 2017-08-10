<cfscript>
	if(isDefined("url.albumId")){
		songServices = new CFTunes.cfc.services.SongServices();
		songs  = songServices.getAllSongByAlbumId(url.albumId);
		songQuery = QueryNew("songId,name,path,album,artist,artistId");
		for(i=1;i <= Arraylen(songs);i++){
			newRow = QueryAddRow(songQuery);
			QuerySetCell(songQuery, "songId", songs[i].getSongId());
			QuerySetCell(songQuery, "name", songs[i].getName() );
			QuerySetCell(songQuery, "path", songs[i].getPath() );
			QuerySetCell(songQuery, "album", songs[i].getAlbum().getAlbumName() );
			QuerySetCell(songQuery, "artist", songs[i].getAlbum().getArtist().getArtistName());
			QuerySetCell(songQuery, "artistId", songs[i].getAlbum().getArtist().getArtistId());
		}
	}
</cfscript>
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