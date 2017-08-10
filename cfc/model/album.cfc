component table="album" output="false" persistent="true"
{
	property name="albumId" fieldtype="id" type="numeric" generator="native";
	property name="albumName" type="string";
	property name="artist" fieldtype="many-to-one" cfc="artist" fkcolumn="artistId" lazy="true" ;
	property name="songs" fieldtype="one-to-many" fkcolumn="albumId" cfc="song" lazy="true" ;
	property name="image" fieldtype="one-to-one" fkcolumn="imageId" cfc="image";
}