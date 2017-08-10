CFTunes.songGrid =  Ext.extend(Object,{
	constructor:function(gridName){
		this.gridObj = ColdFusion.Grid.getGridObject(gridName);
		this.initGrid();
	},
	initGrid:function(){
		this.gridObj.on('rowdblclick',this.playDblClickedSong,this,{});
		this.gridObj.on('cellcontextmenu',this.songGridContextClick,this,{});
		userServices = new UserServices();
		this.aUserPlaylist = userServices.getAllUserPlaylistAsArray();
	},
	playDblClickedSong:function(gridObj,rowIndex,eventObj){
		var record = gridObj.getStore().getAt(rowIndex); // Get the Record
		var fieldName = gridObj.getColumnModel().getDataIndex(0); // Get field name
		var data = record.get(fieldName);
		CFTunesPlayer.playSingleSong(data);
	},
	songGridContextClick:function(gridObj,rowIndex,cellIndex,e ) {
		var record = gridObj.getStore().getAt(rowIndex); // Get the Record
		var artistId = record.get('ARTISTID');
		var artistName = record.get('ARTIST');
		var songId = record.get('SONGID');
		playlistMenuItems = new Array();
		for(i=0;i< this.aUserPlaylist.length;i++){
			menuItem = new Object();
			menuItem.text = this.aUserPlaylist[i][1];
			menuItem.id = 'playlistContextMenu_'+this.aUserPlaylist[i][0]+"_"+songId;
			menuItem.handler = this.addSongToUserPlaylist;
			playlistMenuItems.push(menuItem);	
		}
			this.contextMenu = new Ext.menu.Menu({
				id: 'gridCtxMenu',
				items: [{
						text: 'Add To Playlist',
						menu:{
							items:playlistMenuItems,
						}
					},{
						text: 'Add '+ artistName +' to Favorite',
						handler:this.addArtistToFavorite,
						id:'artistContextMenu_'+artistId,
					},{
						text: 'Add to current Playlist',
						handler:this.addSongToCurrentPlaylist,
						id:'currentPlaylist_'+ songId
					},{
						text: 'Play Video',
						handler:this.playVideo,
					}]
			}); 
		e.stopEvent();
		var xy = e.getXY();
		this.contextMenu.showAt(xy);
		this.contextMenu.on('hide', this.menuDestroyed, this);
	},
	menuDestroyed:function(cntxtMenu){
		cntxtMenu.destroy() ;
	},
	addSongToCurrentPlaylist:function(b,e){
		currentPlaylist_songId = b.getId();
		songId = currentPlaylist_songId.split("_")[1];
		CFTunesPlayer.addSongToCurrentPlaylist(songId);//CFTunesPlayer.songComplete()
	},
	addSongToUserPlaylist:function(b,e){
		playlistServices = new PlaylistServices();
		playlist_id_songId = b.getId();
		playlistId = playlist_id_songId.split("_")[1];
		songId = playlist_id_songId.split("_")[2];
		//addSongToPlaylist(songId,playlistId)
		playlistServices.addSongToPlaylist(songId,playlistId);
		showInfoMessage("Song added to your playlist","");
	},
	addArtistToFavorite:function(b,e){
		artist_id = b.getId();
		artistId = artist_id.split("_")[1];
		artistName = userServices.addArtistToFavorite(artistId);
		showInfoMessage(artistName + " added to your favorites","");
	},
	playVideo:function(){
		CFTunesPlayer.pause();
		ColdFusion.Window.show("popUpVideo");
	}
});

CFTunes.songGridToolBarAlbum =  Ext.extend(Object,{
	constructor: function(albumId,divId){
		this.albumId = albumId;
		this.divId = divId;
		this.renderToolbar();
    },
	renderToolbar:function(){
		new Ext.Toolbar({
	    renderTo: this.divId,
	    items: [{
			xtype: 'tbbutton',
			iconCls: 'playEntire',
			text: 'Play this Album',
			id: 'toolBarAlbum_'+this.albumId,
			handler: this.playEntireAlbum
	    	}]
		  });
		},
	playEntireAlbum:function(b,e){
		album_id = b.getId();
		albumId = album_id.split("_")[1];
		CFTunesPlayer.playAlbum(albumId);
	}	
});

CFTunes.songGridToolBarPlaylist =  Ext.extend(Object,{
	constructor: function(playlistId,divId){
		this.playlistId = playlistId;
		this.divId = divId;
		this.renderToolbar();
    },
	renderToolbar:function(){
		new Ext.Toolbar({
	    renderTo: this.divId,
	    items: [{
			xtype: 'tbbutton',
			iconCls: 'playEntire',
			text: 'Play this Playlist',
			id: 'toolBarPlaylist_'+this.playlistId,
			handler: this.playEntirePlaylist
	    	},{
 			   xtype: 'tbseparator'
			},{
				xtype: 'tbbutton',
				iconCls: 'addButton',
				text: 'Subscribe to this playlist',
				id: 'subscribePlaylist_'+this.playlistId,
				handler: this.subscribeToPlaylist
			}
			]
		  });
		},
	playEntirePlaylist:function(b,e){
		playlist_id = b.getId();
		playlistId = playlist_id.split("_")[1];
		CFTunesPlayer.playPlaylist(playlistId);
	},
	subscribeToPlaylist:function(b,e){
		playlist_id = b.getId();
		userServices = new UserServices();
		playlistId = playlist_id.split("_")[1];
		msg = userServices.subscribedToPlaylist(playlistId);
		showInfoMessage(msg,"");
	}
});
