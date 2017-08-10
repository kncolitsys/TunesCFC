<table border="1">
	<cfloop array="#songs#" index="song">
		<tr>
			<td>
				<cfoutput>#song.getName()#</cfoutput>
			</td>
		</tr>
    </cfloop>
</table>