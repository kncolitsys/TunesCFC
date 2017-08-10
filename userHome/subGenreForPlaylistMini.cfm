<cfscript>
	formHandling = new CFTunes.cfc.services.playlistFormHandling();
	aSubGenre = formHandling.getAllSubgenreOfTextBox();
</cfscript>				
<cfoutput>
	<ul class="niceList ">
		<cfloop array="#aSubGenre#" index="subgenre">
			<li><a href="javascript:removeSubgenreFromTextBox('#subgenre.getSubgenreId()#')" onmouseout="Ext.get('img_subgenre_#subgenre.getSubgenreId()#').hide()" onmouseover="Ext.get('img_subgenre_#subgenre.getSubgenreId()#').show()"><span>#subgenre.getSubgenreName()#</span> <img id='img_subgenre_#subgenre.getSubgenreId()#' style="display:none" align="absbottom" src="../icons/bullet_delete.png" /></a></li>
		</cfloop>
	</ul>	
</cfoutput>
