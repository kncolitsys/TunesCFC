	var onfinishExcelProcess = function(){
		Ext.get('bevkuf').show();
	}
	var startExcelProgress = function() {
		ColdFusion.ProgressBar.start("excelProcessBar");
	};



startMailProgress = function(artistId) {
	ColdFusion.ProgressBar.start("mailProgressbar");
};

onfinishMailProcess = function () {
	ColdFusion.navigate('../admin/mailGrid.cfm','adminManageSubscriptionTab',initAdminTable);
};

function initAdminTable(){
	new CFTunes.adminMailTable('adminMailTable');
}


function dummy2(){
	tableObj = Ext.get('adminMailTable');
	allCkBox = tableObj.select('.adminMailTableCheckBox');
	aCkBox = allCkBox.elements;
	var aUID = new Array();
	for(i=0;i<aCkBox.length;i++){
		oCkBox = aCkBox[i];
		if(oCkBox.checked){
			aCkBox.push(oCkBox.value);
		}
	}
}

function getExcelGrid(){
	//ColdFusion.Ajax.submitForm("mailGridForm", "../admin/spreadSheet.cfm", callbackxlGrid, errorHandler, 'POST', true);
	ColdFusion.navigate("../admin/spreadSheet.cfm" , 'myMailGrid', callbackxlGrid, errorHandler, 'POST', 'mailGridForm');
}
function callbackxlGrid(){
	// do nothing
}


CFTunes.adminMailTable = Ext.extend(Object,{
	constructor: function(tableId){
		this.tableId = tableId;
		this.tableObj = Ext.get(tableId);
		this.initTable();
		this.selRow="";
	},
	initTable:function(){
		allCkBox = this.tableObj.select('.adminMailTableCheckBox');
		Ext.each(allCkBox.elements,function(el){
			Ext.get(el).on('click',function(evt,el){
					if(el.checked){
							Ext.get(el).parent().parent().addClass('selRow');
						}else{
							Ext.get(el).parent().parent().removeClass('selRow');
					}
				});
			});
	}
	
});


function manageClicked(){
	ColdFusion.navigate('../admin/admin.cfm','mainContainerCFDiv',renderAdminPageComponents);
}

function renderAdminPageComponents(){
	new CFTunes.adminComponents();
}

CFTunes.adminComponents =  Ext.extend(Object,{
	constructor: function(){
		this.toolbarDivId = 'adminToolbar';
		this.adminTabsId = 'adminTabs';
		this.renderToolbar();
    },
	renderToolbar:function(){
		new Ext.Toolbar({
	    renderTo: this.toolbarDivId,
	    items: [{
				xtype: 'tbbutton',
				iconCls: 'manageUser',
				text: 'Manage Users',
				handler: this.openManageUserTab
			},{
 			   xtype: 'tbseparator'
			},{
				xtype: 'tbsplit',
				iconCls: 'musicButton',
				text: 'Manage Audio',
				menu: [{
					    text: 'Upload New Songs',
					    icon : '../icons/arrow_up.png',
						handler: this.openUploadSongsTab,
					},{
					   text: 'Scan Upload Folder',
					   icon : '../icons/drive_go.png',
					   handler: this.openScanUploadFolderTab
					},{
					   text: 'Save Scan Songs',
					   icon : '../icons/disk.png',
					   handler: this.saveScanSongs
					}]
			},{
 			   xtype: 'tbseparator'
			},{
				xtype: 'tbsplit',
				iconCls: 'manageIndex',
				text: 'Search Indexing',
				menu: [{
					    text: 'Index Subgenre',
					    icon : '../icons/vector.png',
						handler: this.openIndexSubgenre,
					},{
					   text: 'Index Artists',
					   icon : '../icons/user_gray.png',
					   handler: this.openIndexArtist
					},{
					   text: 'Index Albums',
					   icon : '../icons/cd.png',
					   handler: this.openIndexAlbum
					},{
					   text: 'Index Songs',
					   icon : '../icons/music.png',
					   handler: this.openIndexSongs
					}]
			},{
 			   xtype: 'tbseparator'
			},{
				xtype: 'tbbutton',
				text: 'Manage Subscription',
				iconCls:'subscriptionButton1',
				handler:this.openManageSubscriptionTab
		     }]
		  });
		},
		openManageUserTab:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminManageUserTab', 'Manage Users', '../admin/manageUsers.cfm',{selected:true, closable:true, callbackHandler:manageUserTabCallback ,} )
		},
		openManageAudioTab:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminManageAudioTab', 'Manage Audios', '../admin/manageAudios.cfm',{selected:true, closable:true, callbackHandler:manageAudioTabCallback ,} )
		},
		openUploadSongsTab:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminUploadSongsTab', 'Upload Songs', '../admin/uploadSongs.cfm',{selected:true, closable:true, callbackHandler:uploadTabCallback ,} )
		},
		openScanUploadFolderTab:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminScanUploadTab', 'Scan Upload Songs', '../admin/scan.cfm',{selected:true, closable:true, callbackHandler:scanTabCallback ,} )
		},
		saveScanSongs:function(){
			ColdFusion.Layout.createTab('adminTabs', 'saveScanSongsTab', 'Save Scan Songs', '../admin/saveScanSong.cfm',{selected:true, closable:true} )
		},
		openManageSubscriptionTab:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminManageSubscriptionTab', 'Manage Subscription', '../admin/manageSubscription.cfm',{selected:true, closable:true, callbackHandler:manageSubscriptionTabCallback ,} )
		},
		openIndexSubgenre:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminindexSubGenre', 'Index SubGenre', '../admin/indexSubGenre.cfm',{selected:true, closable:true} )
		},
		openIndexArtist:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminindexArtist', 'Index Artist', '../admin/indexArtist.cfm',{selected:true, closable:true} )
		},
		openIndexAlbum:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminindexAlbum', 'Index Album', '../admin/indexAlbum.cfm',{selected:true, closable:true} )
		},
		openIndexSongs:function(){
			ColdFusion.Layout.createTab('adminTabs', 'adminindexSongs', 'Index Songs', '../admin/indexSongs.cfm',{selected:true, closable:true} )
		}
});

function manageUserTabCallback(){
	
}

function manageAudioTabCallback(){
	
}

function manageSubscriptionTabCallback(){
	startMailProgress();
}
function uploadTabCallback(){
	
}
function scanTabCallback(){
	
}
