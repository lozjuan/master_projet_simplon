<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
	<title>Calendrier</title>
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
                <h4>Calendrier</h4>
            </div>
        </div>

    <div class="panel-body">
        <div id="calendar">

        </div>

    </div>
      </jsp:body>
</t:genericpage>
<script type="text/javascript" src="/ressources/js/calendar.js"></script>
</body>
</html>