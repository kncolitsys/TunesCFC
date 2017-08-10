<!--- Retrieving e-mails from a folder --->
<html >
<head>
<title>IMAP Mail Client</title>
</head>
<body>
<!--- Replace your username and password with valid IMAP email account name and password. --->
<cfimap
server = "imap.gmail.com"
username = "#application.emailuserName#"
action="open"
secure="yes"
password = "#application.password#"
connection = "test.cf.gmail">
<!--- Retrieve header information from the mailbox. --->

<cfimap
action="GetHeaderOnly"
connection="test.cf.gmail"
folder="CFTunes"
name="queryname">

<cfdump var="#queryname#">
<cfimap
action="close"
connection = "test.cf.gmail">
</body>
</html>