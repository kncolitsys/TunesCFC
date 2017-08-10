<cfscript>
	// Initialize the variables
	songService = new CFTunes.cfc.services.SongServices();
	genres  = songService.getAllGenres();
	subGenres = songService.getAllSubGenresByGenreId(5);
	artists = songService.getAllArtistBySubGenreId(4);
	albums = songService.getAllAlbumByArtistId(1);
	songs = songService.getAllSongByAlbumId(1);
</cfscript>