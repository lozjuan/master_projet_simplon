<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<head>
<title>User</title>
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
        <c:if test="${user.isEnable == 0}">

			   	${user.id}<br />
			   	${user.name}<br />
			   	${user.surname}<br />
			   	${user.email}<br />
			   	${user.role}
            <div>
			   	<form method="post" action="user/deleteUser">
			   		<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
                    <input name="id" value="${user.id}" type="hidden" />
                    <input type="submit" value="Delete" />
			    </form>
			    <form method="get" action="user/modifyUser">
					<input name="id" value="${user.id}" type="hidden" />
					<input type="submit" value="Modifier">
			    </form>
			    <form method="get" action="user/unableUser">
                    <input name="id" value="${user.id}" type="hidden" />
                    <input type="submit" value="Désactiver">
                </form>
            </div>
        </c:if>
        <c:if test="${user.isEnable == 1}">

                <p>le compte est bloqué</p>
                ${user.id}<br />
                ${user.name}
                ${user.surname}<br />
                ${user.email}<br />
                ${user.role}
            <div>
                <form action="user/deleteUser">
                     <input name="id" value="${user.id}" type="hidden" />
                     <input type="submit" value="Supprimer" />
                </form>
                <form method="get" action="user/modifyUser">
                        <input name="id" value="${user.id}"
										type="hidden" />
                        <input type="submit" value="Modifier">
                </form>
                <form method="get" action="user/enableUser">
                    <input name="id" value="${user.id}" type="hidden" />
                    <input type="submit" value="Activer">
                </form>
            </div>
        </c:if>
		</c:forEach>
		
		<c:if test="${erreur != null}">
	        <div style="color: red;">
						<c:out value="${erreur}" />
					</div>
	    </c:if>
		<form method="get" action="/user/addUser">
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
	
		<form method="get" action="/user/userById">
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