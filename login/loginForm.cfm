<div style="margin-top:50px">
<h1>Login to CFTunes:</h1>
</div>
<div style="margin-top:50px">
<cfform name="loginform" action="#CGI.script_name#?#CGI.query_string#" method="Post"s>
	<table cellpadding="0" cellspacing="0px" border="0" align="center">
		<tr>
			<td class="formLabel"><span style="color:red">*</span>Username:</td><td><div style="width:3px"></div></td><td><cfinput class="inputText" type="text" name="j_username" required="yes" message="A user name is required"></td>
		</tr>
		<tr><td><div style="height:30px"></div></td><td></td><td valign="top" class="formHelp">Your CFTunes UserName!!</td></tr>
		<tr>
			<td class="formLabel"><span style="color:red">*</span>Password:</td><td><div style="width:3px"></div></td><td><cfinput class="inputText" type="password" name="j_password" required="yes" message="A password is required"></td>
		</tr>
	</table>
	<div style="height:20px"></div>
	
	<div style="text-align:center;"><cfinput type="submit" name="submitForm" value="Log In"></div>
	<div style="height:50px"></div>
</cfform>
	<div ><a href="#" class="passwordResetLink">Forgotten Username or Password?</a></div>
</div>