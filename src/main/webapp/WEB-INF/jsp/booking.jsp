<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${bookingList}" var="booking">
	   	${booking.id}
	   	${booking.roomId}
	   	${booking.computerId}
	   	${booking.starts}
	   	${booking.ends}
	   	${booking.userId}
	</c:forEach>
	
	<form method="get" action="book">
		<p>Reservez</p>
		<div>
			Salles :        <select id="roomId">
								<option value=""></option>
								<c:forEach items="${roomList}" var="room">
									<option value="${room.id}">${room.name}</option>
								</c:forEach>
							</select>
			Id Ordinateur : <select id="computerId">
								<option value=""></option>
								<c:forEach items="${computerList}" var="computer">
									<option value="${computer.id}">${computer.id}&nbsp;${computer.brand}</option>
								</c:forEach>
							</select>		
			debut :         <input type="datetime-local" name="starts">
			fin :           <input type="datetime-local" name="ends">
			Utilisateur :   <select id="userId">
								<option value=""></option>
								<c:forEach items="${userList}" var="user">
									<option value="${user.id}">${user.name}&nbsp;${user.surname}</option>
								</c:forEach>
							</select>					
							<input type="submit" value="Confirmer">
		</div>
	</form>

</body>
</html>