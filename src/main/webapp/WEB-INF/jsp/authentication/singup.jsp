<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>User</title>
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
						<h4>Créer votre compte</h4>
					</div>
				</div>
				<div class="panel-body">
					<form type="password" method="get" action="/user/createUser">
						<div>
							nom :
							<input type="text" required name="name"> prenom :
							<input type="text" required name="surname"> email:
							<input type="email" required name="email"> mdp:
							<input type="password" required name="password"> mdp2:
							<input type="password" required name="password_control">
							<input type="submit" value="Confirmer">
						</div>
						<c:if test="${erreur != null}">
                        	<div style="color: red;">
                        		<c:out value="${erreur}" />
                        	</div>
                        </c:if>
					</form>
				</div>
	</jsp:body>
</t:genericpage>