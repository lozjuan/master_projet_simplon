<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<div class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Simplon.co</a>
    </div>

    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/booking">Réservations</a></li>
        <security:authorize access="hasAuthority('admin')">
            <li><a href="${pageContext.request.contextPath}/computer">Ordinateurs</a></li>
            <li><a href="${pageContext.request.contextPath}/room">Salles</a></li>
            <li><a href="${pageContext.request.contextPath}/user">Utilisateurs</a></li>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <li><a href="${pageContext.request.contextPath}/message">Messagerie</a></li>
        </security:authorize>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="${pageContext.request.contextPath}/user/profil">
                    <security:authorize access="isAuthenticated()">
                        <security:authentication property="principal.name"/>
                    </security:authorize>
                </a>
            </li>
            <li>
                <security:authorize access="isAuthenticated()">
                    <a href="${pageContext.request.contextPath}/logout">Deconnexion</a>
                 </security:authorize>
            </li>
            <li>
                <security:authorize access="isAnonymous()">
                    <a href="${pageContext.request.contextPath}/login">Se connecter</a>
                 </security:authorize>
            </li>
        </ul>
    </div>
</div>


