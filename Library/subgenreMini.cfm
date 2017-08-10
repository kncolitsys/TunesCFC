<cfscript>
	if(isdefined("url.genreId")){
		songService = new CFTunes.cfc.services.SongServices();
		subGenres = songService.getAllSubGenresByGenreId(url.genreId);
	}else{
		subGenres = arraynew(1);
	}
</cfscript>
<cfoutput>
<table id="subgenreHierarchyTable">
	<cfloop array="#subGenres#" index="x">
		<tr class="hierarchyTableRow" id="subGenre_#x.getSubGenreId()#">
			<td><img src="../icons/vector.png"></td>
			<td>
				<a href="javascript:subGenreLinkClicked('#x.getSubGenreId()#','subGenre_#x.getSubGenreId()#','subgenreHierarchyTable')">#x.getSubGenreName()#</a>
			</td>
		</tr>
	</cfloop>
</table>
</cfoutput>