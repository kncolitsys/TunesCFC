component  output="false"
{
	public function getAlbumByAlbumId(albumId){
		return entityLoadByPK("album",albumId);
	}
	
	public any function getAlbumByAlbumName(albumName){
		album = ORMexecuteQuery("FROM album a WHERE a.albumName="& "'" & albumName &"'",true);
		if(! Isdefined("album")){
			throw(type="albumNotFound", message= "No such album");
		}else{
			return album;
		}
	}
	
	public void function addAlbum(albumObj){
		EntitySave(albumObj);
	}
	
	public any function getSongBySongNameOfAlbum(songName,albumId){
		try
        {
			song = ORMexecuteQuery("FROM song s WHERE s.album.albumId="&"'" & albumId &"' and s.name=" & "'" & songName &"'" ,true);
        }
        catch(Any e)
        {
			
        }
		if(isDefined("song")){
			return song;
		}else{
			throw(type="songNotFound", message= "No such song");
		}
	}
}