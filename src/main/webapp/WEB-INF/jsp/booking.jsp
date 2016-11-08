<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Booking</title>
<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="navbar navbar-default navbar-fixed-top">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
      		<a class="navbar-brand" href="#">Simplon réservation</a>
      		
		</div>

		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="/booking">Réservations</a></li>
				<li><a href="/computer">Ordinateurs</a></li>
				<li><a href="/room">Salles</a></li>
				<li><a href="/user">Utilisateurs</a></li>
			</ul>
   		</div>

  </div>
  
<div class="container">

  <div class="row">
    <div class="col-md-12">
    
       <h3>Inteface</h3>
			 &nbsp;
      
     <div class="panel panel-default">
      
        <div class="panel-heading">
          <div class="panel-title">
            <h4>Booking</h4>
          </div>
        </div>

			<div class="panel-body">

					<c:forEach items="${bookingList}" var="booking">
					   	${booking.id}
							<br>
							${booking.room.name}
							<br>
							${booking.computer.model}
							<br>
					   	${booking.starts}
							<br>
					   	${booking.ends}
							<br>
					   	${booking.user.name}
							<br>
					</c:forEach>

					<hr>

	<form method="get" action="book">
	<p>Reservez</p>
	&nbsp;
	
	<div>
			Salles :
			<select name="roomId">
								<option value=""></option>
										<c:forEach items="${roomList}" var="room">
								<option value="${room.id}">${room.name}</option>
										</c:forEach>
			</select>

			<hr>

			Id Ordinateur :
			<select name="computerId">
								<option value=""></option>
								<c:forEach items="${computerList}" var="computer">
									<option value="${computer.id}">${computer.id}&nbsp;${computer.brand}</option>
								</c:forEach>
			</select>
			
			<hr>

			debut :
			<input type="datetime-local" name="starts">

			<hr>

			fin :
			<input type="datetime-local" name="ends">

			Utilisateur :
			<select name="userId">
								<option value=""></option>
									<c:forEach items="${userList}" var="user">
										<option value="${user.id}">${user.name}&nbsp;${user.surname}</option>
								</c:forEach>
			</select>


			<input type="submit" value="Confirmer">

		</div>
	</form>

	<c:if test="${erreur != null}">
        <div style="color: red;"><c:out value="${erreur}"/></div>
    </c:if>
            </div>

        </div><!--/panel content-->
      </div><!--/panel-->

    </div><!--/col-->
  </div><!--/row-->
</div><!--/container-->
<!-- /Main -->


<footer class="text-center">2016</footer>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>