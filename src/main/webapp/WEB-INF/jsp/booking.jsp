<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Booking</title>
<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="ressources/jquery.min.js"></script>
<script type="text/javascript" src="/ressources/moment.min.js"></script>
<script type="text/javascript" src="/ressources/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/ressources/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="/ressources/bootstrap.min.css" />
<link rel="stylesheet"
	href="/ressources/bootstrap-datetimepicker.min.css" />
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
		<form action="deleteBook">
				<input name="id" value="${booking.id}" type="hidden" /> <input
					type="submit" value="Delete" />
			</form>
			<form method="get" action="modifyBookingForm">

				<input name="id" value="${booking.id}" type="hidden" /> <input
					type="submit" value="Modifier" />

			</form>
		</c:forEach>

		<form method="get" action="book">
			<p>Reservez</p>
			<div>

				Salles : <select name="roomId">
					<option value=""></option>
					<c:forEach items="${roomList}" var="room">
						<option value="${room.id}">${room.name}</option>
					</c:forEach>
				</select> Id Ordinateur : <select name="computerId">
					<option value=""></option>
					<c:forEach items="${computerList}" var="computer">
						<option value="${computer.id}">${computer.id}&nbsp;${computer.brand}</option>
					</c:forEach>
				</select> debut :
				
			<input type="datetime-local" name="starts">
			fin :
			
			<input type="datetime-local" name="ends">
			Utilisateur : <select name="userId">
				<option value=""></option>
				<c:forEach items="${userList}" var="user">
					<option value="${user.id}">${user.name}&nbsp;${user.surname}</option>
				</c:forEach>
			</select> <input type="submit" value="Confirmer">
		</form>

		<c:if test="${erreur != null}">
			<div style="color: red;">
				<c:out value="${erreur}" />
			</div>
		</c:if>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</div>
</body>
</html>