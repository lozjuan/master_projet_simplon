<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify PC</title>
</head>
<body>

	<form method=get action="modifyBookingWithInput">
		Salles : <select name="roomId">
			<option value=""></option>

			<c:forEach items="${roomList}" var="room">
				<c:if test="${booking.room.id==room.id}">
					<option value="${room.id}" selected="selected">${room.name}</option>
				</c:if>
				<c:if test="${booking.room.id!=room.id}">
					<option value="${room.id}">${room.name}</option>
				</c:if>
			</c:forEach>
		</select> Id Ordinateur : <select name="computerId">
			<option value=""></option>
			<c:forEach items="${computerList}" var="computer">
				<c:if test="${booking.computer.id==computer.id}">
					<option value="${computer.id}" selected="selected">${computer.id}&nbsp;${computer.brand}</option>
				</c:if>
				<c:if test="${booking.computer.id!=computer.id}">
					<option value="${computer.id}">${computer.id}&nbsp;${computer.brand}</option>
				</c:if>
			</c:forEach>
		</select> starts : 
			<input type="datetime-local" name="starts"
			value=<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${booking.starts}"/>> ends : <input
			type="datetime-local" name="ends" value=<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm" value="${booking.ends}"/>> <input
			name="id" value="${booking.id}" type="hidden" /> <select
			name="userId">
			<option value=""></option>
			<c:forEach items="${userList}" var="user">
				<c:if test="${booking.user.id==user.id}">
					<option value="${user.id}" selected="selected">${user.name}&nbsp;${user.surname}</option>
				</c:if>
				<c:if test="${booking.user.id!=user.id}">
					<option value="${user.id}">${user.name}&nbsp;${user.surname}</option>
				</c:if>
			</c:forEach>
		</select> <input type="submit" value="Modify" />
	</form>



</body>


</html>