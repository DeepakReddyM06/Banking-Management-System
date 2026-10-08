<html>
<body bgcolor="lightblue">
<%@page import="java.sql.*"%>
<%
try{
	String s1=(String)session.getAttribute("uid");
	Integer s6=Integer.parseInt(request.getParameter("w3"));
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  	
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst=con.prepareStatement("update customers set balance=balance-? where custid=?");
	PreparedStatement pst1=con.prepareStatement("update customers set status='Debited' where custid=?");

	pst.setInt(1,s6);
	pst.setString(2,s1);

	pst1.setString(1,s1);


	int x=pst.executeUpdate();
	int y=pst1.executeUpdate();

	
	out.println("<center><h1>Approved");
	pst.close();
	pst1.close();
	con.close();
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>




