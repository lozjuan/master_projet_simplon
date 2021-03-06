<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<head>
	<title>Modifier MDP</title>
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
						<h4>Modifier MDP</h4>
					</div>
				</div>
				<div class="panel-body">
					<form method="get" action="/saveNewPassword">
						email:
						<input type="text" name="email"> MDP:
						<input type="text" name="newPassword"> MDP2:
						<input type="text" name="newPasswordControl">
						<input type="submit" value="Confirmer">
					</form>
					<c:if test="${erreur != null}">
                    	<div style="color: red;">
                    		<c:out value="${erreur}" />
                    	</div>
                    </c:if>
				</div>
			</div>
	</jsp:body>
</t:genericpage>
