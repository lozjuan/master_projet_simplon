<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recherche Salle</title>
</head>
<body>
	<form method="get" action="/user">
		${user.id}&nbsp;${user.name}&nbsp;${user.surname}&nbsp;${user.role}
		<input type="submit" value="retour">
	</form>
</body>
</html>
