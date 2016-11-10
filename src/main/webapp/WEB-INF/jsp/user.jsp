<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<head>

<title>User</title>

<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<t:genericpage>
	<jsp:attribute name="header">
      <%@ include file="/WEB-INF/jsp/include/menu.jsp"%>
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
			   	${user.password}
			   	${user.role}
			   	<form action="user/deleteUser">
				<input name="id" value="${user.id}" type="hidden" /> <input
								type="submit" value="Delete" />

			</form>
			<form method="get" action="user/modifyUser">
				<div>
					<input name="id" value="${user.id}" type="hidden" /> <input
									type="submit" value="Modifier">
				</div>
			</form>

		</c:forEach>

	
		<form method="get" action="user/addUser">
			<p>Inserer un utilisateur</p>	
			<div>
				nom :<input type="text" name="name"> 
				prenom :<input type="text" name="surname"> 
				email:<input type="text" name="email">
				mdp:<input type="text" name="password">
				droits:<input type="text" name="role"> 
				<input type="submit" value="Confirmer">
			</div>
		</form>

		

		<form method="get" action="user/userById">

			<p>Recherche d'utilisateur</p>
			<div>
				id:<input type="number" name="id"> <input type="submit"
								value="Rechercher">
			</div>
		</form>
		
		</div>
	</div>


		
		      
	
	
	</jsp:body>
</t:genericpage>


<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

