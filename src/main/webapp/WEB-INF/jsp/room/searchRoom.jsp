<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Recherche Salle</title>
</head>

<t:genericpage>
	<jsp:attribute name="header">
		<%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
	</jsp:attribute>
	<jsp:body>
		<form method="get" action="/room">
			${room.id}&nbsp;${room.name}&nbsp;${room.places}&nbsp;${room.description}
			<input type="submit" value="retour">
		</form>
	</jsp:body>
</t:genericpage>