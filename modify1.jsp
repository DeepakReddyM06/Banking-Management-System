<html>
<body bgcolor="white" ><br>
<form action="modify2.jsp">
<%@page import="java.sql.*"%>
<center><h1> Staff Details<br><br>
<%
	String s1=request.getParameter("t1");
	String s2=null;
	String s3=null;
	String s4=null;
	String s5=null;
	String s9=null;
	String s10=null;
	try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select * from staff where staffid=?");
	pst.setString(1,s1);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s9=rs.getString(9);
		s10=rs.getString(10);
	}
	}
	catch(Exception e){
		out.println(e);
	}
%>
<table border="1" height="60%"  width="30%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">

<tr>
	<th>Staff Id</th>
	<td><center><input type="text" name="m1" value=<%=s1%> readonly></td>
</tr>
<tr>
	<th>Staff Name</th>
	<td><center><input type="text" name="m2" value=<%=s2%>></td>
</tr>
<tr>
	<th>Contact</th>
	<td><center><input type="number" name="m3" value=<%=s3%>></td>
</tr>
<tr>
	<th>Email</th>
	<td><center><input type="email" name="m4" value=<%=s4%>></td>
</tr>
<tr>
	<th>Date Of Birth</th>
	<td><center><input type="date" name="m5" value=<%=s5%>></td>
</tr>
<tr>
	<th>Password</th>
	<td><center><input type="password" name="m9" value=<%=s9%>></td>
</tr>
<tr>
	<th>Status</th>
	<td><center><input type="text" name="m10" value=<%=s10%>></td>
</tr>
<tr>
	<td colspan="2" align="center" ><input type="submit" value="MODIFY"></td>
	</tr>
</table>
</body>
</html>