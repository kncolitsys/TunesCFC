<cftry>
<cfscript>
	playlistServices = new CFTunes.cfc.services.playlistServices();
	aPlaylistRating = arrayNew(1);
//	writeOutput(url.playlistId);
	if(isDefined("url.playlistId")){
		playlist = playlistServices.getPlaylistByPlaylistId(url.playlistId);
		playlistId = url.playlistId;
		aPlaylistRating = playlist.getPlaylistRatings();
	}
</cfscript>	
<cfcatch type="Any" >
</cfcatch>
</cftry>
<table class="commentsTable" id="commentsTable" style="margin-left:15px;margin-top:30px">
	<cfloop array="#aPlaylistRating#" index="playlistRating">
			<tr>
				<td valign="top"><img src="../img/user_photu.png" height="50px" width="50px"/></td>
				<td width="10px"></td>
				<td>
					<td valign="top" style="border: 0px none ; text-align: left;">
							<cfset rating = playlistRating.getRating()>
							<cfset rating1 = "">
							<cfset rating2 = "">
							<cfset rating3 = "">
							<cfset rating4 = "">
							<cfset rating5 = "">
								<cfswitch expression="#rating#">
								<cfcase value="0">
								</cfcase>
								<cfcase value="1">
									<cfset rating1 = "checked='true'">
								</cfcase>
								<cfcase value="2">
									<cfset rating2 = "checked='true'">
								</cfcase>
								<cfcase value="3">
									<cfset rating3 = "checked='true'">
								</cfcase>
								<cfcase value="4">
									<cfset rating4 = "checked='true'">
								</cfcase>
								<cfcase value="5">
									<cfset rating5 = true>
								</cfcase>
							</cfswitch>
							<cfoutput>
								<div id="rating2" class="ratingStars">
									<input disabled="true" #rating1# type="radio" name="rating_#playlistRating.getRatingId()#" value="1" title="Very poor">
									<input disabled="true" #rating2# type="radio" name="rating_#playlistRating.getRatingId()#" value="2" title="Poor">
									<input disabled="true" #rating3# type="radio" name="rating_#playlistRating.getRatingId()#" value="3" title="Average">
									<input disabled="true" #rating4# type="radio" name="rating_#playlistRating.getRatingId()#" value="4" title="Very Good">
									<input disabled="true" #rating5# type="radio" name="rating_#playlistRating.getRatingId()#" value="5" title="Perfect">
								</div> 
						           <div style="padding: 0pt 50px 4px 0pt;">#playlistRating.getComment()#</div>
						           <div style="color: rgb(142, 155, 170); font-size: 10px;">Submitted by <a style="color: rgb(115, 173, 200);" href="##">#playlistRating.getRatedBy().getUserName()#</a> on #playlistRating.getRatedOn()# </div><br/><br/>
							</cfoutput>
				   <br/>
		          </td>
				</td>
			</tr>
    </cfloop>
</table>