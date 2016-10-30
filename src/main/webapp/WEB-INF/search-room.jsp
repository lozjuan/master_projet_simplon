<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recherche Salle</title>
</head>
<body>
	<form method="get" action="room">
	        ${room.id}&nbsp;${room.name}&nbsp;${room.places}&nbsp;${room.description}
	        <input type="submit" value="retour" >
	</form>
</body>
</html>