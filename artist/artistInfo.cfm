<cfscript>
	artist = "";
	artistServices = new CFTunes.cfc.services.artistServices();
	if(IsDefined("url.artistId")){
		artist = artistServices.getArtistByArtistId(url.artistId);
	}
</cfscript>
<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
	<cfhttpparam name="method" value="artist.getinfo" type="url" >
	<cfhttpparam name="artist" type="url" value="#artist.getArtistName()#">
	<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
</cfhttp>
<cfset mydoc = XmlParse(cfhttp.fileContent)>
<cfoutput >
	<div align="center">
		<h1>#artist.getArtistName()#</h1>
	</div>
<table align="center" width="1000px" class="myPlaylistTable" style="margin-top:0px;margin-left:7px" border="0">
	<tr>
		<td valign="top" width="200px">
	        <cfpod 	height = "800"
					bodystyle="background-color:##ECECEC;"
					title="About"
					name = "stats"
					width = "190">
					<img src="#mydoc.lfm.artist.image[3].XmlText#"/>
					<div style="text-align:center; margin-top:10px"><h4>#artist.getArtistName()#</h4></div>
			</cfpod>
		</td>
		<td valign="top">
			<table>
				<tr>
					<td width="583px" valign="top">
					<div class="infoText" style="text-align:left;margin-right:5px">#mydoc.lfm.artist.bio.summary.XmlText#</div>
					<div class="infoText" style="text-align:left;margin-top:25px;margin-right:5px">#mydoc.lfm.artist.bio.content.XmlText#</div>
					</td>
					<td valign="top">
						<div>
						<cfpod 	height = "150"
								name = "activity"
								title = "Events"
								width = "190">
							
						</cfpod>
						</div>
						<div style="margin-top:10px"> 
						<cfpod title="Genre"
								height = "200"
								name = "stats"
								width = "190">
						</cfpod>
						</div>
						<div style="margin-top:10px"> 
						<cfpod title="Top Albums"
								height = "300"
								name = "stats"
								width = "190">
						</cfpod>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</cfoutput>