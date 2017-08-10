component output="false" 
{
	remote any function getstatus(){
		services = new	CFTunes.cfc.services.Ajaxservices();
		 str = StructNew();
		 if(! isDefined("session.statusMessage")){
		 	session.statusMessage = "Starting Process...";
		 }
		 
		 if(! isDefined("session.STATUS")){
		 	session.STATUS = .1;
			services.generateArtistPPT(Session.artistId);
		 }
		 str.message = session.statusMessage;
		 str.status = session.STATUS;
		 return SerializeJSON(str);
	}
}