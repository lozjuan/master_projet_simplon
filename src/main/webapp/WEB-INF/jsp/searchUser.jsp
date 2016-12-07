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
	<form method="get" action="/user">
		${user.id}&nbsp;${user.name}&nbsp;${user.surname}&nbsp;${user.role}
		<input type="submit" value="retour">
	</form>
	</jsp:body>
</t:genericpage>