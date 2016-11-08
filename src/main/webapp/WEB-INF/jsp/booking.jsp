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
  <script type="text/javascript" src="/ressources/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="/ressources/bootstrap.min.css" />
  <link rel="stylesheet" href="/ressources/bootstrap-datetimepicker.min.css" />
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
				</select> debut : <div class="form-group"><div class="input-group date" id="book-start"></div><input
					pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-2][0-9]:(00|15|30|45)"
					title="La date de début, au format YYYY-MM-DDThh:mm, au quart d'heure près"
					type='datetime' name="starts" class="form-control" id="book-start-input"
					placeholder="Date de début" /> <span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
				</span></div></div>
				<!--input type="datetime-local" name="starts"-->
				fin : 
				<div class="form-group">
					<div class="input-group date" id="book-end">
					<input
					pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-2][0-9]:(00|15|30|45)"
					title="La date de fin, au format YYYY-MM-DDThh:mm, au quart d'heure près"
					type='datetime' name="ends" class="form-control" id="book-end-input"
					placeholder="Date de fin" /> <span class="input-group-addon">
					<span class="glyphicon glyphicon-calendar"></span>
				</span></div></div>
				<script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>
				<!-- input
					type="datetime-local" name="ends"-->
				Utilisateur : <select name="userId">
					<option value=""></option>
					<c:forEach items="${userList}" var="user">
						<option value="${user.id}">${user.name}&nbsp;${user.surname}</option>
					</c:forEach>
				</select> <input type="submit" value="Confirmer">
			</div>
		</form>

		<c:if test="${erreur != null}">
			<div style="color: red;">
				<c:out value="${erreur}" />
			</div>
		</c:if>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>