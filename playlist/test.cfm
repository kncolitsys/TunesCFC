<cfscript>
	songs = EntityLoadByPK("playlist",1).getSongs();
</cfscript>
<cfset myjson = serializeJSON(songs)>
 <cfdump var="#myjson#"> 
<cfabort>

<cfajaxproxy cfc="CFTunes.cfc.services.playlistServices" jsclassname="PlaylistServices">
<script type="text/javascript">
	function playAllInPlaylist(playlistId){
		service = new PlaylistServices();
		x = service.getAllSongsByPlaylistId(playlistId);
		z = service.getAllSongsByPlaylistIdQuery(playlistId);
		y = 5;
		}
</script>

<a href="javascript:playAllInPlaylist(1)" >Click Me!!!!</a>
