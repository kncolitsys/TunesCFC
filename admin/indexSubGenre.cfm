<html> 
<head> 
    <title>Adding Query Data to an Index</title> 
</head> 
<body> 
 
<!--- Retrieve data from the table. ---> 
<cfquery name="subgenre" datasource="cftunes"> 
    SELECT subGenreId,subGenreName FROM subgenre
</cfquery> 
 
<!--- Update the collection with the above query results. ---> 
<cfindex  
    query="subgenre" 
    collection="subgenrecollection" 
    action="Update" 
    type="Custom" 
    key="subGenreId" 
    title="subGenreId"
    body="subGenreId,subGenreName"> 
 
<h2>Indexing Complete</h2> 
</body> 
</html>