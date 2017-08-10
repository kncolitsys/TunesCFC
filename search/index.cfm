<html> 
<head> 
    <title>Adding Query Data to an Index</title> 
</head> 
<body> 
 
<!--- Retrieve data from the table. ---> 
<cfquery name="getAlbums" datasource="cftunes"> 
    SELECT albumId,albumName FROM album
</cfquery> 
 
<!--- Update the collection with the above query results. ---> 
<cfindex  
    query="getAlbums" 
    collection="cftunes" 
    action="Update" 
    type="Custom" 
    key="albumId" 
    title="albumId"
    body="albumId,albumName"> 
 
<h2>Indexing Complete</h2> 
 
<!--- Output the record set. ---> 
<p>Your collection now includes the following items:</p> 
<cfoutput query="getAlbums"> 
    <p>#albumId# #albumName#</p> 
</cfoutput> 
</body> 
</html>