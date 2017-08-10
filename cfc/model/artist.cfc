component  output="false" persistent="true" 
{
	property name="artistId" fieldtype="id" type="numeric" generator="native";
	property name="artistName" type="string";
	property name="albums" fieldtype="one-to-many" cfc="album" fkcolumn="artistId" lazy="true" ;
	property name="image" fieldtype="one-to-one"  cfc="image" fkcolumn="imageId" lazy="false" ;
	property name="subGenres" fieldtype="many-to-many" cfc="subGenre" fkcolumn="artistId" linktable="artist_subGenre" inversejoincolumn="subGenreId" lazy="true" ;
}