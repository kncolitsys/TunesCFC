<div align="center">
<div style="width:900px;margin-top:20px">
<cffileupload url="uploadController.cfm"
		progressbar="true"
		name="myupload"
		addButtonLabel = "Add File"
		clearButtonlabel = "Clear it"
		hideUploadButton = "false"
		width=900
		height=400
		title = "File Upload"
		maxuploadsize="30"
		extensionfilter="*.mp3"
		BGCOLOR="##FFFFFF"
		MAXFILESELECT=10
		UPLOADBUTTONLABEL="Upload now"/>
</div>
</div>		