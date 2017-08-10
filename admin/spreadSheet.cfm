<!---<cfdump var="#CFHTTP#">
<cfheader name="Cache-Control" value="no-cache, must-revalidate">--->
<cfheader name="Expires" value="#GetHttpTimeString(Now())#">
<cfscript>
	if(structKeyExists(Session,"gtQuery")){
		structDelete(Session,"gtQuery");
	}
</cfscript>
<cfset fieldNames = form.FIELDNAMES>
<cfset aUID = arrayNew(1)>
<cfloop list="#fieldNames#" index="r" delimiters=",">
	<cfscript>
		if(Left(r, 5) == "CKBOX"){
			arrayAppend(aUID,form[r]);
		}
	</cfscript>
</cfloop>

<cfscript>
	d = ArrayToList(aUID,",");
	imapServices = new CFTunes.cfc.services.IMAPServices();
	qMails = imapServices.fetchMails(d);
	xlProcessor = new CFTunes.cfc.util.songExcelProcessor();
	theSheet = SpreadsheetNew("queryData");
	qArray = arrayNew(1);
</cfscript>

<cfloop query="qMails">
	<cfspreadsheet
	action="read"
	columns="2-4"
	src = "#Application.attachmentDir#\#ATTACHMENTS#"
	query="xlData">
	<cfscript>
		filterQ =  xlProcessor.processQuery(xlData);
	</cfscript>
	<cfif !isDefined("Session.gtQuery")>
		<cfset Session.gtQuery = filterQ>
	<cfelse>
		<cfset gg = Session.gtQuery>
		<cfquery name="tempQuery" dbtype="query">
			SELECT * FROM gg UNION SELECT * FROM filterQ
        </cfquery>
		<cfset Session.gtQuery = tempQuery>
	</cfif>
</cfloop>

		<cfset hnyQuery = Session.gtQuery>
		<div align="center">
					<cfform name="adminSSheetForm" method="post">
						<cfgrid name="adminSSheet"
								format="html"
								preservePageOnSort="true"
								autoWidth="true"
								query="hnyQuery"
								width="940"
								height="300"
								sort="true"
								title="Subscription Charges"
								stripeRows="true">
							<cfgridcolumn name="artistName" header="ARTIST" width="200"/>
							<cfgridcolumn name="album" header="ALBUM" width="540" />
							<cfgridcolumn name="charges" header="CHARGES IN $" width="200" />
						</cfgrid>
						</cfform>

<cfset totalCost = 0>
<cfset num = 0>
			<table cellspacing="55px">
				<tr>
					<td>
						<cfpod 	height = "350"
								name = "subscriptionStats"
								title = "Subscription Stats"
								width = "400">
							<cfchart>
								<cfchartseries type="pie">
									<cfloop query="Session.gtQuery">
										<cfset totalCost = totalCost + #charges#>
										<cfset num++>
										<cfchartdata item="#ALBUM#" value="#charges#">
									</cfloop>
								</cfchartseries>
							</cfchart>
						</cfpod>
					</td>
					<td>
						<cfpod 	height = "350"
								name = "subscriptionStats2"
								title = "Subscription Stats"
								width = "400">
							<div style="margin-top:10px">Total Albums:-<cfoutput>#num#</cfoutput><br/> Total Cost:-<cfoutput >$ #totalCost#</cfoutput></div>
						</cfpod>
					</td>
				</tr>
			</table>
			
			
			
			
			
						
			</div>