<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<head>
	<title>Recherche utilisateur</title>
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
            <h4>Recherche utilisateur</h4>
          </div>
        </div>

	<div class="search-user">
		<form method="get" action="/user">
		${user.id}&nbsp;${user.name}&nbsp;${user.surname}&nbsp;${user.role}
		<input type="submit" value="retour">
	</form>
	
      </jsp:body>
</t:genericpage>
<script type="text/javascript" src="/ressources/js/bookings.js"></script>
</body>
</html>