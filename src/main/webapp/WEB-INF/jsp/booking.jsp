<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Booking</title>
<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<c:forEach items="${bookingList}" var="booking">
	   	${booking.id}

	   	${booking.room.name}
	   	${booking.computer.model}
	   	${booking.starts}
	   	${booking.ends}
	   	${booking.user.name}

	</c:forEach>
	
	<form method="get" action="book">
		<p>Reservez</p>
		<div>

			Salles :        <select name="roomId">
								<option value=""></option>
								<c:forEach items="${roomList}" var="room">
									<option value="${room.id}">${room.name}</option>
								</c:forEach>
							</select>
			Id Ordinateur : <select name="computerId">
								<option value=""></option>
								<c:forEach items="${computerList}" var="computer">
									<option value="${computer.id}">${computer.id}&nbsp;${computer.brand}</option>
								</c:forEach>
							</select>		
			debut :         <input type="datetime-local" name="starts">
			fin :           <input type="datetime-local" name="ends">
			Utilisateur :   <select name="userId">
								<option value=""></option>
								<c:forEach items="${userList}" var="user">
									<option value="${user.id}">${user.name}&nbsp;${user.surname}</option>
								</c:forEach>
							</select>					
							<input type="submit" value="Confirmer">
		</div>
	</form>

	<c:if test="${erreur != null}">
        <div style="color: red;"><c:out value="${erreur}"/></div>
    </c:if>
</div>
<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>