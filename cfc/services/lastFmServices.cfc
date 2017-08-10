<cfcomponent output="false">

<cffunction name="getArtistInfo" access="remote" >
	<cfargument name="artistId">
	<cfset artistId = arguments.artistId>
	<cfscript>
		retObj = structNew();
		artistServices = new CFTunes.cfc.services.artistServices();	
		artist = artistServices.getArtistByArtistId(artistId);
		artistName = artist.getArtistName();
	</cfscript>
	<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
		<cfhttpparam name="method" value="artist.getinfo" type="url" >
		<cfhttpparam name="artist" type="url" value="#artistName#">
		<!--- Enter your lastfm key here --->
		<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
	</cfhttp>
	<cfset mydoc = XmlParse(cfhttp.fileContent)>
	
	<cfscript>
		retObj.artistName = artistName;
		retObj.imgUrl = mydoc.lfm.artist.image[3].XmlText;
		retObj.summary = mydoc.lfm.artist.bio.summary.XmlText ;
		retObj.content =  mydoc.lfm.artist.bio.content.XmlText;
	</cfscript>
	
	<cfreturn retObj>
</cffunction>

<cffunction name="getArtistImages" access="remote" >
	<cfargument name="artistId">
	<cfset artistId = arguments.artistId>
	<cfscript>
		retObj = structNew();
		artistServices = new CFTunes.cfc.services.artistServices();	
		artist = artistServices.getArtistByArtistId(artistId);
		artistName = artist.getArtistName();
	</cfscript>
	<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
		<cfhttpparam name="method" value="artist.getImages" type="url" >
		<cfhttpparam name="artist" type="url" value="#artistName#">
		<cfhttpparam name="limit" type="url" value="10">
		<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
	</cfhttp>
	<cfset mydoc = XmlParse(cfhttp.fileContent)>
	
	<cfscript>
		arrLen = arraylen(mydoc.lfm.images.XmlChildren);
		imgUrls = arrayNew(1);
		j = 1;
		for(y=1 ; y <= arrLen; y++){
			imgUrl=mydoc.lfm.images["image"][y].sizes["size"][1].xmlText;
			iFormat = mydoc.lfm.images["image"][y].format.xmlText;
				arrayAppend(imgUrls,imgUrl);
		}
		retObj.imgUrls = imgUrls;
	</cfscript>
	
	<cfreturn retObj>
</cffunction>
<cffunction name="getTopTracks" access="remote" >
	<cfargument name="artistId">
	<cfset artistId = arguments.artistId>
	<cfscript>
		artistServices = new CFTunes.cfc.services.artistServices();	
		artist = artistServices.getArtistByArtistId(artistId);
		artistName = artist.getArtistName();
	</cfscript>
	<cfhttp url="http://ws.audioscrobbler.com/2.0/" method="get" charset="utf-8" >
		<cfhttpparam name="method" value="artist.getTopTracks" type="url" >
		<cfhttpparam name="artist" type="url" value="#artistName#">
		<!--- Enter your lastfm key here --->
		<cfhttpparam name="api_key" type="url" value="#Application.lastfmkey#">
	</cfhttp>
	<cfset mydoc = XmlParse(cfhttp.fileContent)>
	
	<cfscript>
		retArray = arrayNew(1);
		arrLen = arraylen(mydoc.lfm.toptracks.XmlChildren);
		topTracks = arrayNew(1);
		for(y=1 ; y <= arrLen; y++){
			retObj = structNew();
			retObj.trackName = mydoc.lfm.toptracks["track"][y].name.xmlText;
			trackNode = mydoc.lfm.toptracks["track"][y];
			if(isDefined("trackNode.image")){
				retObj.trackImgUrl = mydoc.lfm.toptracks["track"][y].image[4].XmlText;
				
			}
			arrayAppend(retArray,retObj);
		}
	</cfscript>
	
	<cfreturn retArray>
</cffunction>
</cfcomponent>