<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<head>
	<title>User</title>
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
			            <h4>User</h4>
			          </div>
			        </div>
			
			<div class="panel-body">
    
		<c:forEach items="${userList}" var="user">
			   	${user.id}
			   	${user.name}
			   	${user.surname}
			   	${user.email}
			   	${user.userRights}
			   	<form action="deleteUser">
				<input name="id" value="${user.id}" type="hidden" /> 
				<input type="submit" value="Delete" />
			</form>
		</c:forEach>
	
		<form method="get" action="addUser">
			<p>Inserer un utilisateur</p>	
			<div>
				nom :<input type="text" name="name"> 
				prenom :<input type="text" name="surname"> 
				email:<input type="text"name="email">
				droits:<input type="text"name="userRights"> 
				<input type="submit" value="Confirmer">
			</div>
		</form>
	
		<form method="get" action="userById">
			<p>Recherche d'utilisateur</p>
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