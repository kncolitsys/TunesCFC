component  output="false"
{

	public void function addUser(userObj){
		Entitysave(userObj);
	}
	
	
	public Array function getAllUserPlaylistByUserId(userId){
		aPlayLists = EntityLoadByPK("user",userId).getPlayLists();
		return  aPlayLists;
	}
	
	
	public Array function getAllSubscribedPlaylistByUserId(userId){
		aPlayLists = EntityLoadByPK("user",userId).getSubscribedPlaylists();
		return aPlayLists;
	}
	
	public any function getUserByUserId(userId){
		return EntityLoadByPK("user",userId);
	}
	
	public any function getUserByUserName(userName){
		user = ORMexecuteQuery("FROM user u WHERE u.userName="& "'" & userName &"'",true);
		if(! Isdefined("user")){
			throw("userNotExists","User not Found");
		}
		return user;
	}
	
	public void function subscribedToPlaylist(userId,playlistId){
		user = EntityLoadByPK("user",userId);
		playlist = EntityLoadByPK("playlist",playlistId);
		
		if(user.hasSubscribedPlaylists(playlist)){
			throw(any,"Already Subscribed to Playlist");
		}else{
			user.addSubscribedPlaylists(playlist);
		}
	}
	
	public void function unSubscribedFromPlaylist(userId,playlistId){
		user = EntityLoadByPK("user",userId);
		playlist = EntityLoadByPK("playlist",playlistId);
		if(user.hasSubscribedPlaylists(playlist)){
			user.removeSubscribedPlaylists(playlist);
		}else{
			throw(any,"User is not subscribed to this Playlist");
		}
	}
	
	public any function addArtistToFavorite(userId,artistId){
		user = EntityLoadByPK("user",userId);
		artist = entityLoadByPK("artist",artistId);
		if(! user.hasFavoriteArtists(artist)){
			user.addFavoriteArtists(artist);
		}
		return artist;
	}

	
}