<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Teamphony</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome cdn-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/teamStyle.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script
	src="${pageContext.request.contextPath}/resources/js/teamScript.min.js"></script>



<style type="text/css">
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
</body>

</html>