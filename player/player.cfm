<cfscript>
	services = createObject("component", "CFTunes.cfc.services.SongServices");
	aSongs = services.getAllSongByAlbumId(1);
</cfscript>
        <div class="playerDivContainer">
           <div id="mainPlayer">

           		<div>
                    <table class="playerTableMain" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><img src="../img/player_slice_left.png" /></td>
                            <td class="playerTdMain">
                            	<!-- Player Main Buttons Goes Here -->
                                <div class="songScrollerMainCointainer">
                                	<table cellpadding="0" cellspacing="0" border="0">
                                    	<tr>
                                        	<td>
                                            	<!-- Buttons will go here -->
                                                	<a href="#" onclick="CFTunesPlayer.previous()"><img src="../img/rewind.png"  /></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <a href="#" onclick="CFTunesPlayer.play();" id="playButton"><img src="../img/play.png" /></a>
													<a href="#" onclick="CFTunesPlayer.pause();" id="pauseBotton" style="display:none;"><img src="../img/pause.png" /></a>
													&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <a href="#" onclick="CFTunesPlayer.next()"><img src="../img/forward.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            	<!-- Button ends here -->
                                            </td>
                                        	<td>                    	
                                    			<table cellspacing="0" cellpadding="0">
                                        	<tr>
                                            	<td><img src="../img/song_scroller_left.png" /></td>
                                                <td>
                                                	<div class="songScrollerMain">
                                                		<!-- Content for song scroller goes here -->
															<table>
                                                            	<tr>
                                                                    <td>
                                                                    	<div style="width:300px;text-align:center" id="tickfield"></div>
                                                                    	<!---<script language="javascript">textticker();</script>--->
                                                                    </td>
                                                                    <td valign="middle"><img src="../img/musicIcon_small.png" /></td>
                                                                </tr>
                                                            </table>
                                                        <!-- Content for song scroller ends here -->
                                                	</div>
                                                 </td>
                                                <td><img src="../img/song_scroller_right.png" /></td>
                                            </tr>
                                        </table>
                                			</td>
                                        </tr>
                                    </table>
                                </div>
           							 
 								<!-- player Buttons ends here -->                           
                            </td>
                            <td><a href="#" id="playerLink"><img id="playerLinkImg" src="../img/player_slice_right_in.png" /></a></td>
                        </tr>
                    </table>
                </div>
                
                <div style="display:block;"  id="currentPlaylistOnButton"><a href="#" id="playListLink"><img id="playlistImageLink" src="../img/Playlist_button_slide_down.png" /></a></div>
					<div style="display:none;" id="currentPlaylist">
                    <table cellpadding="0" cellspacing="0" border="0"  class="playlistMainContainerTable">                

						<tr>
                        	<td valign="top" style="overflow:hidden">
                                <div id="currentPlaylist" class="playlistMain">
                                	<!-- Play list goes here --->
									<ol class="currentPlaylistSongList" id="currentPlaylistSongList">
									</ol>
										<!---	<cfoutput>
												<ul id="currentPlaylistSongList">
													<cfloop array="#aSongs#" index="song">
														<cfset liId = "song_#song.getSongId()#_#song.getName()#_#song.getPath()#" >
														<li id="#liId#" ><a href="##" onclick="playMe('#liId#')">#song.getName()#</a></li>
													</cfloop>
												</ul>
									        </cfoutput>--->
                                </div>
                            </td>
                        </tr>
                        <tr>
						  <td align="center"><a href="#" id="playlistOffButton"><img src="../img/Playlist_button_slide_up.png" /></a></td>
                         </tr>
                    </table>
                </div>
                
           </div>         
        </div>
		<script type="text/javascript">
			// new CFTunes.PlayerAnimation('mainPlayer','playerLink','playerLinkImg');
			new CFTunes.PlayerAnimation({
					currentPlaylistId : 'currentPlaylist',
					currentPlaylistOnButtonId: 'currentPlaylistOnButton',	
					currentPlaylistOffButtonId: 'playlistOffButton',
					playerId:'mainPlayer',
					playerLinkId:'playerLink',
					playerOpenerId:'playerLinkImg'
			});
			
			CFTunesPlayer  = new CFTunes.audioPlayer();
		</script>