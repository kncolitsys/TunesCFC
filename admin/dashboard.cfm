<cfscript>
	
	
</cfscript>


<table cellspacing="55px">
	<tr>
		<td>
			<cfpod 	height = "350"
					name = "songsStats"
					title = "Songs"
					width = "400">
				<cfchart>
					<cfchartseries type="pie">
						<cfchartdata item="Rock" value="100">
						<cfchartdata item="Electronic" value="10">
						<cfchartdata item="Blues" value="20">
						<cfchartdata item="Hop-Hop" value="30">
						<cfchartdata item="Metal" value="200">
						<cfchartdata item="Pop" value="15">
						<cfchartdata item="Alternative" value="50">
						<cfchartdata item="Dance" value="60">
					</cfchartseries>
				</cfchart>
			</cfpod>
		</td>
		<td>
			<cfpod 	height = "350"
					name = "siteTraffic"
					title = "Site Traffic"
					width = "400">
				
			</cfpod>
		</td>
	</tr>
</table>



