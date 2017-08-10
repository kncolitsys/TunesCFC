component  output="false"
{
	public void function addArtist(artistObj){
		EntitySave(artistObj);
	}
	
	public void function addAlbum(albumObj){
		EntitySave(albumObj);
	}
	
	public void function addSong(songObj){
		EntitySave(songObj);
	}
	
	public any function getSubgenreBySubGenreName(subGenreName){
		subgenre = ORMexecuteQuery("FROM subGenre sg WHERE sg.subGenreName="& "'" & subGenreName &"'",true);
		if(! Isdefined("subgenre")){
			throw("noSuchSubgenre","Sub Genre");
		}else{
			return subgenre;
		}
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