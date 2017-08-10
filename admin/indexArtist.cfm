<html> 
<head> 
    <title>Adding Query Data to an Index</title> 
</head> 
<body> 
 
<!--- Retrieve data from the table. ---> 
<cfquery name="artist" datasource="cftunes"> 
    SELECT artistId,artistName FROM artist
</cfquery> 
 
<!--- Update the collection with the above query results. ---> 
<cfindex  
    query="artist" 
    collection="artistcollection" 
    action="Update" 
    type="Custom" 
    key="artistId" 
    title="artistName"
    body="artistId,artistName"> 
 
<h2>Indexing Complete</h2> 
</body> 
</html>