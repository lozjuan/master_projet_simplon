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

	<form method="get" action="book"></form>
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

	<form method="get" action="book"></form>
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

      </jsp:body>
</t:genericpage>

</body>
</html>