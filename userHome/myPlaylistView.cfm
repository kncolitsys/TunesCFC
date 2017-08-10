<cfinclude template="../userHome/myPlaylistMod.cfm">

<script language="JavaScript" type="text/javascript">
	/*<![CDATA[*/
	/*]]>*/
</script>

<script type="text/javascript">
//<![CDATA[

//]]>
</script>


<!-- Main Toolbar starts here -->

<table cellspacing="0" cellpadding="0" border="0" align="center" style="margin-top:8px">
	<tr>
		<td>
			<div class="mainToolbar">
				<div id="myPlaylistToolBar" style="width:977px;border:1px"></div>
			</div>
		</td>
	</tr>
</table>

<!-- Main Toolbar ends here -->


<table align="center" width="1000px" class="myPlaylistTable" border="0">
	<tr>
		<td valign="top" width="206px">
        <table cellpadding="0" cellspacing="0" border="0">
        	<tr><td><img src="../img/background_hierarchy_top.png" /></td></tr>
            <tr><td>
            	<div style="background-repeat:repeat-y;background-image:url(../img/background_hierarchy_main.png);text-align:center; min-height:800px;">
						<cflayout type="accordion" name="userPlaylistPanel" titlecollapse="true"  fillheight="true" style="border:0px" >
					        <cflayoutarea title="My Playlist" overflow="hidden" style="border:0px" source="../userHome/myPlaylistMini.cfm" name="myPlaylistAccord">
									
					        </cflayoutarea>
					        <cflayoutarea title="Subscribed Playlist" overflow="hidden" style="border:0px" name="subscribedPlaylistAccord"  source="../userHome/subscribedPlaylistMini.cfm">

					        </cflayoutarea>
						</cflayout>
            	</div>
                </td>
            </tr>
            <tr><td><img src="../img/background_hierarchy_down.png" /></td></tr>
        </table>
		</td>
		<td width="3px"></td>
		<td valign="top">
			<cfdiv id="songList">
				
			</cfdiv>
		</td>
	</tr>
</table>
<script type="text/javascript">
	//<![CDATA[
	var submitForm = function(){
        ColdFusion.Ajax.submitForm("playlistForm", "newPlaylistCon.cfm", submitCallback);
	}
	
    var submitCallback = function (response){
    	var errors = ColdFusion.JSON.decode(response);
    	var valid = true;
    	for(i in errors){
				document.getElementById(i+"Error").innerHTML = errors[i];
				valid = false;
			}
		if(valid){
			ColdFusion.Window.hide("popUpWindow");
		}
    }
	
	//]]>

</script>