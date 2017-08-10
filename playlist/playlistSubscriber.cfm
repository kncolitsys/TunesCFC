<cfscript>
	playlistServices = new CFTunes.cfc.services.playlistServices();
	songQuery = QueryNew("songId,name,path,album,artist");
	aPlaylistRating = arrayNew(1);
	subscribers = arrayNew(1);
	if(isDefined("url.playlistId")){
		playlist = playlistServices.getPlaylistByPlaylistId(url.playlistId);
		subscribers = playlist.getSubscribers();
	}
</cfscript>

<cfif arraylen(subscribers) eq 0>
	No Subscribers of this playlist.
<cfelse>
	<div align="left">
	<table class="commentsTable"  style="margin-left:15px;margin-top:30px">
		<cfoutput >
		<cfset i = 0>
			<tr>
				<cfloop array="#subscribers#" index="sub">
					<cfif i%3 eq 0>
						<!--- change tr --->
						</tr>
						<tr>
					</cfif>
						<td >
								<img src="../img/user_photu.png" height="100px" width="100px"/><br />
								<div align="center"><h4>#sub.getUserName()#</h4></div>
						</td>
					<cfset i++>
				</cfloop>
				</tr>
			</cfoutput>
	</table>
	</div>
</cfif>

