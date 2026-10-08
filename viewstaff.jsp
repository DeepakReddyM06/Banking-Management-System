<html>
<body bgcolor="white" ><br>
<%@page import="java.sql.*"%>
<center><h1> Staff Details<br><br>
<table border="10" width="90%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">
<tr>
	<th>Staff Id</th>
	<th>Staff Name</th>
	<th>Gender</th>
	<th>Contact</th>
	<th>Email</th>
	<th>Joining Date</th>
	<th>Status</th>
</tr>
<%
	try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select * from staff");
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		out.println("<tr>");
		out.println("<th>"+rs.getString(1)+"</th>");
		out.println("<th>"+rs.getString(2)+"</th>");
		out.println("<th>"+rs.getString(6)+"</th>");
		out.println("<th>"+rs.getString(3)+"</th>");
		out.println("<th>"+rs.getString(4)+"</th>");
		out.println("<th>"+rs.getString(7)+"</th>");
		out.println("<th>"+rs.getString(10)+"</th>");
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