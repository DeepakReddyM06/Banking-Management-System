<html>
<body bgcolor="white">

<%@ page import="java.sql.*" %>

<%
	String s1=request.getParameter("t1");

try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         Connection
con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	PreparedStatement pst = con.prepareStatement("update staff set status='Deactive' where staffid=?");

	pst.setString(1,s1);

	int x=pst.executeUpdate();

	out.println("<center><h1><br><br>Removed Successfully");
	pst.close();
	con.close();
}
catch(Exception e){
	out.println(e);
}
%>

</body>
</html>