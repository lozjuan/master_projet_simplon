<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Salles</title>
</head>

<body>
	<c:forEach items="${roomList}" var="room">
		   	${room.id}
		   	${room.name}
		   	${room.places}
		   	${room.description}
		   	<form action="deleteRoom">
			<input name="id" value="${room.id}" type="hidden" /> <input
				type="submit" value="Delete" />
		</form>
		</br>
	</c:forEach>

	<form method="get" action="addRoom">
		<p>Inserer une salle</p>
		<div>
			name :<input type="text" name="name"> places :<input
				type="number" name="places"> description:<input type="text"
				name="description"></br> <input type="submit" value="Confirmer">

			</br>
		</div>
	</form>

	<form method="get" action="roomById">
		<p>Recherche de salles</p>
		<div>
			id:<input type="number" name="id"> <input type="submit"
				value="Rechercher"></br>
		</div>
	</form>
</body>
</html>