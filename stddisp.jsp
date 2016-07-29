<%@ page import="java.sql.*"  %>
<%@ page import="java.lang.*"  %>
<%!
  Connection con=null;
  Statement st=null;
  ResultSet rs=null;
   %>
  <%
    try
    {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
    st=con.createStatement();
    rs=st.executeQuery("select * from stdreg");
    }
    catch(Exception e)
    {
    e.printStackTrace();
    }
    %>
    <center><table bgcolor="yellow" border="1"width="600">
        <tr>
        <th align="center">ID</th>
        <th align="center">NAME</th>
        <th align="center">DOB</th>
        </tr>
        <tr>
        <%
        try
        {
        while(rs.next())
        {
        %>
        <td align="center"><%=rs.getInt(1)%></td>
         <td align="center"><%=rs.getString(2)%></td>
        <td align="center"><%=rs.getDate(3)%></td>
        <%
        }
        rs.close();
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        %>
        </table>
        </center>