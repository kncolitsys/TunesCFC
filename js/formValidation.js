CFTunes.fields = Ext.extend(Object,{
	constructor:function(sId){
		this.id = sId;
		this.el = Ext.get(sId);
	},
	showInfoMessage:function(sMsg){
		sMsgConId = this.id + "_message";
		var msgHTML = {cls:'validationMessageInfo',tag:'span',html:sMsg};
		var dh = Ext.DomHelper;
		dh.overwrite(sMsgConId, msgHTML);
		this.el.removeClass('errorInputText');
	},
	showErrorMessage:function(sMsg){
		sMsgConId = this.id + "_message";
		var msgHTML = {cls:'validationMessageError',tag:'span',html:sMsg};
		var dh = Ext.DomHelper;
		dh.overwrite(sMsgConId, msgHTML);
		this.el.addClass('errorInputText');
	},
	clearMessages:function(){
		sMsgConId = this.id + "_message";
		Ext.get(sMsgConId).dom.innerHTML = '';
		this.el.removeClass('errorInputText');
	}
	
})

CFTunes.userNameField = Ext.extend(CFTunes.fields,{
	constructor: function(sId){
		CFTunes.userNameField.superclass.constructor.call(this,sId);
		this.init(sId);
	},
	init:function(){
		this.el.on('blur',this.checkUserName,this);
	},
	checkUserName:function(e,t){
		sVal = this.el.dom.value;
		if(sVal.length < 2){
			this.showErrorMessage("User name is too short.");
		}
		else{
			uServices = new UserServices();
			x = uServices.isUserNameExist(sVal);
			if(x){
				this.showErrorMessage("User name already exists.");
			}else{
				this.clearMessages();
			}
		}
	},
	
});


CFTunes.passwordFields = Ext.extend(Object,{
	constructor: function(sId1,sId2){
		this.sId1 = sId1;
		this.sId2 = sId2;
		this.field1 = new CFTunes.fields(this.sId1);
		this.field2 = new CFTunes.fields(this.sId2);
		this.init();
	},
	init:function(){
		this.field1.el.on('blur',this.checkPasswords,this);
		this.field2.el.on('blur',this.checkPasswords,this);
	},
	checkPasswords:function(e,t){
		sVal1 = this.field1.el.dom.value;
		sVal2 = this.field2.el.dom.value;
		if(sVal1.length < 6){
			this.field1.showErrorMessage("Password is too short");
		}else{
			this.field1.clearMessages();
			if(sVal1 != sVal2){
				this.field2.showErrorMessage("Passwords do not match");
			}else{
				this.field2.clearMessages();
			}
		}
	}
});


CFTunes.registrationForm = Ext.extend(Object,{
	constructor: function(){
		this.error = false;
		
	}
});
