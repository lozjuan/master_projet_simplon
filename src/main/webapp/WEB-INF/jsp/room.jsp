<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Salles</title>
<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="container">
		<c:forEach items="${roomList}" var="room">
			   	${room.id}
			   	${room.name}
			   	${room.places}
			   	${room.description}
			   	<form action="deleteRoom">
				<input name="id" value="${room.id}" type="hidden" /> <input
					type="submit" value="Delete" />
			</form>
			<form method="get" action="modifyRoom">
				<div>
					<input name="id" value="${room.id}" type="hidden" /> <input
						type="submit" value="Modifier">
				</div>
			</form>
		</c:forEach>

		<form method="get" action="addRoom">
			<p>Inserer une salle</p>
			<div>
				name :<input type="text" name="name"> places :<input
					type="number" name="places"> description:<input type="text"
					name="description"><input type="submit" value="Confirmer">

			</div>
		</form>

		<form method="get" action="roomById">
			<p>Recherche de salles</p>
			<div>
				id:<input type="number" name="id"> <input type="submit"
					value="Rechercher">
			</div>
		</form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>