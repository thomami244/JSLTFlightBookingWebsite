<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
}

h3 {
	text-align: center;
}

p {
	text-align: center;
}

div {
	text-align: center;
}

form {
	text-align: center;
}

* {
	background-color: #C9DEF0;
}
</style>
</head>
<body>
	<p>
		Welcome back
		<c:out value="${sessionScope.sessionAdminUsername}" />
	</p>

	<h3>Change Password</h3>
	<form action="admindashboard.jsp" method="post">
		Old Password: <input type="text" name="oldpass" required /><br>
		New Password: <input type="password" name="newpassword" required /><br>
		Confirm Password: <input type="password" name="confirmpassword"
			required /><br> <input type="submit" value="Submit"> <input
			type="reset" />
	</form>



	<c:if test="${param.newpassword != param.confirmpassword}">
		<p>Passwords do not match, please try again</p>
		<c:redirect url="admindashboard.jsp">
		</c:redirect>

	</c:if>

	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<!-- sql:query  tag -->
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from User_Login;  
</sql:query>

	<c:if test="${param.oldpass != null}">
		<c:forEach var="table" items="${rs.rows}">
			<%--<c:out value="${'password is not null'}"/> --%>
			<c:if test="${table.username  == 'admin@email.com'}">
				<c:if test="${param.oldpass eq table.password}">

					<c:if test="${param.newpassword == param.confirmpassword}">
						<c:set var="value" value="admin@email.com" />
						<sql:update dataSource="${db}" var="count">  
		DELETE FROM User_Login WHERE username = ?  
	 <sql:param value="${value}" />
						</sql:update>
						<sql:update dataSource="${db}" var="count">  
						 INSERT INTO User_Login VALUES (?, ?);
         <sql:param value="${ 'admin@email.com'}" />
							<sql:param value="${param.newpassword}" />
						</sql:update>



						<p>Password updated</p>
						
	<p>oldpass:
	<%= request.getParameter("oldpass") %> </p>
<p>	<br> newpassword:
	<%= request.getParameter("newpassword") %><br> </p>
	<p>confirmpassword:
	<%= request.getParameter("confirmpassword") %><br> </p>
	

					</c:if>
				</c:if>
			</c:if>


		</c:forEach>



	</c:if>



	<%--
check if store username: <c:out value="${param.username}"/> 
check if store password: <c:out value="${param.password}"/> 
username: <%= request.getParameter("username") %> <br>
 password: <%= request.getParameter("password") %><br> --%>


</body>
</html>