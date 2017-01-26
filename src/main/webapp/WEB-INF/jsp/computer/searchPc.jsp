<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Recherche PC</title>
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
						<h4>Item retrouvé </h4>
					</div>
				</div>
				<div class="modifybooking-user">
					<form method="get" action="/computer">
						${computer.id}&nbsp;${computer.brand}&nbsp;${computer.model}&nbsp;${computer.serial}
						<input type="submit" value="retour">
					</form>
				</div>
	</jsp:body>
</t:genericpage>