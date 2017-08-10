<cfform preservedata="true" action="#cgi.script_name#">
	<cfinput type="text" name="searchString" id="searchString">
	<cfinput type="submit" name="submit" value="Search">
</cfform>

<cfif isDefined("form.submit")>
	<cfif isDefined("form.searchString") AND (form.searchString IS NOT "")>
		<cfscript>
			x = Form.searchString & "*";
		</cfscript>
		<cfsearch name="mySearch" collection="cftunes" criteria="#x#">
		<cfdump var = "#mySearch#" />
	</cfif>
</cfif>