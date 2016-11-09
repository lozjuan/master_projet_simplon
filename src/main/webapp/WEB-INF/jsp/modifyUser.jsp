<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify Room</title>
</head>
<body>

	<form method=get action="modifyUserWithInput">
		name :<input type="text" name="name" value="${user.name}">
		surname :<input type="text" name="surname" value="${user.surname}">
		email :<input type="text" name="email" value="${user.email}">
		userRights :<input type="text" name="userRights" value="${user.userRights}">
		<input name="id" value="${user.id}" type="hidden" /> <input
			type="submit" value="Modify" />
	</form>



</body>


</html>