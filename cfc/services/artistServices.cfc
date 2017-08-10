import CFTunes.cfc.dao.*;
import CFTunes.cfc.model.*;

component  output="false"
{
	remote void function addArtist(artist){
		artistDao = new CFTunes.cfc.dao.artistDao();
		artistDao.addArtist(artist);
	}

	remote any function getArtistByArtistId(artistId){
		artistDao = new CFTunes.cfc.dao.artistDao();
		artist = artistDao.getArtistByArtistId(artistId);
		return artist;
	}
	
	remote any function getArtistByArtistName(artistName){
		artistDao = new artistDao();
		oArtist = new artist();
		try
        {
        	oArtist = artistDao.getArtistByArtistName(artistName);
			return oArtist;
        }
        catch(Any e)
        {
			rethrow; 
        }
	}
	
	remote boolean function isArtistExists(artistName){
		try
        {
        	getArtistByArtistName(artistName);
        }
        catch(Any e)
        {
			return false;
        }
		return true;
	}
	
}