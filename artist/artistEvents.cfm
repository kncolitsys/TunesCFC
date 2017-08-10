<cfscript>
	artist = "";
	artistServices = new CFTunes.cfc.services.artistServices();
	if(IsDefined("url.artistId")){
		artist = artistServices.getArtistByArtistId(url.artistId);
	}
</cfscript>
<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
	<cfhttpparam name="method" value="artist.getEvents" type="url" >
	<cfhttpparam name="artist" type="url" value="#artist.getArtistName()#">
	<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
</cfhttp>
<cfscript>
	mydoc = XmlParse(cfhttp.fileContent);
	arrLen = arraylen(mydoc.lfm.events.XmlChildren);
	markers = arrayNew(2);
	j = 1;
	for(y=1 ; y <= arrLen; y++){
		nLat=mydoc.lfm.events["event"][y].venue.location["geo:point"]["geo:lat"].xmlText;
		nLong = mydoc.lfm.events["event"][y].venue.location["geo:point"]["geo:long"].xmlText;
		eventId = mydoc.lfm.events["event"][y].id.xmlText;
		if(nLat == "" || nLong == ""){
		}else{
			markers[j][1] = nLat;
			markers[j][2] = nLong;
			markers[j][3] = eventId;
			j++;
		}
	}
</cfscript>
<table align="center">
	<tr>
		<td>
			<cfmap name="gmap01" centerlatitude="71.094224" markerBind="cfc:CFTunes.cfc.services.googleMapServices.getEventData({cfmapname}, {cfmaplatitude}, {cfmaplongitude}, {cfmapaddress})"
					centerlongitude="42.339641" doubleclickzoom="true" overview="true" scrollwheelzoom="true" showscale="true" showMarkerWindow="true" tip="My Map" height="600" width="950" zoomlevel="4">
				<cfloop array="#markers#" index="marker">
					<cfmapitem latitude="#marker[1]#" longitude="#marker[2]#" name="#marker[3]#" tip="Event" />
				</cfloop>
			</cfmap>
		</td>
	</tr>
</table>