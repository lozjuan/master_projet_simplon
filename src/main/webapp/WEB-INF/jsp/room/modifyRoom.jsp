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
						<h4>Modifier la réservation des salles</h4>
					</div>
				</div>
				<div class="modifybooking-room">
					<form method=get action="modifyRoomWithInput">
						name :
						<input type="text" name="name" value="${room.name}"> places :
						<input type="text" name="places" value="${room.places}"> description :
						<input type="text" name="description" value="${room.description}">
						<input name="id" value="${room.id}" type="hidden" />
						<input type="submit" value="Modify" />
					</form>
				</div>
	</jsp:body>
</t:genericpage>
