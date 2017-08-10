function playlistButtonClicked(){
	ColdFusion.navigate('../playlist/playlistView.cfm','mainContainerCFDiv',playlistSectionCreator);
}


function playlistSectionCreator(){
	new CFTunes.playlistSectionComponents('playlistSectionToolbar');
}


CFTunes.playlistSectionComponents =  Ext.extend(Object,{
	constructor: function(divId){
		this.divId = divId;
		this.renderToolbar();
    },
	renderToolbar:function(){
		new Ext.Toolbar({
	    renderTo: this.divId,
	    items: [{
				xtype: 'tbbutton',
				iconCls: 'topRated',
				text: 'Top Rated Playlist',
				//handler: this.playEntireAlbum
			},{
 			   xtype: 'tbseparator'
			},{
				xtype: 'tbbutton',
				iconCls: 'recent',
				text: 'Recent Playlists',
				//handler: this.playEntireAlbum
			},{
 			   xtype: 'tbseparator'
			},{
			xtype: 'tbsplit',
			text: 'Browse',
			iconCls:'browse',
			menu: [{
			   text: 'Browse By Genre',
			   icon : '../icons/vector.png'
			},{
			   text: 'Browse By Mood',
			   icon : '../icons/asterisk_orange.png'
			},{
			   text: 'Browse By Tags',
			    icon : '../icons/tag_blue.png'
	  	      }]
		     }]
		  });
		}
});

