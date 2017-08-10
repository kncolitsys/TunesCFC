import CFTunes.cfc.dao.*;
import CFTunes.cfc.model.*;

component  output="false"
{
	public void function addArtist(artistObj){
		EntitySave(artistObj);
	}
	
	public void function addAlbum(albumObj){
		EntitySave(albumObj);
	}
	
	public any function getSongDetailsbySongId(songId){
		songObj = entityLoadByPK('song',songId);
		return (songObj);
	}
	
	remote any function getSongDetailsInJson(songId){
		return serializeJSON(getSongDetailsbySongId(songId));
	}
	
	public void function addSong(songObj){	
		EntitySave(songObj);
	}
	
	remote any function getSongsByAlbumIdInJson(albumId){
		albumDao = new albumDao();
		oAlbum = albumDao.getAlbumByAlbumId(albumId);
		return serializeJSON(oAlbum);
	}	
	
	
	public void function addSubGenreToArtist(artistId,subGenreId){
		artist = EntityLoadByPK("artist",artistId);
		subGenres = artist.getSubGenres();
		for(i=1; i <= ArrayLen(subGenres);i++){
			if(subGenres[i].getSubGenreId() == subGenreId){
				throw "Artist already has the Sub Genre.";
			}
		}
		newSubGenre = entityloadByPK("subGenre",subGenreId);
		ArrayAppend(subGenres,newSubGenre);
	}
	
	public Boolean function removeSubGenreFromArtist(artistId,subGenreId){
		artist = EntityLoadByPK("artist",artistId);
		subGenres = artist.getSubGenres();
		requiredIndex = -1;
		for(i=1; i <= ArrayLen(subGenres);i++){
			if(subGenres[i].getSubGenreId() == subGenreId){requiredIndex= i;break; }
		}
		if(requiredIndex != -1){
			ArraydeleteAt(subGenres,requiredIndex);
		}
	}
	
	public String function addSubGenreToSong(songId,subGenreId){
		song = EntityloadByPK("song",songId);
		subGenres = song.getSubGenres();
		for(i=1; i <= ArrayLen(subGenres);i++){
			if(subGenres[i].getSubGenreId() == subGenreId){
				throw "Song already has the Sub Genre.";
			}
		}
		newSubGenre = entityLoadByPK("subGenre",subGenreId);
		Arrayappend(genres,newSubGenre);
	}
	
	public String function removeSubGenreFromSong(songId,subGenreId){
		song = EntityloadByPK("song",songId);
		subGenres = song.getSubGenres();
		requiredIndex = -1;
		for(i=1; i <= ArrayLen(subGenres);i++){
			if(subGenres[i].getSubGenreId() == subGenreId){requiredIndex= i;break; }
		}
		if(requiredIndex != -1){
			ArraydeleteAt(subGenres,requiredIndex);
		}
	}

	public Array function getAllGenres(){
		aGenre = EntityLoad("genre");
		return aGenre;
	}
	
	/* 
		if genreId == "" returns all subgenre
	 */
	public Array function getAllSubGenresByGenreId(genreId){
		aSubGenres = arraynew(1);
		if(genreId == ""){
			aSubGenres = EntityLoad("subGenre");
		}else{
			aSubGenres = EntityLoadByPK("genre",genreId).getSubGenres();
		}
		return aSubGenres;
	}
	
	public Array function getAllArtistBySubGenreId(subGenreId){
		aArtists = arrayNew(1);
		if(subGenreId == ""){
			aArtists = EntityLoad("artist");
		}else{
			aArtists = EntityLoadByPK("subGenre",subGenreId).getArtists();
		}
		return aArtists;
	}
	
	public Array function getAllAlbumByArtistId(artistId){
		aAlbum = EntityLoadByPK("artist",artistId).getAlbums();
		return aAlbum;
	}
	
	public Array function getAllSongByAlbumId(albumId){
		aSongs = EntityLoadByPK("album",albumId).getSongs();
		return aSongs;
	}

	private void function moveSaveScanSong(){
		songDir = Application.mp3Dir;
		uploadDir = Application.uploadDir;
		
	}
	
	
	
	remote any function getSubgenreBySubGenreName(subGenreName){
		songDao = new SongDao();
		try
        {
        	subGenre = songDao.getSubgenreBySubGenreName(subGenreName);
        }
        catch(Any e)
        {
			rethrow;
        }

		return subGenre;
	}

	remote void function saveScanSongs(){
		songDir = Application.mp3Dir;
		uploadDir = Application.uploadDir;
		sQuery = Session.songQuery;
		albumServices = new CFTunes.cfc.services.albumServices();
		artistServices = new CFTunes.cfc.services.artistServices();
		for(i=1; i <= sQuery.recordCount;i++){
			fileName = sQuery.fileName[i];
			songName = sQuery.name[i];
			albumName = sQuery.album[i];
			artistName = sQuery.artist[i];
			genreName = sQuery.genre[i];
			imgTempFileName = sQuery.tempImage[i];
			
			dbArtist = new artist();
			flag = false; // this is to avoid any unnecessary checks 
			flagSongAlreadyInAlbum = false;
			subgenre = entityNew("subGenre");
			// Add funciton to create subgenre GT
			try
            {
            	subgenre = getSubgenreBySubGenreName(genreName);
            }
            catch(any e)
            {
				
				subgenre.setSubGenreName(genreName);
				subgenre.setGenre(entityLoadByPK("genre",1));
				entitySave(subgenre);
				ormflush();
				subgenre = getSubgenreBySubGenreName(genreName);
				
            }
			
			if(albumServices.isAlbumExists(albumName)){
				tempAlbum = albumServices.getAlbumByAlbumName(albumName);
				try
                {
                	songObj = albumServices.getSongBySongNameOfAlbum(songName,tempAlbum.getAlbumId());
					flagSongAlreadyInAlbum = true;
                }
                catch(songNotFound e)
                {
					// Do nothing here man !!!
					flagSongAlreadyInAlbum = false;
                }
				if(! flagSongAlreadyInAlbum){
					song = entityNew("song");
					song.addSubGeners(subgenre);
					song.setName(songName);
					// songPath would be /Linkin Park/Meteora/01 Somewhere I Belong.mp3
					songPath = "/" & artistName & "/" & albumName & "/" & fileName;
					sourcePath = uploadDir & "\" & fileName ;
					destination = songDir & "\" & artistName & "\" & albumName & "\";
						if(! DirectoryExists(destination)){
							DirectoryCreate(destination);
						}
					fileMove(sourcePath,destination);
					song.setPath(songPath);
					song.setAlbum(tempAlbum);
					// save the image object here
					
					si = saveImageFromTempFolder(imgTempFileName,songName,albumName);
					if(isDefined("si")){
						song.setImage(si);
					}
					entitySave(song);
					ormflush();
				}
			}else{
				// Create Album
				album = entityNew("album");
				album.setAlbumName(albumName);
				if(artistServices.isArtistExists(artistName)){
				}else{
					// create artist and then add album
					artist = entityNew("artist");
					artist.setArtistName(artistName);
					artist.addsubGenres(subgenre);
					entitySave(artist);
					ormflush();
				}
					tempArtist = artistServices.getArtistByArtistName(artistName);
					album.setArtist(tempArtist);
					entitySave(album);
					ormflush();
					
					tempAlbum = albumServices.getAlbumByAlbumName(albumName);
					
					song = entityNew("song");
					song.addSubGeners(subgenre);
					song.setName(songName);
					// songPath would be /Linkin Park/Meteora/01 Somewhere I Belong.mp3
					
					songPath = "/" & artistName & "/" & albumName & "/" & fileName;
					sourcePath = uploadDir & "\" & fileName ;
					destination = songDir & "\" & artistName & "\" & albumName & "\";
						if(! DirectoryExists(destination)){
							DirectoryCreate(destination);
						}
					fileMove(sourcePath,destination);
					
					song.setPath(songPath);
					song.setAlbum(tempAlbum);
					// save the image object here
					si = saveImageFromTempFolder(imgTempFileName,songName,albumName);
					if(isDefined("si")){
						song.setImage(si);
					}
					entitySave(song);
					ormflush();
			}
			
			
			
			/*if(! artistServices.isArtistExists(artistName)){
				// Create New artist
				dbArtist.setArtistName(artistName);
				artistServices.addArtist(dbArtist);
			}else{
				// use existing artist
				flag = true;
			}
			dbArtist = artistServices.getArtistByArtistName(artistName);
			if(flag){
				// find that the album already exist for the artist
				testAlbum = "";
				if(albumServices.isAlbumExists(albumName)){
					testAlbum = albumServices.getAlbumByAlbumName(albumName);
					if(dbArtist.hasAlbums(testAlbum)){
						
					}else{
						
					}
				}
			}else{
				// this is a new artist create album and add to artist
				album = new CFTunes.cfc.model.album();
				album.setAlbumName(albumName);
				
			}
			// check for song is that already existing*/
			
		}
	}
	
	private any function saveImageFromTempFolder(imgTempFileName,songName,albumName){
		//please make sure the song name is unique
		if(! imgTempFileName == ""){
			tempFolder = Application.tempDir & "\";
			destinationFolder = Application.imagesDir & "\";
			x = imgTempFileName;
			extnsn  = Right(x, Len(x)-Find(".", x));
			
			
			imageDao = new CFTunes.cfc.dao.imageDao();
			image = new CFTunes.cfc.model.image();
			
			imageName = albumName & "_" & songName ;
			imageFileName = imageName &"."& extnsn;
			source = tempFolder & imgTempFileName;
			destination = destinationFolder & imageFileName;
			
			FileMove(source, destination);
			image.setImageName(imageName);
			image.setImageFileName(imageFileName);
			imageDao.saveImage(image);
			ormFlush();
			
			retImage = imagedao.getImageByImageName(imageName);
			return retImage;
		}
	}
	
	remote void function modifySongQuery(cfgridaction,cfgridrow,cfgridchanged){
		rowIndex = cfgridrow.CFGRIDROWINDEX;
		kList = structKeyArray(cfgridchanged);
		keyName = kList[1];
		sQuery = Session.songQuery;
		QuerySetCell(Session.songQuery, keyName, cfgridchanged[keyName] , rowIndex );
	}
	
	remote any function getUploadFolderSongs(cfgridpage,cfgridpageSize,cfgridsortcolumn,cfgridsortdirection){
	
	}
	
	
	remote Struct function getReleventSongs(cfgridpage,cfgridpageSize,cfgridsortcolumn,cfgridsortdirection){
		aSongs = arraynew(1);
		if(isDefined("url.artistId")){
			artistId = url.artistId;
			aSongs = ORMexecuteQuery("SELECT * FROM SONG s WHERE s.album.artist.artistId = #artistId# ");
		}
		
		if(isDefined("url.albumId")){
			albumId = url.albumId;
			aSongs = getAllSongByAlbumId(albumId);
		}
		songQuery = QueryNew("songId,name,path,album,artist");
		
		for(i=1;i <= Arraylen(aSongs);i++){
			newRow = QueryAddRow(songQuery);
			QuerySetCell(songQuery, "songId", aSongs[i].getSongId());
			QuerySetCell(songQuery, "name", aSongs[i].getName() );
			QuerySetCell(songQuery, "path", aSongs[i].getPath() );
			QuerySetCell(songQuery, "album", aSongs[i].getAlbum().getAlbumName() );
			QuerySetCell(songQuery, "artist", aSongs[i].getAlbum().getArtist().getArtistName());
		}
		return QueryConvertForGrid(songQuery,cfgridpage, cfgridpageSize);
	}
}