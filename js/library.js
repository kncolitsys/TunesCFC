var genreButtonClicked = function(genreId){
	ColdFusion.navigate('../Library/subgenreMini.cfm?genreId='+ genreId,'subGenreDiv',genreHandler);
} 

var genreHandler = function(){
	// change this
	Ext.fly('artistDiv').dom.innerHTML = "";
	Ext.fly('albumDiv').dom.innerHTML = "";
}

var subGenreLinkClicked = function(subGenreId,rowId,tableId){
	highLightLink(rowId,tableId);
	ColdFusion.navigate('../Library/artistMini.cfm?subGenreId='+ subGenreId,'artistDiv',subGenreHandler);
}

var subGenreHandler = function(){
	Ext.fly("albumDiv").dom.innerHTML = "";
}

var globalArtistId;

var artistClicked = function(artistId,rowId,tableId){
	highLightLink(rowId,tableId);
	globalArtistId = artistId;
	ColdFusion.navigate('../Library/albumMini.cfm?artistId='+ artistId,'albumDiv',artistHandler);
	ColdFusion.navigate('../Library/artist.cfm?artistId='+ artistId,'lowerPanel',artistHandlerLowerPanel);
}

var artistHandler = function(){
	
}
var artistHandlerLowerPanel = function(){
	artistRenderer = new CFTunes.libraryArtistRenderer(globalArtistId);
	artistRenderer.renderToolbar();
}

var globalSelAlbumId; 

var albumLinkClicked = function(albumId,rowId,tableId){
	highLightLink(rowId,tableId);
	globalSelAlbumId = albumId;
	ColdFusion.navigate('../Library/album.cfm?albumId='+ albumId,'lowerPanel',albumHandler);
}




var albumHandler = function(){
//	new CFTunes.libraryAlbumRenderer(globalSelAlbumId);
	new CFTunes.songGridToolBarAlbum(globalSelAlbumId,'libraryAlbumToolBar');
	new CFTunes.songGrid('songGrid');
	initRatingWidget();
}

// Highlight a selected Link in a particular hierarchy Table
var highLightLink = function(rowId,tableId){
	allRows = Ext.get(tableId).select(".hierarchyTableRow");
	Ext.each(allRows,function(item) {
		if(item.hasClass("selectedLink")){
			item.removeClass("selectedLink");
		}
		Ext.get(rowId).addClass("selectedLink");
	});
}



var highlightButton = function(e,t){
	allButtons = Ext.get('genreTable').select(".genreButtonUnselected");
	Ext.each(allButtons, function(item){
		item.removeClass("genreButtonSelected");
		item.addClass("genreButtonUnselected");
	});
	Ext.fly(t).addClass("genreButtonSelected");
}

function initLibrary(){
	allButtons = Ext.get('genreTable').select(".genreButtonUnselected");
	Ext.each(allButtons, function(elem){
		elem.on('click',highlightButton);
	});
}

function playSongNow(){
	
}

function showAddSongPopup(songId){
	url = "../Library/addSongPopup.cfm?songId="+songId;
	x = ColdFusion.Window.getWindowObject("popUpWindow");
	x.setTitle("Add song");
	ColdFusion.navigate(url, "popUpWindow");		
	ColdFusion.Window.show("popUpWindow");
}

function submitFormAddToPlaylist() {
    ColdFusion.Ajax.submitForm("addSongToPlaylist", "../Library/addSongCon.cfm", submitCallbackAddSongToPlaylist, errorHandlerPlaylist);
}

function submitCallbackAddSongToPlaylist(response){
	var errors = ColdFusion.JSON.decode(response);
	var valid = true;
	var message = "";
	for(i in errors){
			eMessages = message + errors[i] + "<br />";
			valid = false;
		}
	if(valid){
		ColdFusion.Window.hide("popUpWindow");
		showInfoMessage("Song Added","");
	}else{
		showErrorMessage(eMessages,"Validation Error");
	}
}



function errorHandlerPlaylist(code, msg)
{
    alert("Error!!! " + code + ": " + msg);
}


CFTunes.libraryArtistRenderer = Ext.extend(Object, {
	constructor: function(artistId){
		this.artistId = artistId;
    },
	renderToolbar:function(){
		new Ext.Toolbar({
	    renderTo: 'libraryArtistToolBar',
	    items: [{
			xtype: 'tbbutton',
			iconCls: 'heartAdd',
			text: 'Add To Favorites',
			id: 'artist_'+this.artistId,
			handler: this.addToFavorite
	    	}]
		  });
		},
	addToFavorite:function(b,e){
		artist_id = b.getId();
		artistId = artist_id.split("_")[1];
		userServices = new UserServices();
		artistName = userServices.addArtistToFavorite(artistId);
		showInfoMessage(artistName + " added to your favorites","");
	}

});

