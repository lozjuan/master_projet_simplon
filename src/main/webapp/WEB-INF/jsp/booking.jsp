<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
	<title>Reservation</title>
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
						<h4>Réservation</h4>
					</div>
				</div>
				<div class="panel-body">
					<c:forEach items="${bookingList}" var="booking">
						${booking.id}
						<br> ${booking.room.name}
						<br> ${booking.computer.model}
						<br> ${booking.starts}
						<br> ${booking.ends}
						<br> ${booking.user.name}
						<br>
						<form action="deleteBook">
							<input name="id" value="${booking.id}" type="hidden" />
							<input type="submit" value="Delete" />
						</form>
						<form method="get" action="modifyBookingForm">
							<input name="id" value="${booking.id}" type="hidden" />
							<input type="submit" value="Modifier" />
						</form>
					</c:forEach>
					<form method="get" action="book">
						<security:authorize access="isAuthenticated()">
							<p>Reservez</p>
							<br> Salles :
							<select name="roomId">
								<option value=""></option>
								<c:forEach items="${roomList}" var="room">
									<option value="${room.id}">${room.name}</option>
								</c:forEach>
							</select>
							<hr> Id Ordinateur :
							<select name="computerId">
								<option value=""></option>
								<c:forEach items="${computerList}" var="computer">
									<option value="${computer.id}">${computer.id}&nbsp;${computer.brand}</option>
								</c:forEach>
							</select>
							<hr>
							<div class="form-group">
								<label for="book-start-input">Date de début</label>
								<div class="input-group date" id="book-start">
									<input type='text' name="starts" class="form-control" placeholder="Date de début" id="book-start-input" />
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
							<div class="form-group">
								<label for="book-end-input">Date de fin</label>
								<div class="input-group date" id="book-end">
									<input type='text' name="ends" class="form-control" placeholder="Date de fin" id="book-end-input" />
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
					</form>
					<c:if test="${erreur != null}">
						<div style="color: red;">
							<c:out value="${erreur}" />
						</div>
					</c:if>
					</security:authorize>
				</div>
			</div>
			<hr>
	</jsp:body>
</t:genericpage>
<script type="text/javascript" src="/ressources/js/bookings.js"></script>