component  output="false" persistent="true" 
{
	property name="subGenreId" type="numeric" fieldtype="id" generator="native" ;
	property name="subGenreName" type="string";
	property name="artists" fieldtype="many-to-many" linktable="artist_subGenre" cfc="artist" fkcolumn="subGenreId" inversejoincolumn="artistId" lazy="true";
	property name="genre" fieldtype="many-to-one" fkcolumn="genreId" cfc="genre" lazy="true";
	property name="playlists" fieldtype="many-to-many" linktable="playlist_subgenre" fkcolumn="subGenreId" cfc="playlist" inversejoincolumn="playlistId";
}