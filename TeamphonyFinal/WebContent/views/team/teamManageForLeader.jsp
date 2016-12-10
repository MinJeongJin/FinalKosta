<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Teamphony</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome cdn-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


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


<script type="text/javascript">
	var reviseInfo = function myFunction() {

		document.getElementById("teamName").readOnly = false;
		document.getElementById("cycle").readOnly = false;
		document.getElementById("endDate").readOnly = false;

		document.getElementById("reviseBtn").hidden = true;
		document.getElementById("removeBtn").hidden = true;

		document.getElementById("confirmBtn").hidden = false;
		document.getElementById("cancelBtn").hidden = false;

	}

	var getMinDate = function() {

		var date = new Date();
		var year = date.getFullYear(); // 년도
		var month = (1 + date.getMonth()); // 월
		month = month >= 10 ? month : '0' + month; // 월 두자리로 변경 작업
		var day = date.getDate(); // 일 
		day = day >= 10 ? day : '0' + day; //일 두자리로 변경 작업

		document.getElementById('endDate').min = year + '-' + month + '-' + day;// yyyy-mm-dd format 변경
	}

	window.onload = function() {

		getMinDate();
	}
</script>

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
					<%@ include file="/views/common/sideMenu.jspf"%>
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

				<div id="teamDetail">

					<h1 id="menuTitle">팀 관리</h1>

					<form method="POST"
						action="${pageContext.request.contextPath}/team/revise.do">

						<div class="form-group">
							<label for="teamName">팀 명:</label> <input type="text"
								value="${team.name}" class="form-control input-lg" id="teamName"
								name="name" maxlength="15" readonly required>
						</div>


						<div class="form-group">
							<label for="cycle">팀원 평가주기:</label> <input type="number"
								value="${team.cycle}" class="form-control input-lg" id="cycle"
								min="0" max="3" name="cycle" readonly required>
						</div>


						<div class="form-group">
							<label for="endDate">평가 만료기간:</label> <input type="date"
								value="${team.endDate}" class="form-control input-lg"
								name="endDate" id="endDate" readonly required>
						</div>
						
						
						<button type="submit" class="btn-primary btn-lg col-xs-3"
						id="confirmBtn" style="margin-left: 5%; margin-right: 5%;" hidden>확인</button>

					<a href="${pageContext.request.contextPath}/team/search.do">
						<button class="btn-primary btn-lg col-xs-3" id="cancelBtn" hidden>취소</button>
					</a>

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


					<button class="btn-primary btn-lg col-xs-3" id="reviseBtn"
						style="margin-left: 5%; margin-right: 5%;" onclick="reviseInfo();">수정</button>

					<a href="${pageContext.request.contextPath}/team/erase.do">
						<button class="btn-primary btn-lg col-xs-3" id="removeBtn">
							삭제</button>
					</a>

				</div>
				<!-- /page content -->



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

				<!-- footer content -->
				<footer> </footer>
				<!-- /footer content -->

			</div>
		</div>
	</div>
</body>

</html>