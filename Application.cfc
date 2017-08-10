component output="false"{

		this.name = "CFTunes";
		this.sessionManagement = true;
		this.sessionTimeout = createTimeSpan(1,0,0,0);
		this.ormenabled = true;
		this.datasource = "cftunes";
		this.ormsettings.dialect="MySQL";
		this.ormsettings.logsql = "false";
		this.loginStorage = "Session";
		
	function onApplicationStart(){
		// Change this to your application need
 	}
	
	function onRequestStart(){
		//TODO: Put all these variables in onApplicationStart method. But I am changing them frequently so I have put this in onRequestStart

		Application.lastfmkey = ""; // Put last.fm api key here. Other wise some sections wont work

		Application.webroot = "C:\dev\Coldfusion\cf_main\cfusion\wwwroot\CFTunes\";
		
		// Change the following folders according to your need
		Application.mp3Dir = Application.webroot  & "CFTunes\mp3";
		Application.uploadDir = Application.webroot  & "CFTunes\uploads";
		Application.guitarUploadDir = Application.webroot  & "guitarUploads";
		Application.imagesDir = Application.webroot  & "CFTunes\images";
		Application.tempDir = Application.webroot  & "CFTunes\temp";
		Application.presentationDir = Application.webroot  & "CFTunes\artist";
		Application.attachmentDir = Application.webroot  & "CFTunes\mailAttachment";
		application.emailuserName = "";
		application.password = "";
	}

}
