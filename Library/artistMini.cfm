<cfscript>
	if(Isdefined("url.subGenreId")){
		songService = new CFTunes.cfc.services.SongServices();
		artists = songService.getAllArtistBySubGenreId(url.subGenreId);
	}else{
		artists = arraynew(1);
	}
</cfscript>
<cfoutput>
<table id="artistHierarchyTable">
	<cfloop array="#artists#" index="y">
		<tr id="artist_#y.getArtistId()#" class="hierarchyTableRow">
			<td><img src="../icons/user_gray.png"></td>
			<td>
				<a href="javascript:artistClicked('#y.getArtistId()#','artist_#y.getArtistId()#','artistHierarchyTable')">#y.getArtistName()#</a>
			</td>
		</tr>
	</cfloop>
</table>
</cfoutput>