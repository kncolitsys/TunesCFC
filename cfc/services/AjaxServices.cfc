<cfcomponent>
	<cffunction name="generateArtistPPT" access="remote" >
		<cfargument name="artistId">
		<cfscript>
			artistId = arguments.artistId;
			if(! isDefined("session.STATUS")){
				session.STATUS = 0.1;
				session.statusMessage="Starting process ...";
			}
				lfServices = new CFTunes.cfc.services.lastFmServices();
				infoStruct = lfServices.getArtistInfo(artistId);
				session.STATUS = 0.2;
				session.statusMessage="Getting Artist Information";
				imgStrut = lfServices.getArtistImages(artistId);
				session.statusMessage="Fetching Artist Images";
				trackArray = lfServices.getTopTracks(artistId);
				session.statusMessage="Fetching Top Tracks";
				session.STATUS = 0.3;
				session.statusMessage="Starting PPT Generation...";
		</cfscript>
		<cfset destinationPPT = "#Application.presentationDir#\artist.ppt">
		<cfpresentation  title = "text string"  format= "ppt" destination="#destinationPPT#"
backgroundColor = "YELLOW"
overwrite = "yes">
	<cfpresentationslide Title="#infoStruct.artistName#"  duration="14">
		<table align="center">
			<tr>
				<td>
					<cfimage name="artistImg" source="#infoStruct.imgUrl#" action="read" >
					<cfimage action="writeToBrowser" source="#artistImg#" >
				</td>
			</tr>
			<tr>
				<td style="text-align:center;color:red">
					<cfoutput><h3>#infoStruct.artistName#</h3></cfoutput>
				</td>
			</tr>
		</table>
	</cfpresentationslide>
	<cfset session.STATUS = 0.4>
	<cfpresentationslide Title="Introduction"  duration="14">
		<cfoutput><p>#infoStruct.summary#</p></cfoutput>
	</cfpresentationslide>
	<cfset session.STATUS = 0.5>
	<cfpresentationslide Title="About"  duration="14">
		<cfoutput><p>#infoStruct.content#</p></cfoutput>
	</cfpresentationslide>
		<cfset session.STATUS = 0.6>
		<cfloop array="#imgStrut.imgUrls#" index="imgurl">
			<cfpresentationslide Title="Images"  duration="14">
				<table align="center">
					<tr>
						<td>
							<cfimage name="artistImg" source="#imgurl#" action="read" >
							<cfimage action="writeToBrowser" source="#artistImg#" >
						</td>
					</tr>
					<tr>
						<td style="text-align:center;color:red">
							<cfoutput><h3>#infoStruct.artistName#</h3></cfoutput>
						</td>
					</tr>
				</table>
			</cfpresentationslide>
        </cfloop>
		<cfscript>
			session.STATUS = 0.9;
			session.statusMessage="Almost Finish";
		</cfscript>
<!---		<cfpresentationslide Title="Top Tracks"  duration="14">
		<cfloop array="#trackArray#" index="track">
			<cfif isDefined("track.trackImgUrl")>
				<cfimage name="artistImg" source="#track.trackImgUrl#" action="read" >
				<cfimage action="writeToBrowser" source="#artistImg#" >
            </cfif>
			<cfoutput >#track.trackName#</cfoutput>
        </cfloop>
	</cfpresentationslide>--->
	</cfpresentation>
		<cfscript>
			session.STATUS = 1;
			session.statusMessage="Done...";
		</cfscript>
	</cffunction>	
	
	<cffunction name="generateArtistPDF" access="remote" >
		<cfargument name="artistId">
		<cfscript>
			artistId = arguments.artistId;
			if(! isDefined("session.STATUS")){
				session.STATUS = 0.1;
				session.statusMessage="Starting process ...";
			}
				lfServices = new CFTunes.cfc.services.lastFmServices();
				infoStruct = lfServices.getArtistInfo(artistId);
				session.STATUS = 0.2;
				session.statusMessage="Getting Artist Information";
				imgStrut = lfServices.getArtistImages(artistId);
				session.statusMessage="Fetching Artist Images";
				trackArray = lfServices.getTopTracks(artistId);
				session.statusMessage="Fetching Top Tracks";
				session.STATUS = 0.3;
				session.statusMessage="Starting PPT Generation...";
		</cfscript>
		<cfset destinationPPT = "#Application.presentationDir#\artist.ppt">
		<cfpresentation  title = "text string"  format= "ppt" destination="#destinationPPT#"
backgroundColor = "YELLOW"
overwrite = "yes">
	<cfpresentationslide Title="#infoStruct.artistName#"  duration="14">
		<table align="center">
			<tr>
				<td>
					<cfimage name="artistImg" source="#infoStruct.imgUrl#" action="read" >
					<cfimage action="writeToBrowser" source="#artistImg#" >
				</td>
			</tr>
			<tr>
				<td style="text-align:center;color:red">
					<cfoutput><h3>#infoStruct.artistName#</h3></cfoutput>
				</td>
			</tr>
		</table>
	</cfpresentationslide>
	<cfset session.STATUS = 0.4>
	<cfpresentationslide Title="Introduction"  duration="14">
		<cfoutput><p>#infoStruct.summary#</p></cfoutput>
	</cfpresentationslide>
	<cfset session.STATUS = 0.5>
	<cfpresentationslide Title="About"  duration="14">
		<cfoutput><p>#infoStruct.content#</p></cfoutput>
	</cfpresentationslide>
		<cfset session.STATUS = 0.6>
		<cfloop array="#imgStrut.imgUrls#" index="imgurl">
			<cfpresentationslide Title="Images"  duration="14">
				<table align="center">
					<tr>
						<td>
							<cfimage name="artistImg" source="#imgurl#" action="read" >
							<cfimage action="writeToBrowser" source="#artistImg#" >
						</td>
					</tr>
					<tr>
						<td style="text-align:center;color:red">
							<cfoutput><h3>#infoStruct.artistName#</h3></cfoutput>
						</td>
					</tr>
				</table>
			</cfpresentationslide>
        </cfloop>
		<cfscript>
			session.STATUS = 0.9;
			session.statusMessage="Almost Finish";
		</cfscript>
<!---		<cfpresentationslide Title="Top Tracks"  duration="14">
		<cfloop array="#trackArray#" index="track">
			<cfif isDefined("track.trackImgUrl")>
				<cfimage name="artistImg" source="#track.trackImgUrl#" action="read" >
				<cfimage action="writeToBrowser" source="#artistImg#" >
            </cfif>
			<cfoutput >#track.trackName#</cfoutput>
        </cfloop>
	</cfpresentationslide>--->
	</cfpresentation>
		<cfscript>
			session.STATUS = 1;
			session.statusMessage="Done...";
		</cfscript>
		
		
		
	</cffunction>
	
</cfcomponent>