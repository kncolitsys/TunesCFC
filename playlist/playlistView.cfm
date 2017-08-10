<div  align="center" style="margin-top:10px">
	<div style="width:980px"id="playlistSectionToolbar"></div>
</div>

<div align="center" style="margin-top:15px">
	<cflayout type="tab" style="width:980px" height="1000" name="playlistsTabs">
		<cflayoutarea
			closable="false"
			disabled="false"
			name="latestPlaylist"
			overflow = "auto"
			selected="true"
			title="Recent Playlist" source="../playlist/recentPlaylist.cfm">
		</cflayoutarea>
		<cflayoutarea
			closable="false"
			disabled="false"
			name="browseByType"
			overflow = "auto"
			selected="false"
			title="Browse By Genres" source="../playlist/browseByGenre.cfm">
		</cflayoutarea>
	<!---<cflayoutarea
			closable="false"
			disabled="false"
			name="rssFeed"
			overflow = "auto"
			selected="false"
			title="Browse By Mood" source="../playlist/browseByMood.cfm">
		</cflayoutarea>--->
    </cflayout>
</div>

