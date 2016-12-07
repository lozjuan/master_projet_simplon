<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<head>
	<title>Modify Room</title>
</head>

<t:genericpage>
	<jsp:attribute name="header">
		<%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
	</jsp:attribute>
	<form method=get action="modifyUserWithInput">
		name :
		<input type="text" name="name" value="${user.name}"> surname :
		<input type="text" name="surname" value="${user.surname}"> email :
		<input type="text" name="email" value="${user.email}"> userRights :
		<input type="text" name="role" value="${user.role}">
		<input name="id" value="${user.id}" type="hidden" />
		<input type="submit" value="Modify" />
	</form>
	</jsp:body>
</t:genericpage>