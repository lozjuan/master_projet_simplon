<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<head>
	<title>Modify PC</title>
</head>

<t:genericpage>
	<jsp:attribute name="header">
		<%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
	</jsp:attribute>
	<jsp:body>
		<form method=get action="modifyComputerWithInput">
			brand :
			<input type="text" name="brand" value="${computer.brand}"> model :
			<input type="text" name="model" value="${computer.model}"> serial:
			<input type="text" name="serial" value="${computer.serial}">
			<input name="id" value="${computer.id}" type="hidden" />
			<input type="submit" value="Modify" />
		</form>
	</jsp:body>
</t:genericpage>