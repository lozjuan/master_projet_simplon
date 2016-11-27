<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify PC</title>
</head>
<body>

	<form method=get action="modifyComputerWithInput">
		brand :<input type="text" name="brand" value="${computer.brand}">
		model :<input type="text" name="model" value="${computer.model}">
		serial:<input type="text" name="serial" value="${computer.serial}">
		<input name="id" value="${computer.id}" type="hidden" /> <input
			type="submit" value="Modify" />
	</form>



</body>


</html>