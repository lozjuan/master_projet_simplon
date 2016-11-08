<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Computer</title>
<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<c:forEach items="${computerList}" var="computer">
		   	${computer.id}
		   	${computer.brand}
		   	${computer.model}
		   	${computer.serial}
		   	<form action="deleteComputer">
				<input name="id" value="${computer.id}" type="hidden" /> <input
					type="submit" value="Delete" />
			</form>
			<form action="modifyComputer">
				<input name="id" value="${computer.id}" type="hidden" /> <input
					type="submit" value="Modify" />
			</form>
			
		</c:forEach>
	
		<form method="get" action="addComputer">
			<p>Inserer un ordinateur</p>
			<div>
				brand :<input type="text" name="brand"> 
				model :<input type="text" name="model"> 
				serial:<input type="number" name="serial"> 
				   	   <input type="submit" value="Confirmer">
			</div>
		</form>
	
		<form method="get" action="computerById">
			<p>Recherche ordinateur : inserer l'id</p>
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