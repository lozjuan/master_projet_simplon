<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<head>
	<title>Messagerie</title>
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
						<h4>Messagerie</h4>
					</div>
				</div>
				<div class="panel-body">
					<c:forEach items="${messageList}" var="message">
						<c:if test="${message.treated == 0}">
							${message.id} ${message.content} ${message.createdAt}
							<form action="${pageContext.request.contextPath}/message/setMessageAsTreated">
								<security:authorize access="hasAuthority('admin')">
									<input name="id" value="${message.id}" type="hidden" />
									<input type="submit" value="Traiter" />
								</security:authorize>
							</form>
							<form action="${pageContext.request.contextPath}/message/reply">
								<security:authorize access="hasAuthority('admin')">
									<input name="idMessage" value="${message.id}" type="hidden" />
									<input type="submit" value="Répondre" />
								</security:authorize>
							</form>
						</c:if>
						<c:if test="${message.treated == 1}">
							${message.id} ${message.content} ${"Traité le"} ${message.treatedAt}
						</c:if>
						<br>
						<br>
					</c:forEach>

					<form method="post" action="${pageContext.request.contextPath}/message/sendMessage">
						<div>
							rentrez votre message :
							<input type="text" name="content">
							<input type="submit" value="Envoyer">
							<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
						</div>
					</form>
				</div>
			</div>
	</jsp:body>
</t:genericpage>
