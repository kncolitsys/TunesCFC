<div style="margin-top:50px">
<h1>New Member Registration</h1>
</div>
<div style="margin-top:50px">
<cfform action="../register/registrationComplete.cfm">
	<table cellpadding="0" cellspacing="0px" border="0" style="margin-left:300px">
		<tr>
			<td class="formLabel"><span style="color:red">*</span>Email Address:</td><td><div style="width:8px"></div></td> <td><cfinput validate="email" id="registerEmail" validateAt="onBlur" class="inputText" type="text" message="Please enter a valid email address" name="emailAddress"></td><td><div id="registerEmail_message"></div></td>
		</tr>
		<tr><td><div style="height:30px"></div></td><td></td><td valign="top" class="formHelp">We'll keep your email private.</td></tr>
		<tr>
			<td class="formLabel"><span style="color:red">*</span>User Name:</td><td><div style="width:3px"></div></td><td><cfinput class="inputText" type="text" name="userName"  id="userNameTextBox"></td><td><div id="userNameTextBox_message"></div></td>
		</tr>
		<tr><td><div style="height:30px"></div></td><td></td><td valign="top" class="formHelp">2-10 alphanumeric characters.</td></tr>
		<tr>
			<td class="formLabel"><span style="color:red">*</span>Password:</td><td><div style="width:3px"></div></td><td><cfinput class="inputText" id="password" type="password" name="password"></td><td><div id="password_message"></div></td>
		</tr>
		<tr><td><div style="height:30px"></div></td><td></td><td valign="top" class="formHelp">Atleast 6 characters.</td></tr>
		<tr>
			<td class="formLabel"><span style="color:red">*</span>Repeat Password:</td><td><div style="width:3px"></div></td><td><cfinput class="inputText" type="password" id="repeatPassword" name="repeatPassword"></td><td><div id="repeatPassword_message"></div></td>
		</tr>
		<tr><td><div style="height:30px"></div></td><td></td><td valign="top" class="formHelp"></td></tr>
		<tr>
			<td class="formLabel">Gender:</td><td><div style="width:3px"></div></td><td align="left"><cfinput type="radio" name="gender" value="Male"><img src="../icons/male.png" />&nbsp;&nbsp;&nbsp;<cfinput type="radio" name="gender" value="Female"><img src="../icons/female.png" /></td>
		</tr>
		<tr><td><div style="height:30px"></div></td><td></td><td valign="top" class="formHelp"></td></tr>
		<tr>
			<td class="formLabel">Birthday Date:</td><td><div style="width:3px"></div></td>
			<td>		<div style="align:left;float:left">
						<cfselect name="day">
							<option value="01">01</option>
						    <option selected="true" value="02">02</option>
						    <option value="03">03</option>
						    <option value="04">04</option>
						    <option value="05">05</option>
						    <option value="06">06</option>
						    <option value="07">07</option>
						    <option value="08">08</option>
						    <option value="09">09</option>
						    <option value="10">10</option>
						    <option value="11">11</option>
						    <option value="12">12</option>
						    <option value="13">13</option>
						    <option value="14">14</option>
						    <option value="15">15</option>
						    <option value="16">16</option>
						    <option value="17">17</option>
						    <option value="18">18</option>
						    <option value="19">19</option>
						    <option value="20">20</option>
						    <option value="21">21</option>
						    <option value="22">22</option>
						    <option value="23">23</option>
						    <option value="24">24</option>
						    <option value="25">25</option>
						    <option value="26">26</option>
						    <option value="27">27</option>
						    <option value="28">28</option>
						    <option value="29">29</option>
						    <option value="30">30</option>
						    <option value="31">31</option>
            			</cfselect>
						<cfselect name="month">
							<option value="01">January</option>
						    <option value="02">February</option>
						    <option value="03">March</option>
						    <option value="04">April</option>
						    <option value="05">May</option>
						    <option value="06">June</option>
						    <option value="07">July</option>
						    <option value="08">August</option>
						    <option value="09">September</option>
						    <option value="10">October</option>
						    <option value="11">November</option>
						    <option value="12">December</option>
            			</cfselect>
						<cfselect name="year">
							<option value="2006">2006</option>
						    <option value="2005">2005</option>
						    <option value="2004">2004</option>
						    <option value="2003">2003</option>
						    <option value="2002">2002</option>
						    <option value="2001">2001</option>
						    <option value="2000">2000</option>
						    <option value="1999">1999</option>
						    <option value="1998">1998</option>
						    <option value="1997">1997</option>
						    <option value="1996">1996</option>
						    <option value="1995">1995</option>
						    <option value="1994">1994</option>
						    <option value="1993">1993</option>
						    <option value="1992">1992</option>
						    <option value="1991">1991</option>
						    <option value="1990">1990</option>
						    <option value="1989">1989</option>
						    <option value="1988">1988</option>
						    <option value="1987">1987</option>
						    <option value="1986">1986</option>
						    <option value="1985">1985</option>
						    <option value="1984">1984</option>
						    <option value="1983">1983</option>
						    <option value="1982">1982</option>
						    <option value="1981">1981</option>
						    <option value="1980">1980</option>
						    <option value="1979">1979</option>
						    <option value="1978">1978</option>
						    <option value="1977">1977</option>
						    <option value="1976">1976</option>
						    <option value="1975">1975</option>
						    <option value="1974">1974</option>
						    <option value="1973">1973</option>
						    <option value="1972">1972</option>
						    <option value="1971">1971</option>
						    <option value="1970">1970</option>
						    <option value="1969">1969</option>
						    <option value="1968">1968</option>
						    <option value="1967">1967</option>
						    <option value="1966">1966</option>
						    <option value="1965">1965</option>
						    <option value="1964">1964</option>
						    <option value="1963">1963</option>
						    <option value="1962">1962</option>
						    <option value="1961">1961</option>
						    <option value="1960">1960</option>
						    <option value="1959">1959</option>
						    <option value="1958">1958</option>
						    <option value="1957">1957</option>
						    <option value="1956">1956</option>
						    <option value="1955">1955</option>
						    <option value="1954">1954</option>
						    <option value="1953">1953</option>
						    <option value="1952">1952</option>
						    <option value="1951">1951</option>
						    <option value="1950">1950</option>
						    <option value="1949">1949</option>
						    <option value="1948">1948</option>
						    <option value="1947">1947</option>
						    <option value="1946">1946</option>
						    <option value="1945">1945</option>
						    <option value="1944">1944</option>
						    <option value="1943">1943</option>
						    <option value="1942">1942</option>
						    <option value="1941">1941</option>
						    <option value="1940">1940</option>
            			</cfselect>
						</div>
			</td>
		</tr>
	</table>
	<div style="height:70px"></div>
	<div id="termsAndConditionText"><cfinput type="checkbox" name="termsCondition"> &nbsp;&nbsp;&nbsp;I have read and agree to the Terms and Conditions.</div>
	<div style="height:20px"></div>
	<div style="text-align:center;"><cfinput type="submit" name="submit" value="Register"></div>
</cfform>
</div>
<script type="text/javascript">
	new CFTunes.userNameField('userNameTextBox');
	new CFTunes.passwordFields('password','repeatPassword');
</script>
