<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${bookingList}" var="booking">
	   	${booking.id}
	   	${booking.roomName}
	   	${booking.computerId}
	   	${booking.starts}
	   	${booking.ends}
	   	${booking.userId}
	</c:forEach>
	
	<form method="get" action="book">
		<p>Reservez</p>
		<div>
			Salle :         		<input type="text" name="roomName">
			Id Ordinateur : 		<input type="text" name="computerId"> 
			debut :         		<input type="datetime-local" name="starts">
			fin :           		<input type="datetime-local" name="ends">
			votre Id :      		<input type="number" name="userId">	
									<input type="submit" value="Confirmer">
		</div>
	</form>

</body>
</html>