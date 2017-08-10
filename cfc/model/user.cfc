component persistent="true" output="false"
{
	property name="userId" fieldtype="id" type="numeric" generator="native" ;
	property name="userName" type="string";
	property name="email" type="string";
	property name="password" type="string";
	property name="gender" type="string" ;
	property name="dob";
	property name="playlists" fieldtype="one-to-many" cfc="playlist" fkcolumn="createdBy" lazy="true";
	property name="subscribedPlaylists" fieldtype="many-to-many" linktable="user_playlist" cfc="playlist" fkcolumn="userId" inversejoincolumn="playlistId" lazy="true" ;
	property name="favoriteArtists" fieldtype="many-to-many" linktable="user_artist" fkcolumn="userId" inversejoincolumn="artistId" lazy="true" cfc="artist";
	property name="roles" fieldtype="many-to-many" linktable="user_role" fkcolumn="userId" inversejoincolumn="roleId" lazy="true" cfc="role";
}