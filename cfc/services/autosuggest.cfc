<cfcomponent>
	
	<cffunction name="getTagSuggestion" access="remote" returntype="array" output="false">
		<cfargument name="suggestvalue" required="true">
		
		<cfset tempArr = arrayNew(1)>
		<cfloop list="#suggestvalue#" index="r" delimiters=" ">
			<cfset arrayAppend(tempArr,r)>
		</cfloop>
		
		<cfset x= tempArr[arraylen(tempArr)]>

		
		<!--- The function must return suggestions as an array. --->
		<cfset var myarray = ArrayNew(1)>
		
		<!--- Get all unique last names that match the typed characters. --->
		<cfquery name="getDBNames" datasource="cftunes">
			SELECT DISTINCT TAGNAME FROM Tag
			WHERE TAGNAME LIKE <cfqueryparam value="#x#%" cfsqltype="cf_sql_varchar">
		</cfquery>
		<!--- Convert the query to an array. --->
		
		<cfif arraylen(tempArr) eq 1> <!--- if array length is dont put spaces --->
			<cfloop query="getDBNames">
				<cfset arrayAppend(myarray, LTrim(tagname))>
			</cfloop>
			<cfreturn myarray>
		<cfelse>	
			<cfset appString = "">
			<cfset ArrayDeleteAt(tempArr, arraylen(tempArr))>
			<cfloop array="#tempArr#" index="z">
				<cfset appString = appString & " " & z>
            </cfloop>
			<cfset sAppend = LTrim(appString)> 
			<cfloop query="getDBNames">
				<cfset itm = sAppend & " " & tagname>
				<cfset arrayAppend(myarray, LTrim(itm))>
			</cfloop>
			<cfreturn myarray>
		</cfif>
	</cffunction>
	
	
	
	
</cfcomponent>