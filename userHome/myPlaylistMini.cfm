<cfinclude template="../userHome/myPlaylistMod.cfm">
<cfoutput>
	<cfloop array="#myPlaylists#" index="playlist">
		<div><a href="javascript:playlistLinkClickedMyPlaylist(#playlist.getPlaylistId()#);" >#playlist.getPlaylistName()#</a></div>
	</cfloop>
</cfoutput>