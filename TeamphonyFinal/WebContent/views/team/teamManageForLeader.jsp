<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Teamphony</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/resources/css/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/build/css/custom.min.css"
	rel="stylesheet">

<style type="text/css" rel="stylesheet">
.list-member {
	padding: 14px;
}

#menuTitle {
	margin-bottom: 50px;
}

#withdrawBtn {
	margin-top: 60px;
}

#teamManage {
	padding-top: 7%;
	padding-left: 10%;
	margin-right: 0px;
}

.profile {
	margin-bottom: 80px;
}
</style>

</header>

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>Teamphony</span></a>
					</div>

					<div class="clearfix"></div>


					<!-- menu profile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img
								src="${pageContext.request.contextPath}/resources/images/avatar.png"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>tnghsla13</span>
							<h2>육식중인초식남</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">

							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> 팀 관리 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">

									</ul></li>
								<li><a><i class="fa fa-edit"></i> 게시판 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">

									</ul></li>
								<li><a><i class="fa fa-desktop"></i> 과제 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">

									</ul></li>
								<li><a><i class="fa fa-table"></i> 일정관리 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">

									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> 팀원평가 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">

									</ul></li>
								<li><a><i class="fa fa-clone"></i>장소정보 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
									</ul></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->


				</div>
			</div>

			<!-- top navigation -->

			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="${pageContext.request.contextPath}/resources/images/avatar.png"
									alt="">tnghsla13 <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="login.html"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>

			<!-- /top navigation -->


			<!-- page content -->
			<div class="right_col" role="main">

				<div class="container" id="teamManage">
					<h2 id="menuTitle">팀 관리</h2>

					<form>

						<div class="row">
							<div class="form-group col-xs-7">
								<label for="teamName">팀 명:</label> <input type="text"
									value="${team.name}" class="form-control input-lg"
									id="teamName" size="7" readonly>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-xs-7">
								<label for="cycle">팀원 평가주기:</label> <input type="number"
									value="${team.cycle}" class="form-control input-lg" id="cycle"
									readonly>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-xs-7">
								<label for="evaluationDate">평가 만료기간:</label> <input type="date"
									value="${team.endDate}" class="form-control input-lg"
									id="evaluationDate" readonly>
							</div>

						</div>

					</form>

					<div class="row list-member">


						<p>
							<label>팀원 목록:</label>
						</p>


						<ul class="list-group col-xs-7">

							<c:forEach items="${memberList}" var="member"
								varStatus="cntOfMembers">

								<li class="list-group-item list-group-item-info">${member.alias}</li>
							</c:forEach>

						</ul>

						<button class="btn-link col-xs-7" data-toggle="modal"
							data-target="#myModal">팀원초대</button>

					</div>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<form action="${pageContext.request.contextPath}/team/invite.do"
								method="post">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">팀원 초대</h4>
									</div>
									<div class="modal-body">
										<p>
											<input type="email" class="form-control" name="e_mail_1"
												placeholder="팀원 e-mail  ex) prattler@gmail.com">
										</p>


									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-info btn-lg">초대</button>
										<button type="button" class="btn btn-info btn-lg"
											data-dismiss="modal">취소</button>
									</div>
								</div>

							</form>

						</div>
					</div>






					<div class="col-xs-7">
						<button class="btn-primary btn-lg col-xs-3"
							style="margin-left: 5%; margin-right: 5%;" id="withdrawBtn">
							수정</button>

						<button class="btn-primary btn-lg col-xs-3" id="withdrawBtn">
							삭제</button>

					</div>


				</div>
				<!-- /page content -->


				<!-- footer content -->
				<footer> </footer>
				<!-- /footer content -->
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/Flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/css/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/css/build/js/custom.min.js"></script>

	<!-- Flot -->
	<script>
		$(document).ready(
				function() {
					var data1 = [ [ gd(2012, 1, 1), 17 ],
							[ gd(2012, 1, 2), 74 ], [ gd(2012, 1, 3), 6 ],
							[ gd(2012, 1, 4), 39 ], [ gd(2012, 1, 5), 20 ],
							[ gd(2012, 1, 6), 85 ], [ gd(2012, 1, 7), 7 ] ];

					var data2 = [ [ gd(2012, 1, 1), 82 ],
							[ gd(2012, 1, 2), 23 ], [ gd(2012, 1, 3), 66 ],
							[ gd(2012, 1, 4), 9 ], [ gd(2012, 1, 5), 119 ],
							[ gd(2012, 1, 6), 6 ], [ gd(2012, 1, 7), 9 ] ];
					$("#canvas_dahs").length
							&& $.plot($("#canvas_dahs"), [ data1, data2 ], {
								series : {
									lines : {
										show : false,
										fill : true
									},
									splines : {
										show : true,
										tension : 0.4,
										lineWidth : 1,
										fill : 0.4
									},
									points : {
										radius : 0,
										show : true
									},
									shadowSize : 2
								},
								grid : {
									verticalLines : true,
									hoverable : true,
									clickable : true,
									tickColor : "#d5d5d5",
									borderWidth : 1,
									color : '#fff'
								},
								colors : [ "rgba(38, 185, 154, 0.38)",
										"rgba(3, 88, 106, 0.38)" ],
								xaxis : {
									tickColor : "rgba(51, 51, 51, 0.06)",
									mode : "time",
									tickSize : [ 1, "day" ],
									//tickLength: 10,
									axisLabel : "Date",
									axisLabelUseCanvas : true,
									axisLabelFontSizePixels : 12,
									axisLabelFontFamily : 'Verdana, Arial',
									axisLabelPadding : 10
								},
								yaxis : {
									ticks : 8,
									tickColor : "rgba(51, 51, 51, 0.06)",
								},
								tooltip : false
							});

					function gd(year, month, day) {
						return new Date(year, month - 1, day).getTime();
					}
				});
	</script>
	<!-- /Flot -->

	<!-- JQVMap -->
	<script>
		$(document).ready(function() {
			$('#world-map-gdp').vectorMap({
				map : 'world_en',
				backgroundColor : null,
				color : '#ffffff',
				hoverOpacity : 0.7,
				selectedColor : '#666666',
				enableZoom : true,
				showTooltip : true,
				values : sample_data,
				scaleColors : [ '#E6F2F0', '#149B7E' ],
				normalizeFunction : 'polynomial'
			});
		});
	</script>
	<!-- /JQVMap -->

	<!-- Skycons -->
	<script>
		$(document)
				.ready(
						function() {
							var icons = new Skycons({
								"color" : "#73879C"
							}), list = [ "clear-day", "clear-night",
									"partly-cloudy-day", "partly-cloudy-night",
									"cloudy", "rain", "sleet", "snow", "wind",
									"fog" ], i;

							for (i = list.length; i--;)
								icons.set(list[i], list[i]);

							icons.play();
						});
	</script>
	<!-- /Skycons -->

	<!-- Doughnut Chart -->
	<script>
		$(document).ready(
				function() {
					var options = {
						legend : false,
						responsive : false
					};

					new Chart(document.getElementById("canvas1"), {
						type : 'doughnut',
						tooltipFillColor : "rgba(51, 51, 51, 0.55)",
						data : {
							labels : [ "Symbian", "Blackberry", "Other",
									"Android", "IOS" ],
							datasets : [ {
								data : [ 15, 20, 30, 10, 30 ],
								backgroundColor : [ "#BDC3C7", "#9B59B6",
										"#E74C3C", "#26B99A", "#3498DB" ],
								hoverBackgroundColor : [ "#CFD4D8", "#B370CF",
										"#E95E4F", "#36CAAB", "#49A9EA" ]
							} ]
						},
						options : options
					});
				});
	</script>
	<!-- /Doughnut Chart -->

	<!-- bootstrap-daterangepicker -->
	<script>
		$(document)
				.ready(
						function() {

							var cb = function(start, end, label) {
								console.log(start.toISOString(), end
										.toISOString(), label);
								$('#reportrange span').html(
										start.format('MMMM D, YYYY') + ' - '
												+ end.format('MMMM D, YYYY'));
							};

							var optionSet1 = {
								startDate : moment().subtract(29, 'days'),
								endDate : moment(),
								minDate : '01/01/2012',
								maxDate : '12/31/2015',
								dateLimit : {
									days : 60
								},
								showDropdowns : true,
								showWeekNumbers : true,
								timePicker : false,
								timePickerIncrement : 1,
								timePicker12Hour : true,
								ranges : {
									'Today' : [ moment(), moment() ],
									'Yesterday' : [
											moment().subtract(1, 'days'),
											moment().subtract(1, 'days') ],
									'Last 7 Days' : [
											moment().subtract(6, 'days'),
											moment() ],
									'Last 30 Days' : [
											moment().subtract(29, 'days'),
											moment() ],
									'This Month' : [ moment().startOf('month'),
											moment().endOf('month') ],
									'Last Month' : [
											moment().subtract(1, 'month')
													.startOf('month'),
											moment().subtract(1, 'month')
													.endOf('month') ]
								},
								opens : 'left',
								buttonClasses : [ 'btn btn-default' ],
								applyClass : 'btn-small btn-primary',
								cancelClass : 'btn-small',
								format : 'MM/DD/YYYY',
								separator : ' to ',
								locale : {
									applyLabel : 'Submit',
									cancelLabel : 'Clear',
									fromLabel : 'From',
									toLabel : 'To',
									customRangeLabel : 'Custom',
									daysOfWeek : [ 'Su', 'Mo', 'Tu', 'We',
											'Th', 'Fr', 'Sa' ],
									monthNames : [ 'January', 'February',
											'March', 'April', 'May', 'June',
											'July', 'August', 'September',
											'October', 'November', 'December' ],
									firstDay : 1
								}
							};
							$('#reportrange span').html(
									moment().subtract(29, 'days').format(
											'MMMM D, YYYY')
											+ ' - '
											+ moment().format('MMMM D, YYYY'));
							$('#reportrange').daterangepicker(optionSet1, cb);
							$('#reportrange').on('show.daterangepicker',
									function() {
										console.log("show event fired");
									});
							$('#reportrange').on('hide.daterangepicker',
									function() {
										console.log("hide event fired");
									});
							$('#reportrange')
									.on(
											'apply.daterangepicker',
											function(ev, picker) {
												console
														.log("apply event fired, start/end dates are "
																+ picker.startDate
																		.format('MMMM D, YYYY')
																+ " to "
																+ picker.endDate
																		.format('MMMM D, YYYY'));
											});
							$('#reportrange').on('cancel.daterangepicker',
									function(ev, picker) {
										console.log("cancel event fired");
									});
							$('#options1').click(
									function() {
										$('#reportrange').data(
												'daterangepicker').setOptions(
												optionSet1, cb);
									});
							$('#options2').click(
									function() {
										$('#reportrange').data(
												'daterangepicker').setOptions(
												optionSet2, cb);
									});
							$('#destroy').click(
									function() {
										$('#reportrange').data(
												'daterangepicker').remove();
									});
						});
	</script>
	<!-- /bootstrap-daterangepicker -->

	<!-- gauge.js -->
	<script>
		var opts = {
			lines : 12,
			angle : 0,
			lineWidth : 0.4,
			pointer : {
				length : 0.75,
				strokeWidth : 0.042,
				color : '#1D212A'
			},
			limitMax : 'false',
			colorStart : '#1ABC9C',
			colorStop : '#1ABC9C',
			strokeColor : '#F0F3F3',
			generateGradient : true
		};
		var target = document.getElementById('foo'), gauge = new Gauge(target)
				.setOptions(opts);

		gauge.maxValue = 6000;
		gauge.animationSpeed = 32;
		gauge.set(3200);
		gauge.setTextField(document.getElementById("gauge-text"));
	</script>
	<!-- /gauge.js -->
</body>

</html>