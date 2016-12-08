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

#check {
	display: none;
}

#imagView{
	dispaly: none;
}

#videoView {
	dispaly: none;
}

#fileView {
	dispaly: none;
}

.evaluationProfile{
	witdh : 240px;
	height : 160px;
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
							<span>${member.memberId }</span>
							<h2>${member.alias }</h2>
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
							<li class="">
								<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
									<img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="">${member.alias}
									<span class=" fa fa-angle-down"></span>
								</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="${pageContext.request.contextPath}/member/logout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="container" id="teamManage">
					<h2 id="menuTitle">평가 회원 리스트</h2>
					<table>
						<colgroup>
							<col width="100" align="center">
							<col width="100" align="center">
							<col width="100" align="center">
							<col width="100" align="center">
						</colgroup>
						<thead>
							<tr>
								<td>프로필</td>
								<td>아이디</td>
								<td>별명</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${memberList}" var="evaluationMember" varStatus="status" >
								<c:if test="${evaluationMember.memberId ne member.memberId }">
									<tr>
										<td><img class="evaluationProfile" alt="사진 없음" src="${evaluationMember.imagePath}"></td>
										<td>${evaluationMember.memberId}</td>
										<td>${evaluationMember.alias}</td>
										<td><a href="${pageContext.request.contextPath}/member/evaluation.do?memberId=${evaluationMember.memberId}"  class="btn btn-success btn-lg">평가하기</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>