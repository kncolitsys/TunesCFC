<div style="margin-top:20px">
	
	<cfform preservedata="true" id="searchFormSong" name="searchFormSong" action="#cgi.script_name#">
		<cfinput type="text" name="searchString" id="searchString">
		<input type="button" onclick="searchButtonClicked()" name="search" value="Search">
	</cfform>
	<cfdiv id="searchContainer">
	</cfdiv>
</div>
<div style="margin-top:50px"><img src="../img/poweredBySolrSmall.jpg"></div>