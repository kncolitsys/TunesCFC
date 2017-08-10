/**
 * @author gtiwari
 */

Ext.ns('CFTunes');
var CFTunesPlayer;
var CFTunesVars = new Object();


function showInfoMessage(sMessage,sTitle){
		if(sTitle == ""){
			sTitle = "Information";
		}
		if(! ColdFusion.MessageBox.isMessageBoxDefined('messageAlert')){
			ColdFusion.MessageBox.create("messageAlert", "alert", sTitle, sMessage, dummyFunction,{icon:'info'});
		}else{
			ColdFusion.MessageBox.update("messageAlert",{message:sMessage,title:sTitle});
		}
		ColdFusion.MessageBox.show("messageAlert");
}

function showErrorMessage(sMessage,sTitle){
		if(sTitle == ""){
			sTitle = "Error";
		}
		if(! ColdFusion.MessageBox.isMessageBoxDefined('messageAlert')){
			ColdFusion.MessageBox.create("messageAlert", "alert", title, sMessage, dummyFunction,{icon:'error'});
		}else{
			ColdFusion.MessageBox.update("messageAlert",{message:sMessage,title:sTitle});
		}
		ColdFusion.MessageBox.show("messageAlert");
}

function dummyFunction(){
	
}

function errorHandler(code, msg)
{
    showErrorMessage("Error!!! " + code + ": " + msg);
}

function initRatingWidget(){
	aRatingWidget = $$('div.ratingStars'); 

	Ext.each(aRatingWidget, function(num){
		sId = num.id;
		   new Ext.ux.Rating(sId, {
	        canReset: false,
	        split: 2
	    });
	});
}