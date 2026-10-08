<html>
<body bgcolor="white" ><br>
<%@page import="java.sql.*"%>
<center><h1>Balance<br><br>
<%
	String s1=(String)session.getAttribute("uid");
	String s2=null;
	String s10=null;
	Integer s12=0;


	try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select * from customers where custid=?");
	pst.setString(1,s1);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		s2=rs.getString(2);
		s10=rs.getString(10);
		s12=rs.getInt(12);
	}
	}
	catch(Exception e){
		out.println(e);
	}
%>
<table border="1" height="50%"  width="30%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">

<tr>
	<th>Id</th>
	<td><center><%=s1%></td>
</tr>
<tr>
	<th>Name</th>
	<td><center><%=s2%></td>
</tr>
<tr>
	<th>Status</th>
	<td><center><%=s10%></td>
</tr>
<tr>
	<th>Balance</th>
	<td><center><%=s12%></td>
</tr>
</table>
</body>
</html>