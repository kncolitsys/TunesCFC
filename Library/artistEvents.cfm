<cfscript>
	artist = "";
	artistServices = new CFTunes.cfc.services.artistServices();
	url.artistId = 1;
	if(IsDefined("url.artistId")){
		artist = artistServices.getArtistByArtistId(url.artistId);
	}
// http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=Metallica&api_key=9ac8550022fee493dd6a893fb0632605&format=json
</cfscript>
<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
	<cfhttpparam name="method" value="artist.getEvents" type="url" >
	<cfhttpparam name="artist" type="url" value="#artist.getArtistName()#">
	<cfhttpparam name="api_key" type="url" value="9ac8550022fee493dd6a893fb0632605">
</cfhttp>
<cfscript>
	mydoc = XmlParse(cfhttp.fileContent);
	arrLen = arraylen(mydoc.lfm.events.XmlChildren);
	markers = arrayNew(2);
	j = 1;
	for(y=1 ; y <= arrLen; y++){
		nLat=mydoc.lfm.events["event"][y].venue.location["geo:point"]["geo:lat"].xmlText;
		nLong = mydoc.lfm.events["event"][y].venue.location["geo:point"]["geo:long"].xmlText;
		if(nLat == "" || nLong == ""){
		}else{
			markers[j][1] = nLat;
			markers[j][2] = nLong;
			j++;
		}
	}
	
</cfscript>
<cfmap name="gmap01" centerlatitude="71.094224" centerlongitude="42.339641" doubleclickzoom="true" overview="true" scrollwheelzoom="true" showscale="true" tip="My Map" height="600" width="600" zoomlevel="4">
	<cfloop array="#markers#" index="marker">
		<cfmapitem latitude="#marker[1]#" longitude="#marker[2]#" tip="New marker"/>
	</cfloop>
</cfmap>
