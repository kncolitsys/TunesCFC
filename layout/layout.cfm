<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>CFTunes</title>
<cfinclude template="../css/css.cfm">
<!---<script type="text/javascript" src="/CFIDE/scripts/ajax/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/CFIDE/scripts/ajax/ext/ext-all.js"></script>--->

<cfinclude template="../js/javascripts.cfm">

<cfajaximport tags="CFINPUT-AUTOSUGGEST,cfdiv,CFPOD,CFPROGRESSBAR,CFTEXTAREA, CFFILEUPLOAD, CFTREE,cfform,cflayout-border,cfwindow,CFLAYOUT-TAB,CFGRID,CFLAYOUT-ACCORDION,cfmessagebox,CFMEDIAPLAYER">
<cfscript>

	userName = GetAuthUser();
	if(userName == ""){
		location(url="../login/login.cfm",addtoken="false");
	}else{
		userServices = new CFTunes.cfc.services.userServices();
		userRoles = "";
		userObj = userServices.getUserObjByUserName(userName);
	}
</cfscript>
</head>
<body>

<div id="mainApplication">
	<table cellpadding="0" width="100%" cellspacing="0" border="0" class="page">
    	<tr>
        	<td class="mainBody" align="center">
        		<table border="0" width="1011" cellpadding="0px" cellspacing="0px" align="center">
                        <tr><td></td></tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" border="0" id="myTable">
                                    <tr>
                                        <td><div class="headerLogoContainer"><img  src="../img/logo.png"/></div></td>
                                        <td class="headerContainerMain">
                                            <div class="headerContainerMainDiv" id="headerContainerMainDiv">	
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td class="headerSubContainerLeft"></td>
                                                        <td class="headerSubContainerMain" valign="top">
                                                            <!--- Main tabs will go here --->
                                                          	 
															 <cfinclude template="../layout/tabs.cfm">
                                                            
															<!--- tabContainer ends here ---> 
                                                        </td>
                                                    </tr>
                                                </table>
                                             </div>
											 <!--- headerContainerMainDiv ends here --->
											 
											 
											 
                                        </td>
                                        <td><div class="headerRightContainer"><img src="../img/headerSliceRight.png" /></div></td>
                                    </tr>
                                </table><!--Table id="myTable" end here -->
                            </td>
                        </tr>
                        <tr><td height="8"></td></tr>
                        <tr><td class="contentBodyTop"></td></tr>
                        <tr>
                        	<td class="contentBodyMain">
                        		<!-- Main Content Goes Here -->
								<cfdiv id="mainContainerCFDiv" class="cfDivMain">
								 <cfinclude template="#mainTemplate#">
								</cfdiv> 
                        	</td>
						</tr>
						
						
                        <tr><td class="contentBodyBottom">
                        
						
						</td></tr>
						
						<tr>
							<td>
							<div align="middle" style="margin-right:10px;margin-top:20px;height:20px">
								<img src="../img/poweredByCF.jpg" />
							</div>
							</td>
						</tr>
                    </table> 
        	</td>
        </tr>                  
     </table>     

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
id="AudioPlayer" width="1" height="1"
codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
<param name="movie" value="../audioPlayer/AudioPlayer.swf" />
<param name="quality" value="high" />
<param name="bgcolor" value="#869ca7" />
<param name="allowScriptAccess" value="sameDomain" />

<embed src="../audioPlayer/AudioPlayer.swf" quality="high" bgcolor="#869ca7"
width="1" height="1" name="AudioPlayer" align="middle"
play="true" loop="false" quality="high" allowScriptAccess="sameDomain"
type="application/x-shockwave-flash"
pluginspage="http://www.macromedia.com/go/getflashplayer">
</embed>
</object>
	 
     <cfinclude template="../player/player.cfm" >
	<cfwindow name="popUpWindow" width="750" height="650" title="Create New Playlist" initShow="false" closable="true" resizable="false"   modal="true" center="true"></cfwindow>
	<cfwindow name="popUpWindowPlaylist" width="750" height="650" title="Create New Playlist" initShow="false" closable="true" resizable="false" modal="true" center="true"></cfwindow>
	<cfwindow name="popUpVideo" width="530" height="435" title="Video" initShow="false" closable="true" resizable="false" modal="true" center="true" source="../player/cfMediaPlayer.cfm"></cfwindow>
	<cfwindow bodystyle="background-color:white;" name="popUpAddComment" width="750" height="400" title="Add Comment" initShow="false" closable="true" resizable="false" modal="true" center="true"></cfwindow>
	</div>
</body>
</html>
