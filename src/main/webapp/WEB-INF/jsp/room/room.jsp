<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Room</title>
</head>

<t:genericpage>
    <jsp:attribute name="header">
      <%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
    </jsp:attribute>

    <jsp:body>
    
    <div class="col-md-12">
      <br><br><br>
      
      	<div class="panel panel-default">
			      
			        <div class="panel-heading">
			          <div class="panel-title">
			            <h4>Room</h4>
			          </div>
			        </div>
			
			<div class="panel-body">
			
		<c:forEach items="${roomList}" var="room">
			   	${room.id}
			   	${room.name}
			   	${room.places}
			   	${room.description}
			   	<form action="/room/deleteRoom">
					<input name="id" value="${room.id}" type="hidden" /> 
					<input type="submit" value="Delete" />
				</form>
				<form method="get" action="room/modifyRoom">
					<input name="id" value="${room.id}" type="hidden" /> <input
						type="submit" value="Modifier"/>
				</form>
		</c:forEach>
	
		<form method="get" action="/room/addRoom">
			<p>Inserer une salle</p>
			<div>
				name :<input type="text" name="name"> 
				places :<input type="number" name="places"> 
				description:<input type="text"name="description"><input type="submit" value="Confirmer">
	
			</div>
		</form>
	
		<form method="get" action="/room/roomById">
			<p>Recherche de salles</p>
			<div>
				id:<input type="number" name="id"> <input type="submit"
					value="Rechercher">
			</div>
		</form>
		
		
		</div>
	</div>
</div>

		      </jsp:body>
</t:genericpage>