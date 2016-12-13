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
						<h4>Modifier la réservation des ordinateurs</h4>
					</div>
				</div>
				<div class="modifybooking-computer">
					<form method=get action="modifyComputerWithInput">
						brand :
						<input type="text" name="brand" value="${computer.brand}"> model :
						<input type="text" name="model" value="${computer.model}"> serial:
						<input type="text" name="serial" value="${computer.serial}">
						<input name="id" value="${computer.id}" type="hidden" />
						<input type="submit" value="Modify" />
					</form>
				</div>
	</jsp:body>
</t:genericpage>