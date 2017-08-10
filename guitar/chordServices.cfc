<cfcomponent >
	<cffunction name="createPdf" access="remote">
	<cfargument name="imgArray">
	<cfdump var="#arguments.imgArray#">
		<cfdocument filename="test.pdf" overwrite="true" format="PDF">
			<cfoutput >
				<cfloop index="imgSrc" array="#imgArray#">
					<img src="#imgSrc#"  height="155px" width="119px">
	            </cfloop>
            </cfoutput>
		</cfdocument>
    </cffunction>
</cfcomponent>