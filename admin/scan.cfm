<cfset dir = Application.uploadDir & "\">
<cfset songDir = Application.mp3Dir & "\" >
<cfdirectory action="list" directory="#dir#" filter="*.mp3" name="music">
<CFOBJECT type="java"  class="com.ozeetee.ProcessMp3" name="myObj">
<cfset y = myObj.init()>
<cfset songQuery = QueryNew("fileName,name,album,artist,genre,tempImage")>
<cfset i =1>
<cfloop query="music" >
		<cfset filename = dir & name>
		<cfset y.mp3File = filename>
		<cfset mp3FileName = "">
		<cfset y.process()>
		<cfloop array="#y.artworks#" index="artwork">
			<cfset mimeType="#artwork.getMimeType()#">
			
			<cfscript>
				util = new CFTunes.cfc.util.Util();
				extension = util.getExtensionByMime(mimeType);
			</cfscript>
			
			<cfset mp3FileName = i & "."& extension>
			<cfset destination = Application.tempDir & "\"& mp3FileName>
			<cfimage overwrite="true" action = "write"
				 source = "#artwork.getBinaryData()#"
				 destination="#destination#">
        </cfloop>
		<cfscript>
			newRow = QueryAddRow(songQuery);
			QuerySetCell(songQuery, "fileName", name );
			QuerySetCell(songQuery, "name", y.title );
			QuerySetCell(songQuery, "album", y.album );
			QuerySetCell(songQuery, "artist", y.artist);
			QuerySetCell(songQuery, "genre", y.genre);
			QuerySetCell(songQuery, "tempImage", mp3FileName);
		</cfscript>
		<cfset i++>
</cfloop>
<cfset Session.songQuery = songQuery>
		<!-- Song Grid starts here -->
<div align="center">
		<cfform name="songGridForm" method="post">
			<cfgrid name="songGrid"
					selectmode="edit"
					onchange="cfc:CFTunes.cfc.services.SongServices.modifySongQuery({cfgridaction},{cfgridrow},{cfgridchanged})"
					format="html"
					title="Songs"
					preservePageOnSort="true"
					autoWidth="true"
					query="songQuery"
					width="940"
					height="300"
					sort="true"
					stripeRows="true">
				<cfgridcolumn name="fileName" select="false" header="File Name" width="300" />
				<cfgridcolumn name="name" header="Title" width="300" />
				<cfgridcolumn name="artist" header="Artist"  />
				<cfgridcolumn name="album" header="Album"  />
				<cfgridcolumn name="genre" header="Genre" />
			</cfgrid>
			</cfform>
</div>		
<!-- Song Grid ends here -->