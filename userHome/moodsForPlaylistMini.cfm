<cfscript>
	formHandling = new CFTunes.cfc.services.playlistFormHandling();
	aMoods = formHandling.getAllMoodsOfTextBox();
</cfscript>				
<cfoutput>
	<ul class="niceList niceListMoods">
		<cfloop array="#aMoods#" index="mood">
			<li><a href="javascript:removeMoodFromTextBox('#mood.getMoodId()#')" onmouseout="Ext.get('img_mood_#mood.getMoodId()#').hide()" onmouseover="Ext.get('img_mood_#mood.getMoodId()#').show()"><span>#mood.getMoodName()#</span> <img id='img_mood_#mood.getMoodId()#' style="display:none" align="absbottom" src="../icons/bullet_delete.png" /></a></li>
		</cfloop>
	</ul>	
</cfoutput>
