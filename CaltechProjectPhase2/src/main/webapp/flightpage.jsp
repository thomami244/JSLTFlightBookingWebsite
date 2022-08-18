
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

	<c:set var="sessionDate" value="${param.date}" scope="session" />
	<c:set var="sessionSource" value="${param.source}" scope="session" />
	<c:set var="sessionDestination" value="${param.destination}" scope="session" />
	<c:set var="sessionNumberPassengers" value="${param.number}" scope="session" />
	<h3>Searching for flights:</h3>
	<p>
		Date
		<c:out value="${sessionScope.sessionDate}" />
	</p>
	<p>
		Source
		<c:out value="${sessionScope.sessionSource}" />
	</p>
	<p>
		Destination
		<c:out value="${sessionScope.sessionDestination}" />
	</p>
	<p>
		Number of passengers
		<c:out value="${sessionScope.sessionNumberPassengers}" />
	</p>
	<c:set var="count" value="0" scope="page" />
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from flights1;  
</sql:query>

	<table border="2" width="100%">
		<tr>

			<th>Choose</th>
			<th>Airline</th>
			<th>Price($)</th>
			<th>Flight No</th>
			<th>Source City</th>
			<th>Destination City</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Total Seats</th>
			<th>Booked Seats</th>
			<th>Seats Availible</th>
			<th>Travel_date</th>
			<th>Class</th>

		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>

				<%--<c:out value="${table.airline[2].id}"/>
		<c:out value="${table.airline[3].id}"/>
		<c:out value="${table.class[0]}"/>>--%>

				<c:if test="${sessionScope.sessionDate eq table.travel_date}">
					<c:if test="${sessionScope.sessionSource eq table.source_city}">
						<c:if
							test="${sessionScope.sessionDestination eq table.destination_city}">
							<c:if
								test="${sessionScope.sessionNumberPassengers <= table.seats_availible}">


								
								<c:if test="${count!= 0}">
									<td>
										<form method="POST" action="registerdetails.jsp">
											<input value="${table.flight_no}" name="flight2"
												type="submit" />
										</form> </td>
								

								<%--<td a href="registerdetails.jsp"><input type="checkbox" name="name1" />&nbsp;</td>
		   <td><button type="button" onclick="registerdetails.jsp">Choose Me!</button></td>--%>

								<%--<td>
									<form method="POST" action="registerdetails.jsp">
										<input value="${table.flight_no}" name="flight1"
											type="submit" />
									</form>
								</td>--%>

								<%--<form action="registerdetails.jsp" method="post">

									<button>
										<input type="submit" value="${table.flight_no}"
											name="table.flight_no">
									</button>
									<input type="reset" />
								</form>--%>

								<td><c:out value="${table.airline}" /></td>
								<td><c:out value="${table.price}" /></td>
								<td><c:out value="${table.flight_no}" /></td>
								<td><c:out value="${table.source_city}" /></td>
								<td><c:out value="${table.destination_city}" /></td>
								<td><c:out value="${table.departure_time}" /></td>
								<td><c:out value="${table.arrival_time}" /></td>
								<td><c:out value="${table.total_seats}" /></td>
								<td><c:out value="${table.booked_seats}" /></td>
								<td><c:out value="${table.seats_availible}" /></td>
								<td><c:out value="${table.travel_date}" /></td>
								<td><c:out value="${table.travel_class}" /></td>
</c:if>
<c:if test="${count == 0}">
									<td>
										<form method="POST" action="registerdetails.jsp">
											<input value="${table.flight_no}" name="flight1"
												type="submit" />
										</form> </td>
										<c:set var="count" value="${count + 1}" scope="page" />
									<td><c:out value="${table.airline}" /></td>
								<td><c:out value="${table.price}" /></td>
								<td><c:out value="${table.flight_no}" /></td>
								<td><c:out value="${table.source_city}" /></td>
								<td><c:out value="${table.destination_city}" /></td>
								<td><c:out value="${table.departure_time}" /></td>
								<td><c:out value="${table.arrival_time}" /></td>
								<td><c:out value="${table.total_seats}" /></td>
								<td><c:out value="${table.booked_seats}" /></td>
								<td><c:out value="${table.seats_availible}" /></td>
								<td><c:out value="${table.travel_date}" /></td>
								<td><c:out value="${table.travel_class}" /></td>
									
																	
								</c:if>
							</c:if>
						</c:if>
					</c:if>
				</c:if>
			</tr>
		</c:forEach>
	</table>





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
<c:set var="flight1" value="${request.getParameter('flight1') }" scope="session"/>
<c:set var="flight2" value="${request.getParameter('flight2') } " scope="session"/>

</body>
</html>