<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
	<title>Computer</title>
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
			            <h4>Computer</h4>
			          </div>
			        </div>
			
			<div class="panel-body">
			
			<c:forEach items="${computerList}" var="computer">
		   	${computer.id}
			<br>
		   	${computer.brand}
			<br>
		   	${computer.model}
			<br>
		   	${computer.serial}
			<br><br>

		<form action="deleteComputer">
				<input name="id" value="${computer.id}" type="hidden" />
				<input type="submit" value="Delete" />
			</form>
<<<<<<< HEAD

			<form action="modifyComputer">
				<input name="id" value="${computer.id}" type="hidden" /> <input
					type="submit" value="Modify" />
			</form>
=======
		
		<form method="get" action="modifyComputer">
			<div>
				<input name="id" value="${computer.id}" type="hidden" /> <input type="submit"
					value="Modifier">
			</div>
		</form>
		
>>>>>>> Seb
			


			<hr>


		</c:forEach>
<<<<<<< HEAD

			        
					<form method="get" action="addComputer">
							<p>Inserer un ordinateur</p>
							<div>
								brand :
								<input type="text" name="brand">
								&nbsp;
								model :
								<input type="text" name="model">
									&nbsp;
								serial:
								<input type="number" name="serial">
								<input type="submit" value="Confirmer">
							</div>
						</form>

						<hr>

						<form method="get" action="computerById">
							<p>Recherche ordinateur : inserer l'id</p>
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
=======
		
		
	
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
	</div>	
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
>>>>>>> Seb
