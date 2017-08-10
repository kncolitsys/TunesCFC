component table="song" output="false" persistent="true" 
{
	property name="songId" fieldtype="id" type="numeric" generator="native" ;
	property name="name" type="string";
	property name="path" type="string";
	property name="album" fieldtype="many-to-one" cfc="album" fkcolumn="albumId" lazy="true";
	property name="subGeners" fieldtype="many-to-many" linktable="song_subGenre" cfc="subGenre" fkcolumn="songId" inversejoincolumn="subGenreId" lazy="true" ;
	property name="image" fieldtype="one-to-one" fkcolumn="imageId" cfc="image";
	
}