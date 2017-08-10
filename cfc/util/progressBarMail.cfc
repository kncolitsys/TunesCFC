component output="false" 
{
	remote any function getstatus(){
		services = new	CFTunes.cfc.services.IMAPServices();
		 str = StructNew();
		 if(! isDefined("session.statusMessage")){
		 	session.statusMessage = "Starting Process...";
		 }
		 
		 if(! isDefined("session.STATUS")){
		 	session.STATUS = .1;
			services.fetchMailHeaders();
		 }
		 str.message = session.statusMessage;
		 str.status = session.STATUS;
		 return SerializeJSON(str);
	}
}