<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Messagerie</title>
		<head>
		        <title>Messagerie</title>
		</head>

		 <body>
	        <c:forEach items="${messageList}" var="message">
	        <c:if test="${message.treated == 0}">
                ${message.id}
                ${message.content}
                ${message.createdAt}
                <form action="message/setMessageAsTreated">
                    <security:authorize access="hasAuthority('admin')">
                        <input name="id" value="${message.id}" type="hidden" />
                        <input type="submit" value="Traiter" />
                   </security:authorize>
                </form>
            </c:if>
            <c:if test="${message.treated == 1}">
                ${message.id}
                ${message.content}
                ${"Traité le"}
                ${message.treatedAt}
            </c:if>
            </c:forEach>

	        <form method="get" action="/message/sendMessage">
                <div>
                    rentrez votre message : <input type="text" name="content">
                    <input type="submit" value="Envoyer">
                </div>
            </form>
	    </body>
