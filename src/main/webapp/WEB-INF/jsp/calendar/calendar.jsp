<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<head>
<title>Calendrier</title>
</head>

<t:genericpage>
	<jsp:attribute name="header">
      <%@ include file="/WEB-INF/jsp/include/menu.jsp"%>
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
        
  <div style="overflow:hidden;">
    <div class="form-group">
        <div class="calendar">
            <div class="col-md-8">
                <div id="datetimepicker12"></div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker12').datetimepicker({
                inline: true,
                sideBySide: true,
                defaultDate:"10/12/2012"
            }).on("dp.change", function(e) {
            	console.log(e.date);
            	var date = $("#datetimepicker12").data("datetimepicker");
            	console.log(date);
            });
        });
        
        
        
        
        
        
        
        <%--$( "#datetimepicker12" ).datepicker( "setDate", "10/12/2012" )--%>
    </script>
</div>
        

			
 
      </jsp:body>
</t:genericpage>

</body>
</html>