<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<head>
	<title>Modifier la reservation des ordinateurs</title>
</head>

<t:genericpage>
	<jsp:attribute name="header">
		<%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
	</jsp:attribute>
	<jsp:body>
		<div class="col-md-12">
			<br>
			<br>
			<br>
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title">
						<h4>Modifier les réservations des utilisateurs</h4>
					</div>
				</div>
				<div class="modifybooking-user">
					<form method=get action="modifyUserWithInput">
						name :
						<input type="text" name="name" value="${user.name}">
						surname :
						<input type="text" name="surname" value="${user.surname}">
						email :
						<input type="text" name="email" value="${user.email}">
						userRights :
						<input type="text" name="role" value="${user.role}">
						<input name="id" value="${user.id}" type="hidden" />
						<input type="submit" value="Modify" />
					</form>
				</div>
	</jsp:body>
</t:genericpage>