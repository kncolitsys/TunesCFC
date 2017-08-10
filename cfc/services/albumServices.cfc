import CFTunes.cfc.dao.*;

component output="false"
{
	remote any function getAlbumByAlbumName(albumName){
		albumdao = new albumDao();
		album = new CFTunes.cfc.model.album();	
		try
        {
        	album = albumdao.getAlbumByAlbumName(albumName);
        }
        catch(Any e)
        {	
			rethrow;
        }
		return album;
	}
	
	
	remote boolean function isAlbumExists(albumName){
		try
        {
        	getAlbumByAlbumName(albumName);
        }
        catch(Any e)
        {
			return false;
        }
		return true;
	}
	
	remote void function addAlbum(albumObj){
		albumdao = new albumDao();
		albumdao.addAlbum(albumObj);
	}
	
	
	remote any function getSongBySongNameOfAlbum(songName,albumId){
		albumdao = new albumDao();
		oSong = new CFTunes.cfc.model.song();
		try
        {
        	oSong = albumdao.getSongBySongNameOfAlbum(songName,albumId);
			return oSong;
        }
        catch(Any e)
        {
			rethrow;
        }

	}
}