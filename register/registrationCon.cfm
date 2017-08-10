<cfset errorInForm = false>
<cfset errorStruct = structNew()>
<cfif isDefined("form.submit")>
	<!--- First check if there is any error --->
	<cfscript>
		userServices = new CFTunes.cfc.services.userServices();
		if(Len(form.userName) < 2){
			errorStruct.userNameError = "User name is too short";
		}
		if(Len(form.userName) > 10){
			errorStruct.userNameError = "User name is too long";
		}
		if(userServices.isUserNameExist(form.userName)){
			errorStruct.userNameError = "User name Exists";
		}
		
		if(){
			
		}
		
	</cfscript>
	
</cfif>

<cfscript>
	userObj = new CFTunes.cfc.model.user();
	// dob = "#ToString(form.day)#_#ToString(form.month)#_#ToString(form.year)#";
	dob = CreateDateTime(form.year, form.month, form.day, 0, 0, 1);
	userObj.setemail(form.emailAddress);
	userObj.setpassword(form.password);
	userObj.setuserName(form.userName);
	userObj.setGender(form.gender);
	userObj.setdob(dob);
	services = new CFTunes.cfc.services.userServices();
	services.addUser(userObj);
</cfscript>
<cflocation addtoken="false" url="../login/login.cfm">