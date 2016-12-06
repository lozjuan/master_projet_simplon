<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<head>
	<title>Réponse de Simplon</title>
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
                <h4>Message envoyé</h4>
              </div>
            </div>
			<div class="panel-body">
			    <form method="get" action="/">
                    <p>Votre message a été envoyé</p>
                <input type="submit" value="retour" >
			</div>

	</jsp:body>

</t:genericpage>