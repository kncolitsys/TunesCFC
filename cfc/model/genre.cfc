component  output="false" persistent="true" 
{
	property name="genreId" fieldtype="id" type="numeric" generator="native";
	property name="genreName" type="string" ;
	property name="imageUrl" type="string" ;
	property name="subGenres" fieldtype="one-to-many" cfc="subGenre" fkcolumn="genreId" lazy="true";
}