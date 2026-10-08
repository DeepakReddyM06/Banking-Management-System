<html>
<body bgcolor="lightblue">
<%@page import="java.sql.*"%>
<%
try{
	java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("dd-MM-yyyy");
	String s1=(String)session.getAttribute("uid");
	String s2=request.getParameter("d1");
	String s3=(String)session.getAttribute("uname");
	String s4=request.getParameter("d2");
	String s5=sd.format(new java.util.Date()).toString();
	Integer s6=Integer.parseInt(request.getParameter("d3"));
	String s7=null;


	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");

	PreparedStatement pst1=con.prepareStatement("select custid from customers where custid=?");
	pst1.setString(1,s2);

	ResultSet rs=pst1.executeQuery();
	if(rs.next())
	{
	
	PreparedStatement pst=con.prepareStatement("insert into transactions values(?,?,?,?,?,?,?)");
	pst.setString(1,s1);
	pst.setString(2,s2);
	pst.setString(3,s3);
	pst.setString(4,s4);
	pst.setString(5,s5);
	pst.setInt(6,s6);
	pst.setString(7,"Credited");  
	
	int x=pst.executeUpdate();
	PreparedStatement pst2=con.prepareStatement("update customers set balance=balance+? where custid=?");
	pst2.setInt(1,s6);
	pst2.setString(2,s2);
	int y=pst2.executeUpdate();
	
	out.println("<center><h1>Deposited Successful");
	pst.close();
	pst2.close();

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
