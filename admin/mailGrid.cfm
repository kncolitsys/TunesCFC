<cfset mailHeaders = Session.mailHeaderQuery>

<div align="center" style="margin-top:20px" id="adminMailTable">
	<div style="width:940px" align="left"><input type="button" onclick="getExcelGrid()" value="Process Emails"></div>
		<cfform name="mailGridForm" id="mailGridForm" style="margin-top:10px">
			<div class="mailTableDiv">
			<table class="mailTable">
				<tr>
					<th scope="col" style="text-align:center"><input type="checkbox" value="master" /></th>
					<th scope="col">FROM</th>
					<th scope="col">SUBJECT</th>
				</tr>
				<cfoutput>
				<cfloop query="mailHeaders">
					<tr>
						<td align="center"><cfinput name="ckBox_#UID#" type="checkbox"  id="ckBox_#UID#" class="adminMailTableCheckBox" value="#UID#" /></td>
						<td>#FROM#</td>
						<td>#SUBJECT#</td>
					</tr>
		        </cfloop>
				</cfoutput>
			</table>
			</div>
        </cfform>
		
		<cfdiv style="margin-top:20px" id="myMailGrid">
			
		</cfdiv>
		
		<div style="margin-top:20px"><img src="../img/poweredByIMAP_small.jpg"> </div>
</div>
