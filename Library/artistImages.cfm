<cfscript>
	artist = "";
	artistServices = new CFTunes.cfc.services.artistServices();
//	url.artistId = 1;
	if(IsDefined("url.artistId")){
		artist = artistServices.getArtistByArtistId(url.artistId);
	}
// http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=Metallica&api_key=9ac8550022fee493dd6a893fb0632605&format=json
</cfscript>
<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
	<cfhttpparam name="method" value="artist.getinfo" type="url" >
	<cfhttpparam name="artist" type="url" value="#artist.getArtistName()#">
	<cfhttpparam name="api_key" type="url" value="9ac8550022fee493dd6a893fb0632605">
</cfhttp>
<cfset mydoc = XmlParse(cfhttp.fileContent)>
<!---<cfoutput>
	#cfhttp.fileContent#
</cfoutput>--->
<!---
<cfdump var="#mydoc#">
<cfdump var="#mydoc.lfm.artist.image[3].XmlText#">--->
<!---<cfoutput >
	<table border="1" width="93%" align="center">
		<tr>
			<td>
				<img src="#mydoc.lfm.artist.image[3].XmlText#"/>
			</td>
			<td>
				<div class="infoText">#mydoc.lfm.artist.bio.summary.XmlText#</div>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><div class="infoText">#mydoc.lfm.artist.bio.content.XmlText#</div></td>
		</tr>
		
	</table>
</cfoutput>
--->