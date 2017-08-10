component output="false"  
{
	remote void function addSubGenreToTextBox(subgenreId){
		if(! isDefined("session.playlist.subGenres")){
			session.playlist.subGenres = arrayNew(1);
		}
		if(! arrayContains(session.playlist.subGenres,subgenreId)){
			arrayAppend(session.playlist.subGenres,subgenreId);
		}
	}
	
	remote void function removeSubGenreToTextBox(subgenreId){
		arrayDelete(session.playlist.subGenres,subgenreId);
	}
	
	remote array function getAllSubgenreOfTextBox(){
		services = new CFTunes.cfc.services.playlistServices();
		retArray = arrayNew(1);
		if(! isDefined("session.playlist.subGenres")){
			session.playlist.subGenres = arrayNew(1);
		}
		aSubgenreId = session.playlist.subGenres;
		for(i=1;i<= arraylen(aSubgenreId);i++ ){
			subGenre = services.getSubgenreBySubgenreId(aSubgenreId[i]);
			arrayAppend(retArray,subGenre);
		}
		return retArray;
	}
	
	remote void function addMoodToTextBox(moodId){
		if(! isDefined("session.playlist.moods")){
			session.playlist.moods = arrayNew(1);
		}
		if(! arrayContains(session.playlist.moods,moodId)){
			arrayAppend(session.playlist.moods,moodId);
		}
	}
	
	remote void function removeMoodFromTextBox(moodId){
		arrayDelete(session.playlist.moods,moodId);
	}
	
	remote void function destroySessionData(){
		StructDelete(session,"playlist",false);
	}
	
	
	remote array function getAllMoodsOfTextBox(){
		services = new CFTunes.cfc.services.playlistServices();
		retArray = arrayNew(1);
		if(! isDefined("session.playlist.moods")){
			session.playlist.moods = arrayNew(1);
		}
		aMoodId = session.playlist.moods;
		for(i=1;i<= arraylen(aMoodId);i++ ){
			mood = services.getMoodByMoodId(aMoodId[i]);
			arrayAppend(retArray,mood);
		}
		return retArray;
	}

	
	
}
