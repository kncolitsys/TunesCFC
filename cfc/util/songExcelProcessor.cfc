<cfcomponent>

	<cffunction name="processQuery">
		<cfargument required="true" type="query" name="xlQuery">
		<cfscript>
			retQ = QueryNew("artistName,album,charges");
			flag1 = false;
			flag2 = false;
			noOfRecord = 0;
			for(i=3; i <= arguments.xlQuery.recordCount;i++){
				newRow = QueryAddRow(retQ);
				QuerySetCell(retQ, "artistName", arguments.xlQuery.COL_1[i]);
				QuerySetCell(retQ, "album", arguments.xlQuery.COL_2[i]);
				price = arguments.xlQuery.COL_3[i]; // remove doubleQuotes
				z = Replace(price, chr(34), '' ,'ALL');
				QuerySetCell(retQ, "charges", LSParseCurrency(z));
				nextQ= i + 1;
				if(arguments.xlQuery.COL_1[nextQ] == ""){
					break;
				}
			}
			return retQ;
		</cfscript>
	</cffunction>
</cfcomponent>