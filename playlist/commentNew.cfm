<cfscript>
	if(isDefined("url.playlistId")){
		playlistId = url.playlistId;
	}

</cfscript>
<cfoutput>
<cfform name="commentForm" id="commentForm">
	<cfinput type="hidden" name="playlistId" value="#url.playlistId#">
	<div id="newCommentToolBar" style="width:735px"></div>
		<div id="newPlayListMainContainer">
	    	<div style="margin: 0pt auto; width:500px; height: 220px; text-align: left;">
	        					<div style="height: 40px;">
	    								<span class="labelText">Rating:</span>
										<div id="newCommentRating" class="ratingStars">
											<input type="radio" name="newCommentRating" value="1" title="Very poor">
											<input type="radio" name="newCommentRating" value="2" title="Poor">
											<input type="radio" name="newCommentRating" value="3" title="Average">
											<input type="radio" name="newCommentRating" value="4" title="Very Good">
											<input type="radio" name="newCommentRating" value="5" title="Perfect">
										</div> 
								</div>
								<div style="margin-top:5px">
					    			<cfinput type="checkbox" name="isFavorite">&nbsp;&nbsp;<span class="labelText">Add this to your favorite.</span>&nbsp;<img src="../icons/heart_add.png">
								</div>
								<div style="margin-top:6px">
	          					<div style="float: left; width: 470px; text-align: left; padding-top: 7px;margin-top:5px"><span class="labelText">Comment:</span> Write a comment for this playlist.</div>
					    	 	<cftextarea tabindex="102" maxlength="5000"  style="width: 400px; height: 80px;" class="form-textarea" id="desc" name="comment" >
								</cftextarea>
								</div>
			 	
				</div>
    	</div>
</cfform>
</cfoutput>