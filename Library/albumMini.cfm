<cfscript>
	if(IsDefined("url.artistId")){
		songService = new CFTunes.cfc.services.SongServices();
		albums = songService.getAllAlbumByArtistId(url.artistId);
	}else{
		albums = arraynew(1);
	}
</cfscript>
<cfoutput>
<table id="albumHierarchyTable">
	<cfloop array="#albums#" index="album">
			<tr id="album_#album.getAlbumId()#" class="hierarchyTableRow">
				<td><img src="../icons/cd.png"></td>
				<td>
					<a href="javascript:albumLinkClicked('#album.getAlbumId()#','album_#album.getAlbumId()#','albumHierarchyTable')">#album.getAlbumName()#</a>
				</td>
			</tr>			
	</cfloop>
</table>
</cfoutput>