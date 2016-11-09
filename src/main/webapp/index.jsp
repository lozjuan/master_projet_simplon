<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta name="viewport" content="width = device-with, initial scale = 1">
<meta charset="UTF-8">
<title>Home page</title>
<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>SIMPLON.CO</h1>
			
		<security:authorize access="isAuthenticated()">
       		<security:authentication property="principal.name"/>
   		</security:authorize>
   		
			
		</div>
		<div class="jumbotron">
			<p>Reservation des salles et des ordinateurs</p>
			<a href="/booking" class="btn btn-lg btn-success" role="button">Reservez</a>
			<a href="/user" class="btn btn-lg btn-info" role="button">Gestion des utilisateurs</a>
			<a href="/room" class="btn btn-lg btn-info" role="button">Gestion des salles</a>
			<a href="/computer" class="btn btn-lg btn-info" role="button">Gestion des ordinateurs</a>
			<a href="/login" class="btn btn-lg btn-success" role="button">Sign in</a>	
			<a href="/logout" class="btn btn-lg btn-danger" role="button">Sign out</a>	
					
		</div>
	</div>	

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
</body>
</html>