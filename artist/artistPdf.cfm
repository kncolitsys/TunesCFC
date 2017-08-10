<!--- This section is not completed yet --->

<script type="text/javascript">
	startProgress = function() {
		ColdFusion.ProgressBar.start("mydataProgressbar");
	};
	onfinish = function () {
		alert("Done");
	};
</script>
<cfscript>
	if(IsDefined("Session.STATUS")){
		StructDelete(Session,"STATUS");
	}
</cfscript>
<cfform>
<table align="center" style="margin-top:90px" cellspacing="20px">
	<tr>
		<td>
			<a href="##" onClick=startProgress()>
			<div style="width:500px;height:200px;border:1px ridge">
				<table>
					<tr>
						<td><img src="../img/PDF_File.png" height="200px" width="200px"></td>
						<td>
							<b>Generate a PDF on Linkin Park</b>
						</td>
					</tr>
				</table>
			</div>
			</a>
		</td>
	</tr>
	<tr>
		<td><cfprogressbar name="mydataProgressbar" bind="cfc:CFTunes.cfc.util.progressBarCfc.getstatus()" interval="1700" width="502" oncomplete="onfinish"/></td>
	</tr>
		<tr>
		<td>
			<a href="##" onClick=startProgress()>
			<div style="width:500px;border:1px ridge;display:block;">
				<table align="center">
					<tr>
						<td><img src="../icons/arrow_down.png" /></td>
						<td>
							Click here to download the PDF !!!
						</td>
					</tr>
				</table>
			</div>
			</a>
		</td>
	</tr>
</table>
</cfform>