<cfcomponent>
	<cffunction name="createSpreadSheet" access="remote" >
		<cfscript>
			if(! isDefined("session.STATUS")){
				session.STATUS = 0.1;
				session.statusMessage="Creating Spreadsheet...";
			}
		</cfscript>
			<cfset session.STATUS = 0.4>
			<cfset gtQuery = Session.gtQuery>
				<cfscript>
					retQ = QueryNew("artistName,album,charges");
					newRow = QueryAddRow(retQ);
					QuerySetCell(retQ, "artistName", "Artist Name");
					QuerySetCell(retQ, "album", "Album");
					QuerySetCell(retQ, "charges", "Charges");
					
					newRow2 = QueryAddRow(retQ);
					QuerySetCell(retQ, "artistName", "");
					QuerySetCell(retQ, "album", "");
					QuerySetCell(retQ, "charges", "");
					newRow3 = QueryAddRow(retQ);
					QuerySetCell(retQ, "artistName", "");
					QuerySetCell(retQ, "album", "");
					QuerySetCell(retQ, "charges", "");
				</cfscript>
				<!---<cfquery dbtype="query" name="combinedQuery">
					SELECT * FROM retQ UNION SELECT * FROM gtQuery
                </cfquery>--->
				
				<cfset totalCost = 0>
				<cfloop query="gtQuery">
					<cfset totalCost = totalCost + #charges#>
				</cfloop>
				
				<cfscript>
					j = QueryNew("artistName,album,charges");
					newRow3 = QueryAddRow(j);
					QuerySetCell(j, "artistName", "");
					QuerySetCell(j, "album", "Total Cost");
					QuerySetCell(j, "charges", totalCost);
				</cfscript>
				<cfquery dbtype="query" name="masterQuery">
					SELECT * FROM gtQuery UNION SELECT * FROM j order by charges
                </cfquery>
				<cfset session.STATUS = 0.6>
				
				<cfscript>	
					theSheet = SpreadsheetNew("subscriptionData");
					SpreadsheetAddRows(theSheet,masterQuery);
				</cfscript>
				<cfset session.STATUS = 0.7>
				<cfspreadsheet action="write" filename="#Application.webroot#\CFTunes\excel\subscriptionCharges.xls"
						name="theSheet"	sheet=1 sheetname="subscriptionCharges" overwrite=true>
			<cfset session.STATUS = 1>
			<cfset session.statusMessage="Done" >
	</cffunction>
</cfcomponent>