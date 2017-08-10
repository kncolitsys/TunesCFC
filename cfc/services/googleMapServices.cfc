<cfcomponent output="false">

<cffunction name="getEventData" access="remote" >
	<cfargument name="cfmapname">
	<cfargument name="cfmaplatitude">
	<cfargument name="cfmaplongitude">
	<cfargument name="cfmapaddress">
	<cfset eventId = arguments.cfmapname>
	<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
		<cfhttpparam name="method" value="event.getInfo" type="url" >
		<cfhttpparam name="event" type="url" value="#eventId#">
		<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
	</cfhttp>
	<cfset mydoc = XmlParse(cfhttp.fileContent)>
	<cfscript>
		title= mydoc.lfm.event.title.xmlText;
		venueName = mydoc.lfm.event.venue.name.xmlText;
		city = mydoc.lfm.event.venue.location.city..xmlText;
		country = mydoc.lfm.event.venue.location.country..xmlText;
		oImage= mydoc.lfm.event.image[3].xmlText;
		startDate = mydoc.lfm.event.startDate;
	</cfscript>
	
	<cfsavecontent variable="local.display">
		<cfoutput>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="#oImage#" /></td>
					<td>
						<table>
							<tr>
								<td><h2>#title#</h2></td>
							</tr>
							<tr>
								<td>
									<h3>#venueName#</h3>
									<p>#city# - <b>#country#</b></p>
									<p>Date - #startDate#</p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</cfoutput>
	</cfsavecontent>
	<cfreturn local.display>
</cffunction>

</cfcomponent>