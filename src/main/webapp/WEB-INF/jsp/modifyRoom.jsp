<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify Room</title>
</head>
<body>

	<form method=get action="modifyRoomWithInput">
		name :<input type="text" name="name" value="${room.name}">
		places :<input type="text" name="places" value="${room.places}">
		description :<input type="text" name="description" value="${room.description}">
		<input name="id" value="${room.id}" type="hidden" /> <input
			type="submit" value="Modify" />
	</form>



</body>


</html>