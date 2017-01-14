<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Recherche Salle</title>
</head>

head>
	<title>Recherche salle</title>
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
						<h4>Recherche salle</h4>
					</div>
				</div>
				<div class="search-room">
					<form method="get" action="${pageContext.request.contextPath}/room">
						${room.id}&nbsp;${room.name}&nbsp;${room.places}&nbsp;${room.description}
						<input type="submit" value="retour">
					</form>
				</div>
	</jsp:body>
</t:genericpage>
