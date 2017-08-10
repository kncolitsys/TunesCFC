component  output="false" persistent="true" 
{
	property name="playlistId" fieldtype="id" type="numeric" generator="native" ;
	property name="playlistName" type="string";
	property name="description" type="string";
	property name="createdBy" cfc="user" fieldtype="many-to-one" lazy="true" fkcolumn="createdBy"; 
	property name="createdOn";
	property name="songs" fieldtype="many-to-many" linktable="playlist_song" cfc="song" fkcolumn="playlistId" inversejoincolumn="songId" lazy="true";
	property name="playlistRatings" fieldtype="one-to-many" cfc="playlistRating" fkcolumn="playlistId" lazy="true" orderby="ratedOn desc";
	property name="tags" fieldtype="many-to-many" linktable="playlist_tag" fkcolumn="playlistId" cfc="tag" inversejoincolumn="tagId";
	property name="subgenres" fieldtype="many-to-many" linktable="playlist_subgenre" fkcolumn="playlistId" cfc="subGenre" inversejoincolumn="subgenreId";
	property name="moods" fieldtype="many-to-many" linktable="playlistMood_playlist" fkcolumn="playlistId" cfc="playlistMood" inversejoincolumn="moodId";
	property name="subscribers" fieldtype="many-to-many" linktable="user_playlist" cfc="user" fkcolumn="playlistId" inversejoincolumn="userId" lazy="true";
}