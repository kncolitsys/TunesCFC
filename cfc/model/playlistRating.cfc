
component  output="false" persistent="true" 
{
	property name="ratingId" type="numeric" fieldtype="id" generator="native" ;
	property name="playlist" fieldtype="many-to-one" fkcolumn="playlistId" lazy="true" cfc="playlist";
	property name="rating" type="numeric" ;
	property name="ratedBy" fieldtype="one-to-one" fkcolumn="ratedBy" cfc="user";
	property name="comment" type="string";
	property name="ratedOn";
	property name="favorite" type="numeric";
	
}