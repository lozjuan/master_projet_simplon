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
		<link rel="stylesheet" href="/ressources/css/normalize.css">
		<link rel="stylesheet" href="/ressources/css/style2.css">
		<link rel="stylesheet" href="/ressources/css/style3.css">
		<link rel="stylesheet" href="/ressources/css/style4.css">


		<!-- JS Dependencies -->
		<script src="/ressources/js/jquery-3.1.1.min.js"></script>
		<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/ressources/js/moment.min.js"></script>
		<script type="text/javascript" src="/ressources/js/bootstrap-datetimepicker.js"></script>
		<script src="/ressources/js/index.js"></script>
		<script src="/ressources/js/index2.js"></script>

		<!-- datetimepicker JS -->
		<script src="/ressources/js/booking.js"></script

		<!-- fullcalendar -->
		<script type="text/javascript" src="/ressources/js/fullcalendar.min.js"></script>
        <script type="text/javascript" src='/ressources/js/locale-all.js'></script>
        <script type="text/javascript" src="/ressources/js/bookingCalendar.js"></script>
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