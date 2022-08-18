
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
 
<%--flight1: <%= request.getParameter("flight1") %> <br>
flight2: <%= request.getParameter("flight2") %> <br> 
--%>

<c:set var="flight1" value="${request.getParameter('flight1') }" scope="session"/>

<c:set var="flight2" value="${request.getParameter('flight2') } " scope="session"/>

<c:set var="flight1" value= "${param.flight1}"/>
<c:set var="flight2" value= "${param.flight2}"/>


<c:if test="${empty flight1}">
<c:set var="sessionFlightNumber" value="${flight2}" scope="session" />
</c:if>
<c:if test="${empty flight2}">
<c:set var="sessionFlightNumber" value="${flight1}" scope="session" />
</c:if>
<%-- sessionFlight: <c:out value="${sessionFlightNumber}"/>  --%>

 <h3>Tell us a bit more about yourself: </h3>
<p> Date <c:out value="${sessionScope.sessionDate}"/> </p>
<p> Source <c:out value="${sessionScope.sessionSource}"/> </p>
<p> Destination <c:out value="${sessionScope.sessionDestination}"/> </p>
<p> Number of passengers <c:out value="${sessionScope.sessionNumberPassengers}"/> </p>
<p> Flight number <c:out value="${sessionFlightNumber}"/> </p>

<sql:query dataSource="${db}" var="rs">  
	SELECT * from flights1;  
</sql:query>  

	 <h3>Tell us a bit more about yourself: </h3>
<form action="reviewdetails.jsp" method="post">
Full Name: <input type="name" name="fname"  required/><br>
Address: <input type="address" name="faddress"  required/><br>
Age: <input type="age" name="fage"  required/><br>
Mobile: <input type="mobile" name="fmobile_phone"  required/><br>
Email id / UserName: <input type="text" name="femail_username"  required/><br>
Identity number: <input type="id" name="fid_number"  required/><br>
Country: <input type="country" name="fcountry"  required/><br>
<input type="submit" value="Submit">
<input type="reset"/> 
</form>

<c:set var="sessionFull_name" value="${param.fname}" scope="session" />
<c:set var="sessionAddress" value="${param.faddress}" scope="session" />
<c:set var="sessionAge" value="${param.fage}" scope="session" />



</body>
</html>