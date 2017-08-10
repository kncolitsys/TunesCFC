<cfscript>
	songService = new CFTunes.cfc.services.SongServices();
	genres = songService.getAllGenres();
</cfscript>
<cfoutput>
<!---	<table align="center" cellspacing="110">	
		<tr>
			<td><img height="150px" height="150px" src="../img/#genres[1].getImageUrl()#" /></td>
			<td><img height="150px" height="150px" src="../img/#genres[2].getImageUrl()#" /></td>
			<td><img height="150px" height="150px" src="../img/#genres[3].getImageUrl()#" /></td>
		</tr>
		<tr>
			<td><img height="150px" height="150px" src="../img/#genres[4].getImageUrl()#" /></td>
			<td><img height="150px" height="150px" src="../img/#genres[5].getImageUrl()#" /></td>
			<td><img height="150px" height="150px" src="../img/#genres[6].getImageUrl()#" /></td>
		</tr>
		<tr>
			<td><img height="150px" height="150px" src="../img/#genres[7].getImageUrl()#" /></td>
			<td><img height="150px" height="150px" src="../img/#genres[8].getImageUrl()#" /></td>
			<td><img height="150px" height="150px" src="../img/#genres[9].getImageUrl()#" /></td>
		</tr>
	</table>--->
	
	<table align="center" cellspacing="110">	
		<tr>
			<td><img height="100%" width="100%" src="../img/poweredByCF3.jpg" /></td>
			<td><img height="100%" width="100%" src="../img/poweredByAs.jpg" /></td>
			<td><img height="100%" width="100%" src="../img/poweredByExt.jpg" /></td>
		</tr>
		<tr>
			<td><img height="100%" width="100%" src="../img/poweredByIMAP.jpg" /></td>
			<td><img height="100%" width="100%" src="../img/poweredByORM.jpg" /></td>
			<td><img height="100%" width="100%" src="../img/poweredBySolr.jpg" /></td>
		</tr>
	</table>	
	
	


	<!---<cfset i = 0>
	<cfloop array="#genres#" index="genre" >
		<cfscript>
			i++;
			if(i%3 == 0 ){
				newRow = true;
			}else{
				newRow = false;
			}
		</cfscript>
		<cfif newRow>
			<br />
		</cfif>
					<span>
						<img height="125px" height="125px" src="../img/#genre.getImageUrl()#" />
					</span>
	</cfloop>--->
</cfoutput>