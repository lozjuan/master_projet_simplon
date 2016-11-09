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


		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css" href="${bootstrapCss}"/>
		<link rel="stylesheet" type="text/css" href="${bootstrapThemeCss}"/>
		<link rel="stylesheet" type="text/css" href="${bootstrapDateTimePickerCss}"/>
		<link rel="stylesheet" type="text/css" href="${styleCss}"/>
		<link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="/ressources/css/style2.css">
		<link rel="stylesheet" href="/ressources/css/style3.css">
		<link rel="stylesheet" href="/ressources/css/style4.css">
		<link rel="stylesheet" href="/ressources/css/normalize.css">
				

		<!-- JS Dependencies -->
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="/ressources/js/index.js"></script>
		<script src="/ressources/js/index2.js"></script>
		<script src="/ressources/js/index3.js"></script>
		
		
		
		
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