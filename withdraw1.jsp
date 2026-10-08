<html>
<body bgcolor="lightblue">
<form action="./approvals.jsp">
<%@page import="java.sql.*"%>
<%
try{
	java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("dd-MM-yyyy");
	String s1=(String)session.getAttribute("uid");
	String s2="self";
	String s3=(String)session.getAttribute("uname");
	String s4="self";
	String s5=sd.format(new java.util.Date()).toString();
	Integer s6=Integer.parseInt(request.getParameter("w3"));
	String s7=null;

	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");

	PreparedStatement pst1=con.prepareStatement("select balance from customers where custid=?");
	pst1.setString(1,s1);
	ResultSet rs=pst1.executeQuery();
	if(rs.next()){

	if(rs.getInt(1)>s6){
	PreparedStatement pst=con.prepareStatement("insert into transactions values(?,?,?,?,?,?,?)");
	pst.setString(1,s1);
	pst.setString(2,s2);
	pst.setString(3,s3);
	pst.setString(4,s4);
	pst.setString(5,s5);
	pst.setInt(6,s6);
	pst.setString(7,"Pending");  
	
	int x=pst.executeUpdate();
	
	out.println("<center><h1>Withdrawal Pending");
	out.println("<center><h5>Waiting for Response");

	pst.close();
	}
	else{
		out.println("<center><h1>Insufficient Funds");
	}
	}
	else
	{
		out.println("<center><h1>Invalid Details");
	}
	pst1.close();
	con.close();
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
