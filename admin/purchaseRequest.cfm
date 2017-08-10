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
password = "#application.emailuserName#"
connection = "test.cf.gmail">
<!--- Retrieve header information from the mailbox. --->

<cfimap
folder="CFTunes"
action="GetAll" uid="1,4"
attachmentpath="#Application.attachmentDir#"
connection="test.cf.gmail"
name="queryname">



<cfdump var="#queryname#">
<cfimap
action="close"
connection = "test.cf.gmail">
</body>
</html>