<cfscript>
	artist = "";
	artistServices = new CFTunes.cfc.services.artistServices();
	if(IsDefined("url.artistId")){
		artistId = url.artistId; 
		artist = artistServices.getArtistByArtistId(url.artistId);   
		image = artist.getImage();
		if(isDefined("image")){
			artistImageId = image.getImageId();
		}else{
			artistImageId = "1";
		}
	}
//	lfServices = new CFTunes.cfc.services.lastFmServices();
//	infoStruct = lfServices.getArtistInfo(url.artistId);
</cfscript>
<div style="height:10px"></div>
	<div align="center" >
		<div id="libraryArtistToolBar" style="width:950px"></div>
	</div>
<cfoutput>
<a href="../artist/artistExplorer.cfm?artistId=#url.artistId#" target="_blank">
<table align="center" style="margin-top:20px">
	<tr>
		<td>
			<img src="../images/#artistImageId#.png" />
		</td>
	</tr>
	<tr>
		<td style="text-align:center;color:red">
				<h3>#artist.getArtistName()#</h3>
		</td>
	</tr>
</table>
</a>
</cfoutput>