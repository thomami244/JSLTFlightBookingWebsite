
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

	<!--	name: <%= request.getParameter("fname") %> <br>  -->
<c:set var="sessionFull_name" value="${param.fname }" scope="session"/>
<!--address: <%= request.getParameter("faddress") %> <br>  -->
<c:set var="sessionAddress" value="${param.faddress } " scope="session"/>

<!--age: <%= request.getParameter("fage") %> <br> -->
<c:set var="sessionAge" value="${param.fage }" scope="session"/>
<!-- mobile: <%= request.getParameter("fmobile_phone") %> <br> -->
<c:set var="sessionMobile" value="${param.fmobile_phone } " scope="session"/>

<!-- email: <%= request.getParameter("femail_username") %> <br> -->
<c:set var="sessionEmail_username" value="${param.femail_username }" scope="session"/>
<!--id_number: <%= request.getParameter("fid_number") %> <br> -->
<c:set var="sessionId_number" value="${param.fid_number } " scope="session"/>

<!-- country: <%= request.getParameter("fcountry") %> <br> -->
<c:set var="sessionCountry" value="${param.fcountry } " scope="session"/> 

<!-- sql:setDataSource tag -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_world"  
     user="root"  password="root"/>  
     
     
     
     <sql:query dataSource="${db}" var="rs">  
	SELECT * from flights1;  
</sql:query>

		<c:forEach var="table" items="${rs.rows}">

				<c:if test="${sessionScope.sessionFlightNumber eq table.flight_no}">
					
							 <h3>Please confirm and pay: $ <c:out value="${table.price}" />  </h3>
								<c:set var="sessionPrice" value="${table.price}" scope="session" />
				
</c:if>

		</c:forEach>






<sql:query dataSource="${db}" var="rs">  
	SELECT * from flights1;  
</sql:query>  



<form action="confirmation.jsp">
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

<p> Price: <c:out value="${sessionScope.sessionPrice}"/> </p>
<h1><input type="submit" value="Pay $<c:out value="${sessionScope.sessionPrice}"/>"> </h1>

 </fieldset>
</form>  

	 

			
		
<%--
		
		 <c:set var="sessionUsername" value="${param.username}" scope="session" />
		 --%>
<%--		
		  <c:redirect url="searchflights.jsp"> </c:redirect>
		 </c:if>
		</c:if>
		 
--%>




<%--
date: <%= request.getParameter("date") %> <br>
source: <%= request.getParameter("source") %><br> 
destination: <%= request.getParameter("destination") %><br> 
source: <%= request.getParameter("number") %><br> 
--%>
<%--
<br>
 <p> You are logged in as <c:out value="${sessionScope.sessionUsername}"/> </p>
 <br>

--%>
</body>
</html>