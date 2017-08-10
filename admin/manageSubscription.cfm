<cfscript>
	if(IsDefined("session.STATUS")){
		StructDelete(Session,"STATUS");
	}
</cfscript>

<div style="margin-top:50px" align="center">
	<cfprogressbar name="mailProgressbar" bind="cfc:CFTunes.cfc.util.progressBarMail.getstatus()" interval="1700" width="502" oncomplete="onfinishMailProcess"/>
</div>


<!---<cfinclude template="../admin/mailGrid.cfm">--->