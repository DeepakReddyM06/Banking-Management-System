<html>
<body bgcolor="lightblue">
<br><br>
<form action="addstaff1.jsp">
<center><h2> STAFF REGISTRATION
<%@page import="java.sql.*"%>
<%
	int n=0;
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select max(staffid) from staff");
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		n=Integer.parseInt(rs.getString(1))+1;
	}
	}
	catch(Exception e){
		n=10001;
	}
%>
<br><br>
<table border="1" height="60%"  width="30%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">

<tr>
	<th>Staff Id</th>
	<td><center><input type="text" name="t1" value=<%=n%> readonly></td>
</tr>
<tr>
	<th>Staff Name</th>
	<td><center><input type="text" name="t2"></td>
</tr>
<tr>
	<th>Contact</th>
	<td><center><input type="number" name="t3"></td>
</tr>
<tr>
	<th>Email</th>
	<td><center><input type="email" name="t4"></td>
</tr>
<tr>
	<th>Date Of Birth</th>
	<td><center><input type="date" name="t5"></td>
</tr>
<tr>
	<th>Gender</th>
	<td><center><input type="radio" name="t6" value="Male">Male
	<input type="radio" name="t6" value="Female">Female
	<input type="radio" name="t6" value="Others">Others
	</td>
</tr>
<tr>
	<th>Joining Date</th>
	<%java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("dd-MM-yyyy");
	String str=sd.format(new java.util.Date()).toString();%>
	<td><center><input type="text" name="t7" value=<%=str%> readonly></td>
</tr>
	<th>Password</th>
	<td><center><input type="password" name="t9"></td>
<tr>
	<td colspan="2" align="center" ><input type="submit" value="REGISTER"></td>
	</tr>
<tr>
</tr>
</table>
</form>
</body>
</html>