<cfscript>
	playlistServices = new CFTunes.cfc.services.playlistServices();
	songQuery = QueryNew("songId,name,path,album,artist");
	aPlaylistRating = arrayNew(1);
	if(isDefined("url.playlistId")){
		playlist = playlistServices.getPlaylistByPlaylistId(url.playlistId);
		playlistId = url.playlistId;
		aPlaylistRating = playlist.getPlaylistRatings();
	}
</cfscript>
<div align="left">
<table cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td width="700px" valign="top">
			<cfdiv id="playlistCommentList">
				<cfinclude template="../playlist/playlistCommentList.cfm" >
			</cfdiv>
		</td>
		<td valign="top">
		
		
			<table align="center" style="margin-top:10px" cellspacing="20px">
				<tr>
					<td>
						<cfoutput><a href="javascript:addCommentsClicked(#url.playlistId#)"></cfoutput>
						<div style="width:400px;height:25px;border:1px ridge">
							<table width="100%">
								<tr>
									<td><!--- img src="../img/comments.png" ---></td>
									<td>
										<b>Add a comment</b>
									</td>
								</tr>
							</table>
						</div>
						</a>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>	
			
				
		</td>
	</tr>
</table>


</div>

