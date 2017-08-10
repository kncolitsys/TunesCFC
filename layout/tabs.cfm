<script type="text/javascript">
	/* <![CDATA[ */
	
	CFTunes.sliderTab = Ext.extend(Ext.util.Observable,{
		constructor: function(tabId){
			CFTunes.sliderTab.superclass.constructor.call(this);
			this.addEvents('expansion');
			this.tab = Ext.get(tabId);
			this.expanded = false;
			this.initSlideTab();
	    },
		initSlideTab:function(){
			aSlideTabButtons = this.tab.select('a.slideTabButton');
			aAppearButtons =  this.tab.select('div.appearButtons');
			this.appearButton = Ext.get(aAppearButtons.elements[0]);
			this.slideTabButton = Ext.get(aSlideTabButtons.elements[0]);
			this.slideTabButton.on('click',this.toggleTab,this,{});
		},
		toggleTab:function(){
			if(this.expanded){
				this.collapseTab();
			}else{
				this.expandTab();
			}
		},
		expandTab:function(){
			this.fireEvent('expansion', this);
			this.appearButton.slideIn('l', { duration: 1,useDisplay:true });
			this.expanded = true;
		},
		collapseTab:function(){
			this.appearButton.slideOut('l', { duration: .5,useDisplay:true });
			this.expanded = false;
		}
	});
	
	CFTunes.tabMenu = Ext.extend(Object,{
		constructor: function(){
			this.tab1 = new CFTunes.sliderTab("tabContainerMusic");
			this.tab2 = new CFTunes.sliderTab("tabContainerMyCFTunes");
			this.initTabMenu();
	    },
		initTabMenu:function(){
			this.tab1.on('expansion',this.collapseTab2,this,{});
			this.tab2.on('expansion',this.collapseTab1,this,{});
		},
		collapseTab1:function(){
			if(this.tab1.expanded){
				this.tab1.collapseTab();
			}
		},
		collapseTab2:function(){
			if(this.tab2.expanded){
				this.tab2.collapseTab();
			}
		}
		
	});
	
	
	/* ]]> */
</script>


<table cellpadding="0" cellspacing="0" border="0" id="tabContainerTable" class="tabContainerTable">
 	<tr>
    	<td><div style="width:70px"></div></td>
    	<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../home/homeView.cfm','mainContainerCFDiv');" class="linkImage"><img src="../img/button_home_up.png" /></a></div></td>
        <td>
        
		
        	<div id="tabContainerMusic" class="tabButtonContainer">
				<table cellpadding="0" cellspacing="0" border="0">
                	<tr>
                    	<td>
                    		<a href="#" class="linkImage slideTabButton" id="slideTabButtonMusic">
                        		<img src="../img/button_music_up.png"  style="float:left;" />
                            </a>
                        </td>
                        <td>
                        
							<!--- appearButtons starts here --->
                        	<div id="appearButtons" class="appearButtons" style="display:none;">
                            	<div>
                        			<div>
                        				
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td><img src="../img/subTabLeft.png" /></td>
												<td>
													<table cellpadding="0" cellspacing="0" border="0">
														<tr>
															<td>
																<a href="javascript:ColdFusion.navigate('../library/libraryView.cfm','mainContainerCFDiv',initLibrary);" class="linkImage"><img src="../img/buttonLibrary.png" /></a>
															</td>
															<td>
																<a href="javascript:playlistButtonClicked()" class="linkImage"><img src="../img/buttonPlaylist.png" /></a>
															</td>
														</tr>
													</table>
												</td>
												<td><!-- img src="../img/subTabRight.png" / --></td>
											</tr>
										</table>
									</div>
                                 </div>   
                            </div>
							<!--- appearButtons ends here --->
                      </td>
                    </tr>
                </table>
            </div>
			
			
			
			
        </td>
        <td><div class="tabButtonContainer" id="tabContainerMyCFTunes">
		
		
				<table cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td>
                            		<a href="#" class="linkImage slideTabButton" id="slideTabButtonMyCFTunes">
                                		<img src="../img/button_myCFTunes_up.png"  style="float:left;" />
                                    </a>
                                </td>
                                <td>
                                
                                	<div id="appearButtons2" class="appearButtons" style="display:none;">
                                    	<div>
                                			<div>
                                				
												<table cellpadding="0" cellspacing="0" border="0">
													<tr>
														<td><img src="../img/subTabLeft.png" /></td>
														<td>
															<table cellpadding="0" cellspacing="0" border="0">
																<tr>
																	<td>
																		<a href="javascript:ColdFusion.navigate('../userHome/profileView.cfm','mainContainerCFDiv',initLibrary);" class="linkImage"><img src="../img/buttonProfile.png" /></a>
																	</td>
																	<td>
																		<a href="javascript:ColdFusion.navigate('../userHome/myPlaylistView.cfm','mainContainerCFDiv',renderToolbar);" class="linkImage"><img src="../img/buttonMyPlaylist.png" /></a>
																	</td>
																</tr>
															</table>
														</td>
														<td><!-- img src="../img/subTabRight.png" / --></td>
													</tr>
												</table>
											</div>
                                         </div>   
                                    </div>
									
                              </td>
                            </tr>
                        </table>
		
		</div>
		</td>
		<td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../search/searchView.cfm','mainContainerCFDiv');" class="linkImage"><img src="../img/button_search_up.png" /></a></div></td>
        <td><div class="tabButtonContainer"><a href="javascript:ColdFusion.navigate('../guitar/guitar.cfm','mainContainerCFDiv',initGuitarSection);" class="linkImage"><img src="../img/button_guitar_up.png" /></a></div></td>
        <td valign="top">
        	<div style="width:300px">
        		<div class="welcomeContainer">
        			<cfoutput>
                		Welcome : #userName# <cfif isUserInRole("Administrator")>| <a href="javascript:manageClicked();">Manage</a></cfif> | Profile | <a href="../login/logout.cfm">Logout</a> |
                	</cfoutput>
				</div>
                
       	  </div>
        </td>
    </tr>
 </table>
 
 <script type="text/javascript">
 	new CFTunes.tabMenu();
 </script>
 