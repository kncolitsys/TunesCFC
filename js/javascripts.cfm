<!--- All ajax proxies goes here --->
<cfajaxproxy cfc="CFTunes.cfc.services.playlistServices" jsclassname="PlaylistServices">
<cfajaxproxy cfc="CFTunes.cfc.services.SongServices" jsclassname="SongServices">
<cfajaxproxy cfc="CFTunes.cfc.services.playlistFormHandling" jsclassname="playlistFormHandling">
<cfajaxproxy cfc="CFTunes.cfc.services.userServices" jsclassname="UserServices">
<cfajaxproxy cfc="CFTunes.guitar.chordServices" jsclassname="ChordServices">
<script type="text/javascript">
	var songFolder = "http://localhost:8500/CFTunes/mp3";
</script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="/CFIDE/scripts/ajax/ext/ext-all.js"></script>
<script type="text/javascript" src="../js/admin.js"></script>
<script type="text/javascript" src="../js/rating.js"></script>
<script type="text/javascript" src="../js/mainPage.js"></script>
<script type="text/javascript" src="../js/songGrid.js"></script>
<script type="text/javascript" src="../js/library.js"></script>
<script type="text/javascript" src="../js/playerAnimation.js"></script>
<script type="text/javascript" src="../js/audioPlayer.js"></script>
<script type="text/javascript" src="../js/playlist.js"></script>
<script type="text/javascript" src="../js/myPlaylist.js"></script>
<script type="text/javascript" src="../js/guitar.js"></script>
<script type="text/javascript" src="../js/search.js"></script>