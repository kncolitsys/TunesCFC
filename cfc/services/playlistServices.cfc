import CFTunes.cfc.dao.*;
import CFTunes.cfc.model.*;

component  output="true" 
{
	remote any function getPlaylistByPlaylistId(playlistId){
		playlistDao = new playlistDao();
		return playlistDao.getPlaylistByPlaylistId(playListId);
	}
	
	remote any function getPlaylistByPlaylistIdInJson(playlistId){
		playlistObj = getPlaylistByPlaylistId(playlistId);
		sArray = playlistObj.getSongs();
		newSArray = arrayNew(1);
		for(i=1;i<= arraylen(sArray);i++){
			songObj = sArray[i];
			s = new song();
			s.setSongId(songObj.getSongId());
			s.setName(songObj.getName());
			s.setPath(songObj.getPath());
			arrayAppend(newSArray,s);
		}	
		retObject = new playlist();
		retObject.setPlaylistId(playlistObj.getPlaylistId());
		retObject.setSongs(newSArray);
		return serializeJSON(retObject);
	}
	
	remote any function getMoodByMoodId(moodId){
		return entityLoadByPK("playlistMood",moodId);
	}
	
	remote any function getSubgenreBySubgenreId(subgenreId){
		return EntityLoadByPK("subGenre",subgenreId);
	}
	
	remote Array function getAllSongsByPlaylistId(playListId){
		songs = EntityLoadByPK("playlist",playListId).getSongs();
		return songs;
	}
	
	remote query function getAllSongsByPlaylistIdQuery(playListId){
		query = new query(datasource="CFTunes");
		query.setSql("Select * from playlist p,playlist_song ps,song s where p.playlistId = ps.playlistId and ps.songId = s.songId and p.playlistId = #playListId# ");
		rs = query.execute();
		return rs.getResult();
	}
	
	remote boolean function savePlaylist(playlist){
		playlistDao = new playlistDao();
		playlistDao.savePlaylist(playlist);
		return true;
	}

	remote void function addSongToPlaylist(songId,playlistId){
		playlistDao = new playlistDao();
		try
        {
        	playlistDao.addSongToPlaylist(songId,playlistId);
        }
        catch(any e)
        {
			rethrow;
        }

	}
	
	remote void function deleteSongFromPlaylist(songId,playlistId){
		playlistDao = new playlistDao();
				try
        {
        	playlistDao.deleteSongFromPlaylist(songId,playlistId);
        }
        catch(any e)
        {
			rethrow;
        }
	}

	remote void function deletePlaylist(playlistId){
		
	}

	remote any function getPlaylistByPlaylistName(playlistName){
		playlistDao = new CFTunes.cfc.dao.playlistDao();
		playlist = "";
		try
        {
        	playlist = playlistDao.getPlaylistByPlaylistName(playlistName);
        }
        catch(noRecordFound e)
        {
			rethrow;
			
        }
		return playlist;
	}	
	
	remote void function addSubgenreToPlaylist(subgenreId,playlistId){
		playlistDao = new playlistDao();
		playlistDao.addSubgenreToPlaylist(subgenreId,playlistId);
		
	}
	remote void function removeSubGenreFromPlaylist(subgenreId,playlistId){
		playlistDao = new playlistDao();
		playlistDao.removeSubGenreFromPlaylist(subgenreId,playlistId);
	}
	
	remote void function addTagToPlaylist(tagName,playlistId){
		playlistDao = new playlistDao();
		playlistDao.addTagToPlaylist(tagName,playlistId);
	}
	
	remote void function removeTagFromPlaylist(tagId,playlistId){
		playlistDao = new playlistDao();
		playlistDao.removeTagFromPlaylist(tagId,playlistId);
	}
	
	remote struct function getPlaylistRatingStats(playlistId){
		returnStruct = structNew();
		playlistDao = new playlistDao();
		playlist = playlistDao.getPlaylistByPlaylistId(playListId);
		ratings = playlist.getPlaylistRatings();
		returnStruct.totalRating= arraylen(ratings);
		returnStruct.averageRating = 0;
		returnStruct.sumRating = 0;
		for(i=1;i<=totalRating;i++){
			returnStruct.sumRating = returnStruct.sumRating + returnStruct.totalRating[i].getRating();
		}
		returnStruct.averageRating = returnStruct.sumRating / returnStruct.totalRating;
		return returnStruct;
	}
	
	remote any function getNewPlaylists(){
		returnarr = arrayNew(1);
		playlistDao = new playlistDao();
		returnarr =  playlistDao.getNewPlaylists();
		return returnarr;
	}
	
	remote void function addMoodToPlaylist(moodId,playlistId){
		playlistDao = new playlistDao();
		playlistDao.addMoodToPlaylist(moodId,playlistId);
	}
	
	remote void function removeMoodFromPlaylist(moodId,playlistId){
		playlistDao = new playlistDao();
		playlistDao.removeMoodFromPlaylist(moodId,playlistId);
	}
	
	remote array function getAllPlaylistBySubgenreId(subgenreId){
		playlistDao = new playlistDao();
		playlists = playlistDao.getAllPlaylistBySubgenreId(subgenreId);
		x = 9;
		return playlists;
	}
	
	
	remote array function getAllMoods(){
		moods = entityLoad("playlistMood");
		return moods;
	}
	
	
	
	remote array function getSubgenreForTree(playlistId){
		
		result= arrayNew(1);
		x = 0;
		for(i = 1 ; i <= 10 ;i++){
			x = x+1;
			s = structNew();
			s.value= x ;
			s.display="GT #i#";
			arrayAppend(result,s);
		}
		return result;
	}
	remote void function saveRating(playlistRating){
		playlistDao = new playlistDao();
		playlistDao.saveRating(playlistRating);
	}
	remote array function getTagArrayByTagNameArray(aTagName){
		playlistDao = new CFTunes.cfc.dao.playlistDao();
		return playlistDao.getTagArrayByTagNameArray(aTagName);
	}

}