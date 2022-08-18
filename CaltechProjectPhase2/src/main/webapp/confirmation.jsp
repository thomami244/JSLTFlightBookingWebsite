
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h1 {text-align: center;}
h3 {text-align: center;}
p {text-align: center;}
div {text-align: center;}
form {text-align: center;}
* {background-color: #C9DEF0;}
</style>
</head>
<body>


<!-- sql:setDataSource tag -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_world"  
     user="root"  password="root"/>  
     

<sql:update dataSource="${db}" var="count">  
INSERT INTO register_details (full_name,address,age,mobile_phone, email_username  ,id_number  , country  ) VALUES (?, ?, ?, ?,?,?,?)
<sql:param value="${sessionScope.sessionFull_name}" />
<sql:param value="${sessionScope.sessionAddress}" />
<sql:param value="${sessionScope.sessionAge}" />
<sql:param value="${sessionScope.sessionMobile}" />
<sql:param value="${sessionScope.sessionEmail_username}" />
<sql:param value="${sessionScope.sessionId_number}" />
<sql:param value="${sessionScope.sessionCountry}" /> 
</sql:update>



 <c:set var="count" value="0" scope="page" />

	<!-- sql:query  tag -->
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from booking_flights;  
</sql:query>



	<c:forEach var="table" items="${rs.rows}">
<c:set var="count" value="${count + 1}" scope="page"/>
		<%--
		<c:out value="${table.username}"/> 
			
			<c:out value="${table.password}"/> <br>--%>

	</c:forEach>
	<c:set var="count" value="${count + 1}" scope="page"/>

<sql:update dataSource="${db}" var="count">  
INSERT INTO booking_flights (emailusername,booking_id,flightno ) VALUES (?, ?, ?)
<sql:param value="${sessionScope.sessionUsername}" />
<sql:param value="${count}" />
<sql:param value="${sessionScope.sessionFlightNumber}" />

</sql:update>
  
     
    <h3>Confirmation: Here are your flight details: </h3>
    
    

 <fieldset>

<p> Date: <c:out value="${sessionScope.sessionDate}"/> </p>
<p> Source: <c:out value="${sessionScope.sessionSource}"/> </p>
<p> Destination: <c:out value="${sessionScope.sessionDestination}"/> </p>
<p> Number of passengers: <c:out value="${sessionScope.sessionNumberPassengers}"/> </p>
<p> Flight number: <c:out value="${sessionScope.sessionFlightNumber}"/> </p>
<p> Full name: <c:out value="${sessionScope.sessionFull_name}"/> </p>
<p> Address: <c:out value="${sessionScope.sessionAddress}"/> </p>
<p> Age: <c:out value="${sessionScope.sessionAge}"/> </p>
<p> Mobile: <c:out value="${sessionScope.sessionMobile}"/> </p>
<p> Email_username: <c:out value="${sessionScope.sessionEmail_username}"/> </p>
<p> ID number: <c:out value="${sessionScope.sessionId_number}"/> </p>
<p> Country: <c:out value="${sessionScope.sessionCountry}"/> </p>

<p> Paid: <c:out value="${sessionScope.sessionPrice}"/> </p>


 </fieldset>

</body>
</html>