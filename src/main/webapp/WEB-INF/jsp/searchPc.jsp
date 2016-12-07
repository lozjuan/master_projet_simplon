<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Item retrouve</title>
</head>

<t:genericpage>
	<jsp:attribute name="header">
		<%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
	</jsp:attribute>
	<jsp:body>
		<form method="get" action="/computer">
			${computer.id}&nbsp;${computer.brand}&nbsp;${computer.model}&nbsp;${computer.serial}
			<input type="submit" value="retour">
		</form>
	</jsp:body>
</t:genericpage>