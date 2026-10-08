<html>
<body bgcolor="lightblue">
<br><br>
<%@ page import="java.sql.*" %>
<center><h2> APPROVALS

<br><br>
<table border="1" height="30%"  width="50%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">


<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Date</th>
	<th>Amount</th>
	<th>Approval</th>
</tr>
<%
	try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select * from transactions where status='Pending'");
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		out.println("<tr>");
		out.println("<th>"+rs.getString(1)+"</th>");
		out.println("<th>"+rs.getString(3)+"</th>");
		out.println("<th>"+rs.getString(5)+"</th>");
		out.println("<th>"+rs.getInt(6)+"</th>");
		out.println("<td>");
		out.println("<form action='approved.jsp' method='post'>");
		out.println("<input type='hidden' name='custid' value='" + rs.getString(1) + "'>");
		out.println("<input type='hidden' name='w3' value='" + rs.getInt(6) + "'>");
		out.println("<center><input type='submit' value='APPROVE'>");
		out.println("</form>");
		out.println("</td>");
		out.println("</tr>");

	}
	}
	catch(Exception e){
		out.println(e);
	}
%>
</table>
</body>
</html>


