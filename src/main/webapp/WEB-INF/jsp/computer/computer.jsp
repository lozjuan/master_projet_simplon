<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Computer</title>
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
						<h4>Computer</h4>
					</div>
				</div>
				<div class="panel-body">
					<c:forEach items="${computerList}" var="computer">
						${computer.id}
						<br> ${computer.brand}
						<br> ${computer.model}
						<br> ${computer.serial}
						<br>
						<br>
						<form action="computer/deleteComputer">
							<input name="id" value="${computer.id}" type="hidden" />
							<input type="submit" value="Delete" />
						</form>
						<form method="get" action="computer/modifyComputer">
							<div>
								<input name="id" value="${computer.id}" type="hidden" />
								<input type="submit" value="Modifier">
							</div>
						</form>
						<hr>
					</c:forEach>
					</form>
					<form method="post" action="/computer/addComputer">
						<p>Inserer un ordinateur</p>
						<div>
							brand :
							<input type="text" name="brand"> &nbsp;
							model :
							<input type="text" name="model"> &nbsp;
							serial:
							<input type="text" name="serial">
							<input type="submit" value="Confirmer">
							<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
						</div>
					</form>
					<hr>
					<form method="get" action="computer/computerById">
						<p>Recherche ordinateur : inserer l'id</p>
						<div>
							id:
							<input type="number" name="id">
							<input type="submit" value="Rechercher">
						</div>
					</form>
					<c:if test="${erreur != null}">
						<div style="color: red;">
							<c:out value="${erreur}" />
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</jsp:body>
</t:genericpage>