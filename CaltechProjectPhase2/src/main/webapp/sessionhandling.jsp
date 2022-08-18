
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
	<h3>Admin login:</h3>
	<form action="sessionhandling.jsp" method="post">
		UserName: <input type="text" name="adminUsername" required /><br>
		Password: <input type="password" name="adminPassword" required /><br>
	
			<input type="submit" value="Submit">
		
		<input type="reset" />
	</form>


	<!-- sql:query  tag -->
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from User_Login;  
</sql:query>

	<c:if test="${param.adminUsername != null}">
		<c:forEach var="table" items="${rs.rows}">
			<%--<c:out value="${'password is not null'}"/> --%>
			<c:if test="${param.adminUsername == 'admin@email.com'}">
				<%--<c:out value="${'username is not null'}"/> --%>
				<c:if test="${table.username  == 'admin@email.com'}">

					<c:if test="${param.adminPassword eq table.password}">
						<c:set var="sessionAdminUsername" value="${param.adminUsername}"
							scope="session" />

						<c:redirect url="admindashboard.jsp">
						</c:redirect>
					</c:if>
				</c:if>
			</c:if>


		</c:forEach>

		<p>Incorrect username or password. Please try again</p>

	</c:if>

	
</body>
</html>

<%--
		username:
	<%=request.getParameter("adminUsername")%>
	<br> password:
	<%=request.getParameter("adminPassword")%><br>
			<c:out value="${table.username}"/> 
			
			<c:out value="${table.password}"/> <br>
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