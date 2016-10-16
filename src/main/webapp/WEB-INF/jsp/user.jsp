<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>utilisateurs</title>
</head>

<body>
	<c:forEach items="${userList}" var="user">
		   	${user.id}
		   	${user.name}
		   	${user.surname}
		   	${user.email}
		   	${user.userRights}
		   	<form action="deleteUser">
			<input name="id" value="${user.id}" type="hidden" /> 
			<input type="submit" value="Delete" />
		</form>
		</br>
	</c:forEach>

	<form method="get" action="addUser">
		<p>Inserer un utilisateur</p>	
		<div>
			nom :<input type="text" name="name"> 
			prenom :<input type="text" name="surname"> 
			email:<input type="text"name="email">
			droits:<input type="text"name="userRights"> 
			<input type="submit" value="Confirmer"> </br>
		</div>
	</form>

	<form method="get" action="userById">
		<p>Recherche d'utilisateur</p>
		<div>
			id:<input type="number" name="id"> <input type="submit"
				value="Rechercher"></br>
		</div>
	</form>
</body>
</html>