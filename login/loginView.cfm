<cflogin>
	<cfif NOT IsDefined("cflogin")>
		<cfinclude template="loginForm.cfm">
	<cfelse>
	<cfscript>
		userServices = new CFTunes.cfc.services.userServices();
		userRoles = "";
		x = userServices.authenticateUser(cflogin.name,cflogin.password);
		if(x){
			userRoles = userServices.getUserRoleAsString(cflogin.name);
			userObj = userServices.getUserObjByUserName(cflogin.name);
			session.userObj = userObj;
		}
	</cfscript>
		<cfif NOT x>
			<cfoutput ><div style="color:red"> Either Username or Password is Incorrect</div></cfoutput>
			<cfinclude template="loginForm.cfm">
		<cfelse>	
		<cfloginuser name="#cflogin.name#" password = "#cflogin.password#" roles="#userRoles#">
        </cfif>
	</cfif>
</cflogin>
<cfif IsUserLoggedIn()>
		<cflocation  addtoken="false" url="../home/home.cfm">
</cfif>