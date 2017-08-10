<cfcomponent output="false">
	<cffunction name="moveFile" access="public">
		<cfargument name="source" required="true">
		<cfargument name="destination" required="true">
		<cffile action = "move" source = "#arguments.source#" destination = "#arguments.destination#">
    </cffunction>
</cfcomponent>