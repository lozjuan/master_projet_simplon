<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<head>
	<title>Booking</title>
</head>

<t:genericpage>
    <jsp:attribute name="header">
      <%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
    </jsp:attribute>

    <jsp:attribute name="footer">
      <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
    </jsp:attribute>
    <jsp:body>
    
		<c:forEach items="${computerList}" var="computer">
		   	${computer.id}
		   	${computer.brand}
		   	${computer.model}
		   	${computer.serial}
		   	<form action="deleteComputer">
				<input name="id" value="${computer.id}" type="hidden" /> <input
					type="submit" value="Delete" />
			</form>
			
		</c:forEach>
	
		<form method="get" action="addComputer">
			<p>Inserer un ordinateur</p>
			<div>
				brand :<input type="text" name="brand"> 
				model :<input type="text" name="model"> 
				serial:<input type="number" name="serial"> 
				   	   <input type="submit" value="Confirmer">
			</div>
		</form>
	
		<form method="get" action="computerById">
			<p>Recherche ordinateur : inserer l'id</p>
			<div>
				id:<input type="number" name="id"> <input type="submit"
					value="Rechercher">
			</div>
		</form>

	      </jsp:body>
</t:genericpage>