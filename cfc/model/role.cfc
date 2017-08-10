component  output="false" persistent="true" 
{
	property name="roleId" type="numeric" fieldtype="id" generator="native";
	property name="roleName" type="string";
	property name="roleDescription" type="string" ;
	property name="users" fieldtype="many-to-many" linktable="user_role" cfc="user" fkcolumn="roleId" inversejoincolumn="userId" lazy="true" ;
}