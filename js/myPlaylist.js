var renderToolbar = function()
{
	  new Ext.Toolbar({
	    renderTo: 'myPlaylistToolBar',
	    items: [{
			xtype: 'tbbutton',
			iconCls: 'addPlaylist',
			text: 'New Playlist',
			handler: showNewPlaylist
	    	}]
		  });
}
var showNewPlaylist = function(){
	var url = "../userHome/newPlaylist.cfm"
	ColdFusion.navigate(url, "popUpWindowPlaylist",createToolbarForAddPlaylist);		
	ColdFusion.Window.show("popUpWindowPlaylist");
	ColdFusion.Window.onHide("popUpWindowPlaylist", onhidePlaylistWindow);
}

var onhidePlaylistWindow = function(){
	var formHandling = new  playlistFormHandling();
	formHandling.destroySessionData();
}

var createToolbarForAddPlaylist = function(){
	new Ext.Toolbar({
    	renderTo: 'newPlaylistToolBar',
    	items: [{
			xtype: 'tbbutton',
			iconCls: 'acceptButton',
			text: 'Save',
			handler: savePlaylist
	    },{
 		   xtype: 'tbseparator'
		},{
			xtype: 'tbbutton',
			iconCls: 'cancelButton',
			text: 'Cancel',
			handler: cancelPlaylist
	    }]
	  });
} // cancelButton

var cancelPlaylist = function(){
	ColdFusion.Window.hide('popUpWindowPlaylist');
}

function savePlaylist() {
    ColdFusion.Ajax.submitForm("playlistForm", "../userHome/newPlaylistCon.cfm", submitCallbackPlaylist, errorHandlerPlaylist);
}

function submitCallbackPlaylist(response){
	var errors = ColdFusion.JSON.decode(response);
	var valid = true;
	var message = "";
	for(i in errors){
			eMessages = message + errors[i] + "<br />";
			valid = false;
		}
	if(valid){
		showInfoMessage("Playlist sucessfully saved","");
		ColdFusion.Window.hide("popUpWindowPlaylist");
		ColdFusion.Layout.selectAccordion('userPlaylistPanel','myPlaylistAccord');
		var url = "../userHome/myPlaylistMini.cfm"
		ColdFusion.navigate(url, "myPlaylistAccord");
	}else{
		if(! ColdFusion.MessageBox.isMessageBoxDefined('playlistError')){
			ColdFusion.MessageBox.create("playlistError", "alert", "Validation Error", eMessages, destoryMessageBox,{icon:'error'});
		}else{
			ColdFusion.MessageBox.update("playlistError",{message:eMessages});
		}
		ColdFusion.MessageBox.show("playlistError");
	}
}




var addSubGenreToTextBox = function(subGenreId){ 
	var formHandling = new  playlistFormHandling();
	formHandling.addSubGenreToTextBox(subGenreId);
	var url = "../userHome/subGenreForPlaylistMini.cfm"
	ColdFusion.navigate(url, "playlistGenreBox");
}


var removeSubgenreFromTextBox = function(subGenreId){
	var formHandling = new  playlistFormHandling();
	formHandling.removeSubGenreToTextBox(subGenreId);
	var url = "../userHome/subGenreForPlaylistMini.cfm"
	ColdFusion.navigate(url, "playlistGenreBox");
}

var addMoodToTextBox = function(moodId){
	var formHandling = new  playlistFormHandling();
	formHandling.addMoodToTextBox(moodId);
	var url = "../userHome/moodsForPlaylistMini.cfm"
	ColdFusion.navigate(url, "playlistMoodBox");
}

var removeMoodFromTextBox = function(moodId){
	var formHandling = new  playlistFormHandling();
	formHandling.removeMoodFromTextBox(moodId);
	var url = "../userHome/moodsForPlaylistMini.cfm"
	ColdFusion.navigate(url, "playlistMoodBox");
}






function destoryMessageBox(){
	
}

function errorHandlerPlaylist(code, msg)
{
    alert("Error!!! " + code + ": " + msg);
}



function playlistLinkClickedMyPlaylist(playlistId){
	CFTunesVars.selPlaylistId = playlistId;
	var url = '../userHome/myPlaylistGrid.cfm?playlistId='+playlistId;
	ColdFusion.navigate(url,'songList',playlistLinkMyPlaylistCallback,errorHandlerPlaylist);
}

function playlistLinkMyPlaylistCallback(){
	playlistId = CFTunesVars.selPlaylistId;
	new CFTunes.playlistDetailsSection(playlistId);
}



