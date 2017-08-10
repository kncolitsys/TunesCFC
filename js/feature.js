/**
 * @author gtiwari
 */
	var myself;
	
	function sayHello(){
		alert("Hi");
	}
	
	function initializeApp(mySelf){
		myself = mySelf;
	}

	function newGroup(){
		var url = myself+"showNewGroupForm" ;
		ColdFusion.navigate(url, "popUpWindow");		
		ColdFusion.Window.show("popUpWindow");
	}
	
	function newFeature(){
		var url = "newFeature.cfm" ;
		ColdFusion.navigate(url, "featureWin");		
		ColdFusion.Window.show("featureWin");
	}
	
	
    function submitCallbackGroup(response){
		ColdFusion.Window.hide("popUpWindow");
		var url = myself+"ShowManageGroupsForm" ;
		ColdFusion.navigate(url, "centerPane");
    }
	
	function submitCallbackUser(response){
		ColdFusion.Window.hide("popUpWindow");
		var url = myself + "ShowManageUsersForm" ;
		ColdFusion.navigate(url, "centerPane");
	}
	
	function editGroup(groupId){
		var url = myself+"showNewGroupForm&groupId="+groupId ;
		ColdFusion.navigate(url, "popUpWindow");		
		ColdFusion.Window.show("popUpWindow");
	}
	
	function editUser(userId){
		var url = myself+"showUserForm&userId="+userId ;
		ColdFusion.navigate(url, "popUpWindow");		
		ColdFusion.Window.show("popUpWindow");
	}
	
	function newUser(){
		var url = myself+"showUserForm" ;
		ColdFusion.navigate(url, "popUpWindow");		
		ColdFusion.Window.show("popUpWindow");
	}
