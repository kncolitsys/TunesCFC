<cfscript>
	private void function addUser(){
		var userServices = new CFTunes.cfc.services.userServices();
		var user = StructNew();
		user.email = "gt@gmail.com";
		user.password = "gt";
		user.userName = "gt";
		userServices.addUser(user);
	}
	addUser();
</cfscript>
