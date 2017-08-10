<!--- Retrieve data from the table. ---> 
<cfquery name="getSongs" datasource="cftunes"> 
    SELECT songId,name FROM Song
</cfquery> 
 
<!--- Update the collection with the above query results. ---> 
<cfindex  
    query="getSongs" 
    collection="songcollection" 
    action="Update" 
    type="Custom" 
    key="songId" 
    title="songId"
    body="songId,name"> 
<h2>Indexing Complete</h2> 