<html>
<body bgcolor="dark blue" text="white">
<center><h1>BANKING MANAGEMENT SYSTEM
<%
	String id=(String)session.getAttribute("id");
	String name=(String)session.getAttribute("name");
%>
<br>
<h2>
WELCOME <%=name%><br><br>
ID - <%=id%>
</body>
</html>