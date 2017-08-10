<cfajaxproxy cfc="CFTunes.cfc.services.Ajaxservices" jsclassname="ajaxServices">
<script type="text/javascript">
	startProgress = function(artistId) {
		ColdFusion.ProgressBar.start("mydataProgressbar");
	};
	onfinish = function () {
		eDiv = Ext.get('downloadLink');
		eDiv.show();
	};
</script>
<cfscript>
	if(IsDefined("session.STATUS")){
		StructDelete(Session,"STATUS");
	}
	artistServices = new CFTunes.cfc.services.artistServices();
	if(IsDefined("url.artistId")){
		artist = artistServices.getArtistByArtistId(url.artistId);
		Session.artistId = url.artistId;
	}
</cfscript>
<cfform>
<table align="center" style="margin-top:90px" cellspacing="20px">
	<tr>
		<td>
			<cfoutput>
			<a href="##" onClick="startProgress('#url.artistId#')">
			<div style="width:500px;height:200px;border:1px ridge">
				<table>
					<tr>
						<td><img src="../img/Microsoft Office - PowerPoint.png" height="200px" width="200px"></td>
						<td>
							<b>Generate a Presentation on #artist.getArtistName()#</b>
						</td>
					</tr>
				</table>
			</div>
			</a>
			</cfoutput>
		</td>
	</tr>
	<tr>
		<td><cfprogressbar name="mydataProgressbar" bind="cfc:CFTunes.cfc.util.progressBarCfc.getstatus()" interval="1700" width="502" oncomplete="onfinish"/></td>
	</tr>
		<tr>
		<td>
			<a href="artist.ppt" onClick=startProgress()>
			<div style="width:500px;border:1px ridge;display:none;" id="downloadLink">
				<table align="center">
					<tr>
						<td><img src="../icons/arrow_down.png" /></td>
						<td>
							Click here to download the presentation !!!
						</td>
					</tr>
				</table>
			</div>
			</a>
		</td>
	</tr>
</table>
</cfform>