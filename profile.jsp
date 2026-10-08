<html>
<body bgcolor="white" ><br>
<%@page import="java.sql.*"%>
<center><h1> Profile <br><br>
<%
	String s1=(String)session.getAttribute("uid");
	String s2=null;
	String s3=null;
	String s4=null;
	String s5=null;
	String s8=null;
	String s9=null;
	String s10=null;

	try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select * from customers where custid=?");
	pst.setString(1,s1);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s8=rs.getString(8);
		s9=rs.getString(9);
		s10=rs.getString(10);
	}
	}
	catch(Exception e){
		out.println(e);
	}
%>
<table border="1" height="70%"  width="30%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">
<tr>
	<th>Id</th>
	<td><center><%=s1%></td>
</tr>
<tr>
	<th>Name</th>
	<td><center><%=s2%></td>
</tr>
<tr>
	<th>Contact</th>
	<td><center><%=s3%></td>
</tr>
<tr>
	<th>Email</th>
	<td><center><%=s4%></td>
</tr>
<tr>
	<th>Date Of Birth</th>
	<td><center><%=s5%></td>
</tr>
<tr>
	<th>Password</th>
	<td><center><%=s9%></td>
</tr>
<tr>
	<th>Created By</th>
	<td><center><%=s8%></td>
</tr>
<tr>
	<th>Status</th>
	<td><center><%=s10%></td>
</tr>

</table>
</body>
</html>