import CFTunes.cfc.dao.*;

component  output="false" 
{	
	remote void function addUser(userObj){
		userDao = new userDao();
		userDao.addUser(userObj);
	}
	
	remote any function getUserObjByUserName(userName){
		userDao = new CFTunes.cfc.dao.userDao();
		userObj = userDao.getUserByUserName(userName);
		return userObj;
	}
	
	remote Array function getAllUserPlaylistByUserId(userId){
		userDao = new userDao();
		aPlayLists = userDao.getAllUserPlaylistByUserId(userId);
		return  aPlayLists;
	}
	
	remote Array function getAllSubscribedPlaylistByUserId(userId){
		aPlayLists = EntityLoadByPK("user",userId).getSubscribedPlaylists();
		return aPlayLists;
	}
	
	remote Array function getAllUserPlaylistAsArray(){
		userName = GetAuthUser();
		userObj = getUserObjByUserName(userName);
		retArray = getAllUserPlaylistOfUserForCFSelect(userObj.getUserId());
		return  retArray;
	}
	
	
	remote Array function getAllUserPlaylistOfUserForCFSelect(userId){
		userDao = new userDao();
		aPlayLists = userDao.getAllUserPlaylistByUserId(userId);
		retArray = arraynew(2);
		for(i=1;i<= arraylen(aplayLists);i++){
			playlistid = aPlayLists[i].getPlaylistId();
			playlistName = aPlayLists[i].getPlaylistName();
			retArray[i][1] = playlistid;
			retArray[i][2] = playlistName;
		}
		return  retArray;
	}
	
	remote boolean function authenticateUser(userName,password){
		userDao = new CFTunes.cfc.dao.userDao();
    	try
        {
        	userObj = userDao.getUserByUserName(userName);
        }
        catch(Any e)
        {
			return false;
        }
		if(userObj.getUserName() == ""){
			return false;
		}
		userPwd = userObj.getPassword();
		if(userPwd != password){
			return false;
		}else{
			return true;
		}
		return false;
	}
	
	remote string function getUserRoleAsString(userName){
		userDao = new CFTunes.cfc.dao.userDao();
		userObj = userDao.getUserByUserName(userName);
		roles = userObj.getRoles();
		returnString = "";
		for(i=1; i <= Arraylen(roles);i++){
			returnString = returnString & "," & roles[i].getRoleName();
		}
		return returnString;
	}
	
	remote String function addArtistToFavorite(artistId){
		userName = GetAuthUser();
		userObj = getUserObjByUserName(userName);
		userDao = new userDao();
		artist = userDao.addArtistToFavorite(userObj.getUserId(),artistId);
		return artist.getArtistName();
	}
	
	remote string function subscribedToPlaylist(playlistId){
		retMsg = "";
		userName = GetAuthUser();
		userObj = getUserObjByUserName(userName);
		userId = userObj.getUserId();
		userDao = new userDao();
		try
		{
			userDao.subscribedToPlaylist(userId,playlistId);
			retMsg = "Subscribed to Playlist";
		}
		catch(Any e)
		{
			retMsg = e.message;
		}

		return retMsg;
	}
	
	
	remote any function checkForEmailDuringRegistration(){
		retStruct = structNew();
	}
	
	remote boolean function isUserNameExist(userName){
		userDao = new CFTunes.cfc.dao.userDao();
		try
        {
        	userObj = userDao.getUserByUserName(userName);
			return true;
        }
        catch(Application e)
        {
			return false;
        }

	}

}