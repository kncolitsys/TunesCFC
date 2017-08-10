/**
 * @author gtiwari
 */
function searchButtonClicked(){
	// searchContainer //navigate(URL [, container, callbackhandler, errorhandler, httpMethod, formId])
	ColdFusion.navigate('../search/songGrid.cfm','searchContainer',initSongGridOfSearch,errorHandler,'POST','searchFormSong');
}
function initSongGridOfSearch(){
	new CFTunes.songGrid('songGrid');
}
