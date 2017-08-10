<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<cfajaxproxy cfc="CFTunes.cfc.services.playlistServices" jsclassname="PlaylistServices">
<cfajaxproxy cfc="CFTunes.cfc.services.SongServices" jsclassname="SongServices">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CFTunes</title>
<link href="../css/layout.css" rel="stylesheet" type="text/css" />
<link href="../css/tabs.css" rel="stylesheet" type="text/css" />
<link href="../css/component.css" rel="stylesheet" type="text/css" />
<link href="../css/sideSlider.css" rel="stylesheet" type="text/css" />
<link href="../css/page.css" rel="stylesheet" type="text/css" />
<link href="../css/table.css" rel="stylesheet" type="text/css" />
<link href="../css/library.css" rel="stylesheet" type="text/css" />
<link href="../css/player.css" rel="stylesheet" type="text/css" />
<link href="../css/registration.css" rel="stylesheet" type="text/css" />
<link href="../css/toolbar.css" rel="stylesheet" type="text/css" />
<link href="../css/songTable.css" rel="stylesheet" type="text/css" />
<link href="../css/login.css" rel="stylesheet" type="text/css" />
<cfajaxproxy cfc="CFTunes.cfc.services.userServices" jsclassname="UserServices">
<script type="text/javascript" src="/CFIDE/scripts/ajax/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/CFIDE/scripts/ajax/ext/ext-all.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/formValidation.js"></script>
<!---<cfinclude template="../js/javascripts.cfm">--->
<!---<cfajaximport tags="cfdiv,CFTREE,cfform,cflayout-border,cfwindow,CFLAYOUT-TAB,CFGRID,CFLAYOUT-ACCORDION,cfmessagebox,CFBUTTON,CFMAP">--->
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
                                                          	 
                                                            <table cellpadding="0" cellspacing="0" border="0" class="tabContainerTable">
                                                             	<tr>
                                                                	<td><div style="width:100px"></div></td>
                                                                    <td valign="top">
                                                                    	<div style="width:350px">
                                                                    		<div class="welcomeContainer">
                                                                            	Welcome : Guest | <a href="../login/login.cfm">Login</a> | <a href="../register/register.cfm">Register</a>
                                                                            </div>
                                                                   	  </div>
                                                                    </td>
                                                                </tr>
                                                             </table>
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
								<div class="cfDivMain">
							 		<cfinclude template="#mainTemplate#">
								</div>
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
	 
</body>
</html>
