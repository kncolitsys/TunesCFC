function initGuitarSection(){
	new CFTunes.guitar();
}

CFTunes.guitar =  Ext.extend(Object,{
	constructor: function(){
		this.toolbarDivId = 'guitarToolbar';
		this.guitarTabsId = 'guitarTabs';
		this.renderToolbar();
    },
	renderToolbar:function(){
		new Ext.Toolbar({
	    renderTo: this.toolbarDivId,
	    items: [{
				xtype: 'tbbutton',
				iconCls: 'addButton',
				text: 'Add New Lesson',
				handler: this.openNewGuitarTab
			},{
				xtype: 'tbbutton',
				iconCls: 'createGuitarChords',
				text: 'Guitar Chords',
				handler: this.openUploadButton
			}]
		  });
		},
		openNewGuitarTab:function(){
			ColdFusion.Layout.createTab('guitarTabs', 'addNewLessonTab', 'Add New Lesson', '../guitar/newLesson.cfm',{selected:true, closable:true, callbackHandler:newGuitarCallback ,} )
		},
		openUploadButton:function(){
			ColdFusion.Layout.createTab('guitarTabs', 'uploadNewLessonTab', 'Guitar Chords', '../guitar/guitarChords.cfm',{selected:true, closable:true, callbackHandler:uploadCallback ,} )
		}
});

var newGuitarCallback = function(){
	new Ext.Toolbar({
	    renderTo: 'newGuitarToolbar',
	    items: [{
				xtype: 'tbbutton',
				iconCls: 'acceptButton',
				text: 'Save Lesson',
				handler: saveLesson
			}]
		 });
}

function saveLesson(){
	retArray = new Array();
	x = Ext.get('playlistListGenre');
	y = x.select('img');
	aElements = y.elements;
	for(i=0;i<aElements.length;i++){
		scrAttr = aElements[i].src;
		retArray.push(scrAttr);
		
	}
	cs = new ChordServices();
	cs.createPdf(retArray);
}

function uploadCallback(){
}


function addImageMInLesson(imgObj){
	// alert(imgObj.src);
	srcA = imgObj.src;
	mainDivContainer = Ext.get('playlistListGenre')
	t = new Ext.Template('<img src="{scrAttr}" onclick="removeMe(this)" height="155px" width="119px" />');
	t.append(mainDivContainer,{scrAttr:srcA});
	
}

function removeMe(imgObj){
	y = Ext.get(imgObj);
	y.remove();
}
