<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Ordianteur</title>
    </head>
    <body>
    	<p>tous les ordinateurs</p>
        
     <c:forEach items="${computerList}" var="computer">
	   	${computer.id}
	   	${computer.brand}
	   	${computer.model}
	   	${computer.serial}
	   	<form action="deleteComputer">
        	 <input name="id" value="${computer.id}" type="hidden" />
        	 <input type="submit" value="Delete" />
       	</form>
	   	</br>
	</c:forEach>
	
	<form method="get" action="addComputer">
			<p>Inserer un ordinateur</p>
		<div>
			brand :<input type="text" name="brand">
			model :<input type="text" name="model">
			serial:<input type="number" name="serial"></br>
			<p><input type="submit" value="Confirmer"></p></br>
		</div>
	</form>
	
	<form method="get" action="computerById">
		<p>Recherche ordinateur : inserer l'id</p>
		<div>
			id:<input type="number" name="id">
			<p><input type="submit" value="Rechercher"></br>
		</div>
	</form>
	
    </body>
</html>