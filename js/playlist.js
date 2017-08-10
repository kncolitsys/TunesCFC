var playlistDetailsCallback = function (){
	playlistId = CFTunesVars.selPlaylistId;
	new CFTunes.playlistDetailsSection(playlistId);
	ColdFusion.Layout.createTab('playlistCommentSection', 'commentTab', 'Comments', '../playlist/playlistComments.cfm?playlistId='+playlistId,{selected:true, closable:false, callbackHandler:playlistCommentsCallback ,} )
}

function playlistCommentsCallback(){
	ratingDivs = Ext.fly('commentsTable').select('div.ratingStars');
	
	arrRatingDivs = ratingDivs.elements;
	
	for(i=0;i < arrRatingDivs.length;i++){
		obj = arrRatingDivs[i];
		new CFTunes.Rating(obj);
	}
	
	
//	new CFTunes.Rating('rating2');
//	new CFTunes.Rating('rating3');
}

function playlistLinkClicked(playlistId,playlistName){
	// name="playlistsTabs"
	CFTunesVars.selPlaylistId = playlistId;
	ColdFusion.Layout.createTab('playlistsTabs', 'tabPlaylist_'+playlistId, playlistName, '../playlist/playlistDetails.cfm?playlistId='+playlistId,{selected:true, closable:true, callbackHandler:playlistDetailsCallback ,} )
//	ColdFusion.navigate('../playlist/playlistDetails.cfm?playlistId='+playlistId,'mainContainerCFDiv',playlistDetailsCallback);
}



CFTunes.playlistDetailsSection = Ext.extend(Object,{
	constructor:function(playlistId){
		this.playlistId = playlistId;
		this.initSection();
	},
	initSection:function(){
		new CFTunes.songGrid('songGridSelectedPlaylist');
		new CFTunes.songGridToolBarPlaylist(this.playlistId,'selectedPlaylistToolbar');
	//	ColdFusion.Layout.createTab('playlistsTabs', 'tabPlaylist_'+playlistId, playlistName, '../playlist/playlistDetails.cfm?playlistId='+playlistId,{selected:true, closable:true, callbackHandler:playlistDetailsCallback ,} )
// playlistCommentSection
		
	}
});


function addCommentsClicked(playlistId){
	var url = "../playlist/commentNew.cfm?playlistId=" + playlistId;
	ColdFusion.navigate(url, "popUpAddComment",createToolbarForNewComment);		
	ColdFusion.Window.show("popUpAddComment");
	ColdFusion.Window.onHide("popUpAddComment", onhideNewCommentWindow);
}

function createToolbarForNewComment(){
	// also create the rating widget
	new CFTunes.Rating('newCommentRating');
	
	new Ext.Toolbar({
    	renderTo: 'newCommentToolBar',
    	items: [{
			xtype: 'tbbutton',
			iconCls: 'acceptButton',
			text: 'Save',
			handler: saveComment
	    },{
 		   xtype: 'tbseparator'
		},{
			xtype: 'tbbutton',
			iconCls: 'cancelButton',
			text: 'Cancel',
			handler: cancelComment
	    }]
	  });
}

function onhideNewCommentWindow(){
	
}

var cancelComment = function(){
	ColdFusion.Window.hide('popUpAddComment');
}

var submitCallbackComment = function (response){
	var structResponse = ColdFusion.JSON.decode(response);
	var valid = false;
	var playlistId = parseInt(structResponse.PLAYLISTID) ;
	
	var eMessages = "";
	if(structResponse.errors == undefined){
		var valid = true;
		for(i in structResponse.errors){
				eMessages = eMessages + errors[i] + "<br />";
				valid = false;
			}
		
	}
	if (valid) {
		showInfoMessage("Comment sucessfully saved", "");
		ColdFusion.Window.hide("popUpAddComment");
		var url = "../playlist/playlistCommentList.cfm?playlistId="+playlistId;
		ColdFusion.navigate(url, "playlistCommentList",playlistCommentsCallback); //playlistCommentsCallback()
	}
	else {
		showErrorMessage(eMessages, "");
	}

	
}

var saveComment = function(){
	ColdFusion.Ajax.submitForm("commentForm", "../playlist/newCommentCon.cfm" , submitCallbackComment, errorHandler);
}