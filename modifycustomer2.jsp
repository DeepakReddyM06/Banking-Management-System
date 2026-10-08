<html>
<body bgcolor="lightblue">
<%@page import="java.sql.*"%>
<%
try{
	String r1=request.getParameter("m1");
	String r2=request.getParameter("m2");
	String r3=request.getParameter("m3");
	String r4=request.getParameter("m4");
	String r5=request.getParameter("m5");
	String r8=request.getParameter("m8");
	String r9=request.getParameter("m9");
	String r10=request.getParameter("m10");
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("update customers set custname=? ,phno=? ,email=? ,dob=? ,pwd=?,staff=?,status=? where custid=?");
	
	pst.setString(1,r2);
	pst.setString(2,r3);
	pst.setString(3,r4);
	pst.setString(4,r5);
	pst.setString(5,r9);
	pst.setString(6,r8);
	pst.setString(7,r10);
	pst.setString(8,r1);

	int x=pst.executeUpdate();
	
	out.println("<center><h1>Modified Successfully");
	pst.close();
	con.close();
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
