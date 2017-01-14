<%@ tag description="Generic Page" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="footer" fragment="true" %>
<html>
	<head>
		<spring:url value="/ressources/css/bootstrap.min.css" var="bootstrapCss" />
		<spring:url value="/ressources/css/bootstrap-theme.min.css" var="bootstrapThemeCss" />
		<spring:url value="/ressources/css/bootstrap-datetimepicker.min.css" var="bootstrapDateTimePickerCss" />
		<spring:url value="/ressources/css/style.css" var="styleCss"/>
		<spring:url value="/ressources/css/fullcalendar.min.css" var="fullCalendarPickerCss"/>

		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css" href="${bootstrapCss}"/>
		<link rel="stylesheet" type="text/css" href="${bootstrapThemeCss}"/>
		<link rel="stylesheet" type="text/css" href="${bootstrapDateTimePickerCss}"/>
		<link rel="stylesheet" type="text/css" href="${fullCalendarPickerCss}"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/normalize.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/style2.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/style3.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/style4.css">


		<!-- JS Dependencies -->
		<script src="${pageContext.request.contextPath}/ressources/js/jquery-3.1.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ressources/js/moment.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ressources/js/bootstrap-datetimepicker.js"></script>
		<script src="${pageContext.request.contextPath}/ressources/js/index.js"></script>
		<script src="${pageContext.request.contextPath}/ressources/js/index2.js"></script>

		<!-- datetimepicker JS -->
		<script src="${pageContext.request.contextPath}/ressources/js/booking.js"></script

		<!-- fullcalendar -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/ressources/js/fullcalendar.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/ressources/js/locale-all.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/ressources/js/bookingCalendar.js"></script>
	</head>

  	<body>
	    <header>
	      	<jsp:invoke fragment="header"/>
	    </header>
	    <div id="main" class="container-fluid">
	      	<jsp:doBody/>
	    </div>
	</body>
</html>