<cfscript>
	artist = "";
	artistServices = new CFTunes.cfc.services.artistServices();
	if(IsDefined("url.artistId")){
		artist = artistServices.getArtistByArtistId(url.artistId);
	}
</cfscript>

<table cellpadding="0" cellspacing="0" border="0" style="margin-left:15px">
	<tr>
		<td>
			<cflayout type="tab" style="width:950px">
				<cflayoutarea
					closable="false"
					disabled="false"
					overflow = "auto"
					selected="false"
					title="Images" source="../artist/artistImages.cfm?artistId=#url.artistId#">
					
				</cflayoutarea>
				<cflayoutarea
					closable="false"
					disabled="false"
					overflow = "auto"
					selected="false"
					title="Artist Info" source="../artist/artistInfo.cfm?artistId=#url.artistId#">
					
				</cflayoutarea>
				<cflayoutarea
					closable="false"
					disabled="false"
					overflow = "auto"
					selected="true"
					title="Events"  source="../artist/artistEvents.cfm?artistId=#url.artistId#">
				</cflayoutarea>
            </cflayout>
		</td>
	</tr>
</table>