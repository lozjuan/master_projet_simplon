<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Votre Profil</title>
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
						<h4>Votre Profil</h4>
					</div>
				</div>
				<div class="panel-body">
					<h4>ID Utilisateur</h4>
					${currentUser.id}
					<br>
					<h4>Prénom</h4>
					${currentUser.name}
					<br>
					<h4>Nom</h4>
					${currentUser.surname}
					<br>
					<h4>Email</h4>
					${currentUser.email}
					<br>
					<h4>Droits</h4>
					${currentUser.role}
					<br>
					<br>
					<form method="get" action="${pageContext.request.contextPath}/newPassword">
						<div>
							<input type="submit" value="changer votre mot de passe">
						</div>
					</form>
				</div>
			</div>
	</jsp:body>
</t:genericpage>