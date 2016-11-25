<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>recherche PC</title>
		<head>
		        <title>Messagerie</title>
		</head>

		 <body>
	        <c:forEach items="${messageList}" var="message">
                ${message.id}
                ${message.content}
                ${message.createdAt}
                <form action="">
                    <input name="id" value="${message.id}" type="hidden" />
                    <input type="submit" value="Delete" />
                </form>
             </c:forEach>

	        <form method="get" action="/message/sendMessage">
                <div>
                    rentrez votre message : <input type="text" name="content">
                    <input type="submit" value="Envoyer">
                </div>
            </form>
	    </body>
