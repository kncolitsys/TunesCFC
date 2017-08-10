<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
	<cfhttpparam name="method" value="event.getinfo" type="url" >
	<cfhttpparam name="event" type="url" value="#artist.getArtistName()#">
	<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
</cfhttp>
<cfset mydoc = XmlParse(cfhttp.fileContent)>