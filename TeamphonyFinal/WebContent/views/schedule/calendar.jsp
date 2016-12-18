<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Teamphony</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<title>Teamphony !</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/schedule/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- FullCalendar -->
<link
	href="${pageContext.request.contextPath}/resources/schedule/vendors/fullcalendar/dist/fullcalendar.print.css"
	rel="stylesheet" media="print">
<link
	href="${pageContext.request.contextPath}/resources/schedule/vendors/fullcalendar/dist/fullcalendar.css"
	rel="stylesheet">
<!-- Custom styling plus plugins -->
<link
	href="${pageContext.request.contextPath}/resources/schedule/build/css/custom.min.css"
	rel="stylesheet">

<body class="w3-light-grey w3-content" style="max-width: 1600px;">

	<!-- side bar -->
	<%@ include file="/views/common/sideBar.jspf"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-container w3-main" style="margin-left: 250px;">

		<!-- Header -->
		<header class="w3-container">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<h1>
				<b>일정 관리</b>
			</h1>
			<h4>팀의 일정을 확인 하고 관리해보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>

		<div class="row">
			<div class="col-md-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>Calendar</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">

						<div id='calendar'></div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End page content -->
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.js"></script>
	<!-- FullCalendar -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>

	<!-- FullCalendar -->
	<script>
        $(window).load(function () {
            var date = new Date(),
                d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear(),
                started,
                categoryClass;

            var calendar = $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
               
                selectable: true,
                selectHelper: true,
                select: function (start, end) {

                    started = start;
                    ended = end; 
                    
                    location.href = "${pageContext.request.contextPath}/schedule/create.do?started=" + started + "&ended=" + ended; 

                },
                 
                eventClick: function (calEvent, jsEvent, view) {
                	
                	var scheduleId = calEvent.id;
                	location.href = "${pageContext.request.contextPath}/schedule/detail.do?scheduleId=" + scheduleId;
               
                }, 
                 
                editable: true,
                eventLimit: true,
                events: [
           			<c:forEach items="${teamSchedules}" var="schedule">
    				{
    					id: '${schedule.scheduleId}',
    					title: '${schedule.title}',
    					start: '${schedule.startDate}',
    					end: '${schedule.endDate}',
    					constraint: 'schedule'
    				},
    				</c:forEach>
    			]
               
            });
        });
    </script>
	<!-- /FullCalendar -->
</body>

</html>