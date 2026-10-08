<html>
<body bgcolor="lightblue">
<%@page import="java.sql.*"%>
<%
try{
	String s1=request.getParameter("t1");
	String s2=request.getParameter("t2");
	String s3=request.getParameter("t3");
	String s4=request.getParameter("t4");
	String s5=request.getParameter("t5");
	String s6=request.getParameter("t6");
	String s7=request.getParameter("t7");
	String s8=(String)session.getAttribute("name");
	String s9=request.getParameter("t9");
	String s11=request.getParameter("t11");

	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("insert into customers values(?,?,?,?,?,?,?,?,?,?,?,?)");
	
	pst.setString(1,s1);
	pst.setString(2,s2);
	pst.setString(3,s3);
	pst.setString(4,s4);
	pst.setString(5,s5);
	pst.setString(6,s6);
	pst.setString(7,s7);
	pst.setString(8,s8);
	pst.setString(9,s9);
	pst.setString(10,"Active");
	pst.setString(11,s11);
	pst.setString(12,"0");



	int x=pst.executeUpdate();
	
	out.println("<center><h1>Registration Successful");
	pst.close();
	con.close();
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
