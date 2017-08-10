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

<!---<cfscript>
	form.day = "02";
	form.month = "12";
	form.year = "1983";
	x = CreateDateTime(form.year, form.month, form.day, 0, 0, 1);	
</cfscript>
<cfdump var="#x#">--->