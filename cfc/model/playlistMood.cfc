
component  output="false" persistent="true" 
{
	property name="moodId" type="numeric" fieldtype="id" generator="native" ;
	property name="moodName" type="string";
	property name="moodDescription" type="string" ;
	property name="playlists" cfc="playlist" fieldtype="many-to-many" linktable="playlistMood_playlist" fkcolumn="moodId" inversejoincolumn="playlistId";
}