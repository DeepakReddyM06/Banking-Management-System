<html>
<body bgcolor="lightblue">
<br><br>
<form action="addcustomer1.jsp">
<center><h2> CUSTOMER REGISTRATION
<%@page import="java.sql.*"%>
<%
	String name=(String)session.getAttribute("name");
	int n=0;
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("select max(custid) from customers");
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		n=Integer.parseInt(rs.getString(1))+1;
	}
	}
	catch(Exception e){
		n=1001;
	}
%>
<br><br>
<table border="1" height="75%"  width="37%" bgcolor="lightblue" style="border-radius:10px;border:3px solid black;">

<tr>
	<th>Customer Id</th>
	<td><center><input type="text" name="t1" value=<%=n%> readonly></td>
</tr>
<tr>
	<th>Name</th>
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
<tr>
	<th>Created By</th>
	<td><center><input type="text" name="t8" value=<%=name%> readonly></td>
</tr>
<tr>
	<th>Password</th>
	<td><center><input type="password" name="t9"></td>
</tr>
<tr>
	<th>Gender</th>
	<td><center><input type="radio" name="t11" value="Current">Current Account
	<input type="radio" name="t11" value="Savings">Savings Account
	<input type="radio" name="t11" value="Zero">Zero Account
	</td>
</tr>
<tr></tr>
<tr rowspan="2">
	<td colspan="2" align="center" ><input type="submit" value="REGISTER"></td>
</tr>
</table>
</form>
</body>
</html>