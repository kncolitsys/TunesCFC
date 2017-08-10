component  output="false"
{
	public any function getPlaylistByPlaylistId(playListId){
		playlist = EntityLoadByPK("playlist",playListId);
		return playlist;
	}
	
	public Array function getAllSongsByPlaylistId(playListId){
		songs = EntityLoadByPK("playlist",playListId).getSongs();
		return songs;
	}
	
	public void function savePlaylist(playlist){
		Entitysave(playlist);
	}
	
	public query function getAllSongsByPlaylistIdQuery(playListId){
		query = new query(datasource="CFTunes");
		query.setSql("Select * from playlist p,playlist_song ps,song s where p.playlistId = ps.playlistId and ps.songId = s.songId and p.playlistId = #playListId# ");
		rs = query.execute();
		return rs.getResult();
	}
	
	public any function getPlaylistByPlaylistName(playlistName){
		playlist = ORMexecuteQuery("FROM playlist p WHERE p.playlistName="& "'" & playlistName &"'",true);
		if(! Isdefined("playlist")){
			throw(type="noRecordFound",message="Record not found.");
		}
		return playlist;
	}
	
	public void function addSongToPlaylist(songId,playlistId){
		playlist = EntityLoadByPK("playlist",playListId);
		newSong = EntityLoadByPK("song",songId);
		if(playlist.hasSongs(newSong)){
			throw(type="songAlreadyExist",message="Song Already In Playlist.");
		}else{
			playlist.addSongs(newSong);
		}
	}
	
	public void function deleteSongFromPlaylist(songId,playlistId){
		playlist = EntityLoadByPK("playlist",playListId);
		delSong = EntityLoadByPK("song",songId);
		if(playlist.hasSongs(delSong)){
			playlist.removeSongs(delSong);
		}else{
			throw(type="songNotExist",message="Song Not In Playlist.");
		}
	}
	
	public void function addSubgenreToPlaylist(subgenreId,playlistId){
		subgenre = EntityLoadByPK("subgenre",subgenreId);
		playlist = EntityLoadByPK("playlist",playlistId);
		if(! playlist.hasSubgenres(subgenre)){
			playlist.addSubgenres(subgenre);
		}
	}
	
	public void function removeSubGenreFromPlaylist(subgenreId,playlistId){
		subgenre = EntityLoadByPK("subgenre",subgenreId);
		playlist = EntityLoadByPK("playlist",playlistId);
		if(playlist.hasSubgenres(subgenre)){
			playlist.removeSubgenre(subgenre);
		}
		
	}
	
	public any function getTagByTagName(tagName){
		tag = ORMexecuteQuery("FROM tag t WHERE t.tagName="& "'" & tagName &"'",true);
		if(isDefined("tag")){
			return tag;
		}else{
			throw("noSuchTag","No tag found with the given name");
		}
	}
	
	public void function addTagToPlaylist(tagName,playlistId){
		tag = getTagByTagName(tagName);
		if(! Isdefined("tag")){
			newTag = new CFTunes.cfc.model.tag();
			newTag.setTagName(tagName);
			Entitysave(newTag);
		}
		tag = getTagByTagName(tagName);
		playlist.addTags(tag);
	}
	
	public void function removeTagFromPlaylist(tagId,playlistId){
		tag = EntityloadByPK("tag",tagId);
		playlist = EntityLoadByPK("playlist",playlistId);
		if(playlist.hasTags(tag)){
			playlist.removeTags(tag);
		}
	}
	
	public void function addMoodToPlaylist(moodId,playlistId){
		playlist = EntityLoadByPK("playlist",playlistId);
		playlistMood = EntityLoadByPK("playlistMood",moodId);
		if(! playlist.hasMoods(playlistMood)){
			playlist.addMoods(playlistMood);
		}
	}
	
	public void function removeMoodFromPlaylist(moodId,playlistId){
		playlist = EntityLoadByPK("playlist",playlistId);
		playlistMood = EntityLoadByPK("playlistMood",moodId);
		if(playlist.hasMoods(playlistMood)){
			playlist.removeMoods(playlistMood);
		}
	}
	
	public any function getNewPlaylists(){
		newplaylists = ORMexecuteQuery("FROM playlist p order by p.createdOn desc",false,{offset=0, maxresults=5});
		return newPlaylists;
	}
	
	public any function getAllPlaylistBySubgenreId(subgenreId){
		subgenre = EntityLoadByPK("subgenre",subgenreId);
		return subgenre.getPlaylists();
	}
	
	public void function saveRating(playlistRating){
		entitySave(playlistRating);
	}
	
	public array function getTagArrayByTagNameArray(aTagName){
		retArr = arrayNew(1);
		for(i=1;i<= arraylen(aTagName);i++){
			tagName = aTagName[i];
			flag = false;
			
			
				try
				{
					tag = getTagByTagName(tagName);
				}
				catch(any e)
				{
					flag = true;
				}
			if(flag){
				newTag = new CFTunes.cfc.model.tag();
				newTag.setTagName(tagName);
				Entitysave(newTag);
				ormFlush();
				tag = getTagByTagName(tagName);
			}
			arrayAppend(retArr,tag);
		}
		return retArr;
	}
}