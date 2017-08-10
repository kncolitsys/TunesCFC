<cfscript>
	userName = GetAuthUser();
</cfscript>
<table align="center" width="1000px" class="myPlaylistTable" style="margin-top:0px;margin-left:7px" border="0">
	<tr>
		<td valign="top" width="200px">
	        <cfpod 	height = "800"
					bodystyle="background-color:##ECECEC;"
					title="About"
					name = "stats"
					width = "190">
					<img src="../img/user_photu.png" />
					<div style="text-align:center; margin-top:10px"><h4><cfoutput>#userName#</cfoutput></h4></div>
			</cfpod>
		</td>
		<td valign="top">
			<table>
				<tr>
					<td width="583px">
					<cflayout type="tab" style="width:570px" height="800">
						<cflayoutarea
							closable="false"
							disabled="false"
							name="userProfile"
							overflow = "auto"
							selected="true"
							title="Profile">
							
						</cflayoutarea>
						<cflayoutarea
							closable="false"
							disabled="false"
							name="userPlaylists"
							overflow = "auto"
							selected="false"
							title="Playlists" >
						</cflayoutarea>
		            </cflayout>
					</td>
					<td>
						<div>
						<cfpod 	height = "150"
								name = "activity"
								title = "Activity"
								width = "190">
							
						</cfpod>
						</div>
						<div style="margin-top:10px"> 
						<cfpod title="Favorite Artist"
								height = "200"
								name = "stats"
								width = "190">
						</cfpod>
						</div>
						<div style="margin-top:10px"> 
						<cfpod title="Favorite Genres"
								height = "300"
								name = "stats"
								width = "190">
						</cfpod>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>