
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
	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<br>
	<h3>Please login:</h3>
	<form action="login.jsp" method="post">
		UserName: <input type="text" name="username" required /><br>
		Password: <input type="password" name="password" required /><br>
		<input type="submit" value="Submit"> <input type="reset" />
	</form>



	<!-- sql:query  tag -->
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from User_Login;  
</sql:query>

	<c:forEach var="table" items="${rs.rows}">

		<%--
		<c:out value="${table.username}"/> 
			
			<c:out value="${table.password}"/> <br>--%>

	</c:forEach>
	<c:if test="${param.username != null}">
		<%--<c:out value="${'username is not null'}"/> --%>

		<c:forEach var="table" items="${rs.rows}">
			<%--<c:out value="${'password is not null'}"/> --%>

			<c:if test="${param.username eq table.username}">
				<c:if test="${param.password eq table.password}">
					<c:set var="sessionUsername" value="${param.username}"
						scope="session" />
						<c:redirect url="searchflights.jsp"></c:redirect>				
				</c:if>
			</c:if>


		</c:forEach>

		<p>Incorrect username or password. Please try again</p>
	</c:if>

	<h3>Admin login:</h3>
	<form action="sessionhandling.jsp" method="post">
		<input type="submit" value="Admin Login">
	</form>
</body>
</html>

<!-- sql:query  tag -->

<%--
username: <%= request.getParameter("username") %> <br>
password: <%= request.getParameter("password") %><br> 
<c:forEach var="user" items="${User_Login.rows}" >
<c:if test="${username eq user.username}">
<c:choose>
    <c:when test="${param.enter=='1'}">
        pizza. 
        <br />
    </c:when>    
    <c:otherwise>
        pizzas. 
        <br />
    </c:otherwise>
</c:choose>


<c:forEach var="user" items="${User_Login.rows}" >
<c:if test="${username eq user.username}">

</c:if>
</c:forEach>

<script>
console.log(username);
console.log(password);


</script>
--%>

