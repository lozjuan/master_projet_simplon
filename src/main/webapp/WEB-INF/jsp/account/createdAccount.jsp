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
					<form type="password" method="get" action="/">
						<div>
							<h3>Votre compte a été créé</h3>
							<input type="submit" value="Se connecter">
						</div>
					</form>
				</div>
	</jsp:body>
</t:genericpage>