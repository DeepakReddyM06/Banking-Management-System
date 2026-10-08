<html>
<body bgcolor="lightblue" >
<center>
<%@page import="java.sql.*"%>
<%
Connection con=null;
PreparedStatement pst=null;
ResultSet rs=null;
try{
	String utype=request.getParameter("t1");
	String uname=request.getParameter("t2");
	String pwd=request.getParameter("t3");
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pt;encrypt=true;trustServerCertificate=true","deepakreddy","root");
	if(uname.length() != 0){
		if(pwd.length()!=0){
			if(utype.equals("Admin")){
				if(uname.equals("Admin") && pwd.equals("Admin")){
					response.sendRedirect("Admin.jsp");
					session.setAttribute("name","ADMINISTRATOR");
				}
			}
			else if(utype.equals("Staff")){
				pst=con.prepareStatement("select * from staff where staffid=? and pwd=? and status='Active'");
				pst.setString(1,uname);
				pst.setString(2,pwd);
				rs=pst.executeQuery();
				if(rs.next()){
					response.sendRedirect("Staff.jsp");
					session.setAttribute("id",rs.getString(1));
					session.setAttribute("name",rs.getString(2));
				}
				else{
					out.println("<center><h1>Invalid uname/password");
				}
			}
			else if(utype.equals("User")){
				pst=con.prepareStatement("select * from customers where custid=? and pwd=? and status='Active'");
				pst.setString(1,uname);
				pst.setString(2,pwd);
				rs=pst.executeQuery();
				if(rs.next()){
					response.sendRedirect("User.jsp");
					session.setAttribute("uid",rs.getString(1));
					session.setAttribute("uname",rs.getString(2));
				}
				else{
					out.println("<center><h1>Invalid uname/password");
				}
			}
			if(utype.equals("Employee")){
				
			}
		}
		else{
			out.println("<center><h1>password not Specified</h1></center>");
		}
	}
	else{
		out.println("<center><h1>Username not Specified</h1></center>");
	}
}
catch(Exception e){
	out.println(e);
}
%>
<br>
<center><h3><a href='login.html'>click here</a> to back
</body>
</html>