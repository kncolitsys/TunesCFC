<cfinclude template="libraryMod.cfm">
<table align="center" class="genreButtonTable" id="genreTable">
	<tr>
    	<td><a href="javascript:genreButtonClicked('')"><div class="genreButtonUnselected">All</div></a></td>
		<cfloop array="#genres#" index="genre">
			<cfoutput>
				<td><a href="javascript:genreButtonClicked('#genre.getGenreId()#')"><div class="genreButtonUnselected">#genre.getGenreName()#</div></a></td>
			</cfoutput>
		</cfloop>
    </tr>
</table>

<table width="93%" border="1" align="center" cellpadding="0" cellspacing="0" class="hierarchyTable">
	<tr>
		<th>Sub Genre</th>
		<th>Artist</th>
		<th>Album</th>
	</tr>
	<tr>
		<td width="32%">
			<cfdiv bind="url:../Library/subgenreMini.cfm" id="subGenreDiv" class="hierarchyDiv"/>
		</td>
		<td width="33%">
			<cfdiv bind="url:../Library/artistMini.cfm" id="artistDiv" class="hierarchyDiv" />
		</td>
		<td width="33%">
			<cfdiv bind="url:../Library/albumMini.cfm" id="albumDiv" class="hierarchyDiv"/>
		</td>
	</tr>
</table>
<div style="height:5px;"></div>

<cfdiv id="lowerPanel" style="text-align:center;">
	<cfinclude template="genre.cfm">
</cfdiv>
