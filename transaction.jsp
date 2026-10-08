<html>
<body bgcolor="white" ><br>
<%@page import="java.sql.*"%>
<center><h1>Transaction History<br><br>
<table border="10" width="90%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">
<tr>
	<th>Name</th>
	<th>ID</th>
	<th>Date</th>
	<th>Amount</th>
	<th>Status</th>

</tr>
<%	
	String s1=(String)session.getAttribute("uid");
	try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select * from transactions where sender_id=?");
	pst.setString(1,s1);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){
		out.println("<tr>");
		out.println("<th>"+rs.getString(4)+"</th>");
		out.println("<th>"+rs.getString(2)+"</th>");
		out.println("<th>"+rs.getString(5)+"</th>");
		out.println("<th>"+rs.getString(6)+"</th>");
		out.println("<th>"+rs.getString(7)+"</th>");
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