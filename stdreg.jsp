<html>
<head>
<center><h1>Student Data Form</h1> </center> 

<script type="text/javascript">
//Below function Executes on click of login button
function validate()
{
	if(document.forms[0].id.value=="")
	{
		alert("Enter Student Id...!");
		document.forms[0].a.focus();
		return false;
	}
	if(document.forms[0].name.value=="")
	{
		alert("Enter Student Name...!");
		document.forms[0].a.focus();
		return false;
	}
	if(document.forms[0].dob.value=="")
	{
		alert("Enter DOB...!");
		document.forms[0].a.focus();
		return false;
	}

}
</script>


<form method="post" action="stdreg.jsp" onSubmit="return validate()">	
<table align="center">
<tr><td>Student Number*:</td> <td><input type="text" name="id" /></td></tr>
<tr><td>Student Name*  : </td><td><input type="text" name="name" /></td></tr>
<tr><td>Date of Birth* : </td><td><input type="date" name="date"/></td></tr>
<tr>
<td></td>
<td><input type="submit" value="Submit"/></td></tr>
</table>	
</form>
</body>
</html>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%!
Connection con=null;
PreparedStatement pst=null;
int id=0;
String name=null;
String dob=null;
String a[];
String dd=null;
 %>
 <%
 try
 {
 id=Integer.parseInt(request.getParameter("id"));
 name=request.getParameter("name");
 dob=request.getParameter("date").trim();
 a=dob.split("-");
 dd=a[2]+"/"+a[1]+"/"+a[0].trim();
  Class.forName("oracle.jdbc.driver.OracleDriver");
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
  con.setAutoCommit(false);
  pst=con.prepareStatement("insert into stdreg values(?,?,to_date(?,'dd/MM/yyyy'))");
  pst.setInt(1,id);
  pst.setString(2,name);
  pst.setString(3,dd);
  pst.executeUpdate();
  con.commit();
  %>
  <html>
  <head>
  <script type="text/javascript">
  alert("Successfully Registered");
  </script>
  </head>
  <body></body>
  </html>
  <jsp:forward page="index.jsp"/>
  <%
 }
 catch(Exception e)
 {
 e.printStackTrace();
 %>
 <%=con %>
  <html>
  <head>
  <script type="text/javascript">
  alert("This User already Exist please try with anothe email...");
  </script>
  </head>
  <body></body>
  </html>
  <%
 try
 {
 con.rollback();
  con.close();
  pst.close();
 }
 catch(Exception e1)
 {
 e1.printStackTrace();
 }
 }
  %>
