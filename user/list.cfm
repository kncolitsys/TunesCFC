<cfset usrObjectArr=EntityLoad('user')>
<table>
	<cfloop array="#usrObjectArr#" index="usrObj">
	<tr>
	<cfoutput>
		<b>#usrObj.getUserId()#</b>
	</cfoutput>
	</tr>
	</cfloop>
</table>