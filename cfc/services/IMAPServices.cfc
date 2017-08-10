<cfcomponent>
	<cffunction name="fetchMailHeaders" access="remote" >
		<cfscript>
			if(! isDefined("session.STATUS")){
				session.STATUS = 0.1;
				session.statusMessage="Opening IMAP Connection...";
			}
		</cfscript>
		<cfimap
			server = "imap.gmail.com"
			username = "#application.userName#"
			action="open"
			secure="yes"
			password = "#application.password#"
			connection = "test.cf.gmail">
			<!--- Retrieve header information from the mailbox. --->
			<cfset session.STATUS = 0.4>
			<cfset session.statusMessage="Connection Established.Fetching Mails... " >
			<cfimap
			action="GetHeaderOnly"
			connection="test.cf.gmail"
			folder="CFTunes"
			name="mailHeaders">
			<cfset session.STATUS = 0.8>
			<cfset session.statusMessage="Mails Fetched. Closing Connection... " >
			<cfset session.mailHeaderQuery = mailHeaders >
			
			<cfimap
				action="close"
				connection = "test.cf.gmail">
			<cfset session.STATUS = 1>
			<cfset session.statusMessage="Done" >
	</cffunction>
		
	<cffunction name="fetchMails" access="remote">
	<cfargument name="uidString"> <!--- Comma seperate string --->
		<cfimap
			server = "imap.gmail.com"
			username = "ozeetee"
			action="open"
			secure="yes"
			password = "##weetL0v"
			connection = "test.cf.gmail">
			
			<cfimap
			folder="CFTunes"
			action="GetAll"
			uid="#uidString#"
			attachmentpath="#Application.attachmentDir#"
			connection="test.cf.gmail"
			name="mailQuery">
			<cfimap	action="close" connection = "test.cf.gmail">
			<cfreturn mailQuery>
	</cffunction>
	
</cfcomponent>