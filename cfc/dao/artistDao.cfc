
component  output="false"
{
	public any function getArtistByArtistId(artistId){
		artist = EntityloadByPK("artist",artistId);
		return artist;
	}
	
	public any function getArtistByArtistName(artistName){
		artist = ORMexecuteQuery("FROM artist a WHERE a.artistName="& "'" & artistName &"'",true);
		if(! Isdefined("artist")){
			throw("NoSuchArtist","Artist not Found");
		}else{
			return artist;
		}
	}
	
	public void function addArtist(artistObj){
		EntitySave(artistObj);
	}
	
}