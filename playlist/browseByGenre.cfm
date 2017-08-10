<cfscript>
		songService = new CFTunes.cfc.services.SongServices();
		genres  = songService.getAllGenres();
</cfscript>

<table align="center" width="1000px" class="myPlaylistTable" border="0">
	<tr>
		<td valign="top" width="206px">
        <table cellpadding="0" cellspacing="0" border="0">
        	<tr><td><img src="../img/background_hierarchy_top.png" /></td></tr>
            <tr><td>
            	<div style="background-repeat:repeat-y;background-image:url(../img/background_hierarchy_main.png);text-align:center; min-height:800px;">
					<cfoutput>
						<cflayout type="accordion" name="genrePanel" titlecollapse="true"  fillheight="true" style="border:0px" >
							<cfloop array="#genres#" index="genre">
						        <cflayoutarea title="#genre.getGenreName()#" overflow="hidden" style="border:0px">
									<cfloop array="#genre.getSubGenres()#" index="subGenre">
										<div><a href="javascript:ColdFusion.navigate('../playlist/subgenrePlaylist.cfm?subGenreId=#subGenre.getsubGenreId()#','playlistListGenre');" >#subGenre.getsubGenreName()#</a></div>
                                    </cfloop>
						        </cflayoutarea>
                            </cfloop>
						</cflayout>
                    </cfoutput>
            	</div>
                </td>
            </tr>
            <tr><td><img src="../img/background_hierarchy_down.png" /></td></tr>
        </table>
		</td>
		<td width="3px"></td>
		<td valign="top">
			<cfdiv id="playlistListGenre">
				
			</cfdiv>
		</td>
	</tr>
</table>