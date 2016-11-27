<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<div class="navbar navbar-default navbar-fixed-top">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">Simplon.co</a>
    </div>

    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="/booking">Réservations</a></li>
        <security:authorize access="hasAuthority('admin')">
            <li><a href="/computer">Ordinateurs</a></li>
            <li><a href="/room">Salles</a></li>
            <li><a href="/user">Utilisateurs</a></li>
            <li><a href="/message">Messagerie</a></li>
        </security:authorize>
        </ul>
        <ul class="nav navbar-nav navbar-right">
             <li><a href="/user/profil">
                 <security:authorize access="isAuthenticated()">
                           <security:authentication property="principal.name"/>
                  </security:authorize></a></li>
             <li><a href="/logout">Deconnexion</a></li>
        </ul>
    </div>
</div>


