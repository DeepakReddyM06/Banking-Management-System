<html>
<body bgcolor="dark blue" text="white">
<center><h1>WELCOME TO KOTAK MAHINDRA BANK
<%
	String uid=(String)session.getAttribute("uid");
	String uname=(String)session.getAttribute("uname");
%>
<br>
<h2>
<%=uname%><br><br>
ID - <%=uid%>
</body>
</html>