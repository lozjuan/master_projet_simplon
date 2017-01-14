<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
	<title>Log in - Sign up</title>
</head>

<t:genericpage>
    <jsp:attribute name="header">
      <%@ include file="/WEB-INF/jsp/include/menu.jsp" %>
    </jsp:attribute>

        <jsp:body>
            <div class="logmod">
          <div class="logmod__wrapper">
            <div class="logmod__container">
              <ul class="logmod__tabs">
                <li data-tabtar="lgm-2"><a href="#">Login</a></li>
              </ul>
              <div class="logmod__tab-wrapper">
              <div class="logmod__tab lgm-1">
                <div class="logmod__heading">
                  <span class="logmod__heading-subtitle">Enter your personal details <strong>to create an account</strong></span>
                </div>
                <div class="logmod__form">
                  <form accept-charset="utf-8" action="" class="simform">
                    <div class="sminputs">
                      <div class="input full">
                        <label class="string optional" for="user-name">Email*</label>
                        <input class="string optional" maxlength="255" id="user-email" placeholder="Email" type="email" size="50" />
                      </div>
                    </div>
                    <div class="sminputs">
                      <div class="input string optional">
                        <label class="string optional" for="user-pw">Password *</label>
                        <input class="string optional" maxlength="255" id="user-pw" placeholder="Password" type="text" size="50" />
                      </div>
                      <div class="input string optional">
                        <label class="string optional" for="user-pw-repeat">Repeat password *</label>
                        <input class="string optional" maxlength="255" id="user-pw-repeat" placeholder="Repeat password" type="text" size="50" />
                      </div>
                    </div>
                    <div class="simform__actions">
                      <input class="sumbit" name="commit" type="sumbit" value="Create Account" />
                    </div>
                  </form>
                </div>
                <div class="logmod__alter">
                  <div class="logmod__alter-container">
                    <a href="#" class="connect facebook">
                      <div class="connect__icon">
                        <i class="fa fa-facebook"></i>
                      </div>
                      <div class="connect__context">
                        <span>Create an account with <strong>Facebook</strong></span>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              <div class="logmod__tab lgm-2">
                <div class="logmod__heading">
                  <span class="logmod__heading-subtitle">Enter your email and password <strong>to sign in</strong></span>
                </div>
                <div class="logmod__form">
                  <form accept-charset="utf-8" action="${pageContext.request.contextPath}/login" class="simform" method="post">
                    <div class="sminputs">
                      <div class="input full">
                        <label class="string optional" for="user-name">Email*</label>
                        <input class="string optional" maxlength="255" id="user-email" name="user-email" placeholder="Email" type="email" size="50" />
                      </div>
                    </div>
                    <div class="sminputs">
                      <div class="input full">
                        <label class="string optional" for="user-pw">Password *</label>
                        <input class="string optional" maxlength="255" id="user-pw" name="user-pw" placeholder="Password" type="password" size="50" />
                        <span class="hide-password">Show</span>
                      </div>
                    </div>
                    <div class="simform__actions">
                      <input class="sumbit" name="commit" type="submit" value="Log In"/>
                       <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}"/>
                       <span class="simform__actions-sidetext"><a class="special" role="link" href="${pageContext.request.contextPath}/changePassword">Forgot your password?<br>Click here</a></span>
                    </div>
                  </form>
                </div>
                <div class="logmod__alter">
                  <div class="logmod__alter-container">
                    <a href="${pageContext.request.contextPath}/user/signUp" class="connect facebook">
                      <div class="connect__icon">
                        <i class="fa fa-facebook"></i>
                      </div>
                      <div class="connect__context">
                        <span><strong>SIGN UP HERE</strong></span>
                      </div>
                    </a>
                  </div>
                 </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </jsp:body>
</t:genericpage>