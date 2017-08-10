<input type="button" onclick="saveLesson()" value="Save">
<table align="center" width="1000px" class="myPlaylistTable" border="0">
	<tr>
		<td valign="top" width="206px">
        <table cellpadding="0" cellspacing="0" border="0">
        	<tr><td><img src="../img/background_hierarchy_top.png" /></td></tr>
            <tr><td>
            	<div style="background-repeat:repeat-y;background-image:url(../img/background_hierarchy_main.png);text-align:center; min-height:800px;">
					<cfoutput>
						<cflayout type="accordion" name="chordA" titlecollapse="true"  fillheight="true" style="border:0px" >
						        <cflayoutarea title="A-Chords" overflow="hidden" style="border:0px">
									<cfset dirA = "#Application.webroot#CFTunes\img\guitarChord\a">
									<cfdirectory action="list" directory="#dirA#" filter="*.png" name="guitarChordsA">
									<cfloop query="guitarChordsA">
										<cfset fileName = name>
										<img src="../img/guitarChord/a/#fileName#" onclick="addImageMInLesson(this)" height="60%" width="60%" />
									</cfloop>
								</cflayoutarea>
								<cflayoutarea title="C-Chords" overflow="hidden" style="border:0px">
									<cfset dirA = "#Application.webroot#CFTunes\img\guitarChord\c">
									<cfdirectory action="list" directory="#dirA#" filter="*.png" name="guitarChordsA">
									<cfloop query="guitarChordsA">
										<cfset fileName = name>
										<img src="../img/guitarChord/c/#fileName#"  onclick="addImageMInLesson(this)" height="60%" width="60%" />
									</cfloop>
						        </cflayoutarea>
								<cflayoutarea title="D-Chords" overflow="hidden" style="border:0px">
									<cfset dirA = "#Application.webroot#CFTunes\img\guitarChord\d">
									<cfdirectory action="list" directory="#dirA#"  filter="*.png" name="guitarChordsA">
									<cfloop query="guitarChordsA">
										<cfset fileName = name>
										<img src="../img/guitarChord/d/#fileName#"  onclick="addImageMInLesson(this)" height="60%" width="60%" />
									</cfloop>
						        </cflayoutarea>
								<cflayoutarea title="E-Chords" overflow="hidden" style="border:0px">
									<cfset dirA = "#Application.webroot#CFTunes\img\guitarChord\e">
									<cfdirectory action="list" directory="#dirA#" filter="*.png" name="guitarChordsA">
									<cfloop query="guitarChordsA">
										<cfset fileName = name>
										<img src="../img/guitarChord/e/#fileName#"  onclick="addImageMInLesson(this)" height="60%" width="60%" />
									</cfloop>
								
						        </cflayoutarea>
								<cflayoutarea title="G-Chords" overflow="hidden" style="border:0px">
									<cfset dirA = "#Application.webroot#CFTunes\img\guitarChord\g">
									<cfdirectory action="list" directory="#dirA#" filter="*.png" name="guitarChordsA">
									<cfloop query="guitarChordsA">
										<cfset fileName = name>
										<img src="../img/guitarChord/g/#fileName#"  onclick="addImageMInLesson(this)" height="60%" width="60%" />
									</cfloop>
						        </cflayoutarea>
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
