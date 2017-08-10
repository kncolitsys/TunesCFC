<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<cfajaxproxy cfc="CFTunes.cfc.services.playlistServices" jsclassname="PlaylistServices">
<cfajaxproxy cfc="CFTunes.cfc.services.SongServices" jsclassname="SongServices">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CFTunes</title>
<cfinclude template="../css/css.cfm">
<cfajaximport tags="cfdiv,cfprogressbar,CFTREE,cfform,cflayout-border,cfwindow,CFLAYOUT-TAB,CFGRID,CFLAYOUT-ACCORDION,cfmessagebox,CFBUTTON,CFMAP">
</head>
<body>
	<table cellpadding="0" width="100%" cellspacing="0" border="0" class="page">
    	<tr>
        	<td class="mainBody" align="center">
        		<table border="0" width="1011" cellpadding="0px" cellspacing="0px" align="center">
                        <tr><td></td></tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td><div class="headerLogoContainer"><img  src="../img/logo.png"/></div></td>
                                        <td class="headerContainerMain">
                                            <div class="headerContainerMainDiv">	
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td class="headerSubContainerLeft"></td>
                                                        <td class="headerSubContainerMain" valign="top">
                                                            <!-- Main tabs will go here -->
                                                          	 <cfoutput>
                                                          	 <cfset artistId = url.artistId>
                                                            <table cellpadding="0" cellspacing="0" border="0" class="tabContainerTable">
                                                             	<tr>
                                                                	<td><div style="width:100px"></div></td>
                                                                	<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../artist/artistInfo.cfm?artistId=#artistId#','mainContainerCFDiv');" class="linkImage"><img src="../img/button_info_up.png" /></a></div></td>
                                                               		<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../artist/artistEvents.cfm?artistId=#artistId#','mainContainerCFDiv');" class="linkImage"><img src="../img/button_events_up.png" /></a></div></td>
																	<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../artist/artistImages.cfm?artistId=#artistId#','mainContainerCFDiv');" class="linkImage"><img src="../img/button_photos_up.png" /></a></div></td>
																	<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../artist/artistPdf.cfm?artistId=#artistId#','mainContainerCFDiv');" class="linkImage"><img src="../img/button_pdf_up.png" /></a></div></td>
																	<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../artist/artistPPT.cfm?artistId=#artistId#','mainContainerCFDiv');" class="linkImage"><img src="../img/button_presentation_up.png" /></a></div></td>
																	
                                                                    <td valign="top">
                                                                    	<div style="width:200px">
                                                                            
                                                                   	  </div>
                                                                    </td>
                                                                </tr>
                                                             </table>
															 </cfoutput>
                                                        </td>
                                                    </tr>
                                                </table>
                                             </div>
                                        </td>
                                        <td><div class="headerRightContainer"><img src="../img/headerSliceRight.png" /></div></td>
                                    </tr>
                                </table>
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
                    </table> 
        	</td>
        </tr>                  
     </table>     
<cfwindow name="popUpWindow" width="700" height="350" title="Create New Playlist" initShow="false" closable="true"  modal="true" center="true"></cfwindow>
</body>
</html>
