<cfscript>
	source = Application.uploadDir & "\01 Cluster One.mp3";
	destination = Application.mp3Dir & "\Pink Floyd\Division Bell";
	if(! DirectoryExists(destination)){
		DirectoryCreate(destination);
	}
	
//	DirectoryCreate(destination);
//	fileMove(source,destination);
</cfscript>