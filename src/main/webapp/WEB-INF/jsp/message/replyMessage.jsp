<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Envoyer un message</title>
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
						<h4>Envoyer un message</h4>
					</div>
				</div>
				<div class="panel-body">
					<c:forEach items="${email}" var="email">
						<form method="post" action="${pageContext.request.contextPath}/message/sendReply">
							<input type="text" name="body">
							<input type="submit" value="envoyer">
							<input type="hidden" name="email" value="${email}" />
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</c:forEach>
				</div>
			</div>
	</jsp:body>
</t:genericpage>