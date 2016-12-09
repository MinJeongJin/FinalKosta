
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
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">


<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>


<script type="text/javascript">
	var reviseInfo = function() {

		document.getElementById("teamName").readOnly = false;
		document.getElementById("cycle").readOnly = false;
		document.getElementById("endDate").readOnly = false;

		document.getElementById("selectBtnGr").hidden = true;
		document.getElementById("reviseBtnGr").hidden = false;

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



<body class="w3-light-grey w3-content" style="max-width: 1600px;">







	<!-- modal -->
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

	<!-- /modal -->

	<!-- side bar -->
	<%@ include file="/views/common/sideBar.jspf"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-container w3-main" style="margin-left: 300px;">

		<!-- Header -->
		<header class="w3-container">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<h1>
				<b>팀 관리</b>
			</h1>
			<h4>팀 정보를 확인하고 관리해 보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>

		<div class="myContents">
			<form method="post"
				action="${pageContext.request.contextPath}/team/revise.do">

				<div class="w3-row">

					<p>
						<strong>팀명:</strong>
					</p>
					<input id="teamName" name="name" maxlength="15" type="text"
						value="${team.name}" class="w3-input w3-border" readonly required>

				</div>

				<div class="w3-row">

					<p>
						<strong>팀원 평가주기:</strong>
					</p>
					<input id="cycle" min="0" max="3" name="cycle" type="number"
						value="${team.cycle}" class="w3-input w3-border" readonly required>

				</div>

				<div class="w3-row">

					<p>
						<strong>평가 만료기간:</strong>
					</p>
					<input id="endDate" name="endDate" type="date"
						value="${team.endDate}" class="w3-input w3-border" readonly
						required>

				</div>

				<div class="w3-row">

					<div id="selectBtnGr" class="w3-right">
						<a href="${pageContext.request.contextPath}/team/erase.do"
							class="w3-btn w3-large"> 삭제 </a>
						<button type="button" class="w3-btn w3-large"
							onclick="reviseInfo();">수정</button>
					</div>

					<div id="reviseBtnGr" class="w3-right" hidden="true">


						<button type="submit" class="w3-btn w3-large">확인</button>
						<button class="w3-btn w3-large">
							<a href="${pageContext.request.contextPath}/team/search.do">
								취소 </a>
						</button>
						<!-- required 속성 지워주는 작업 필요 -->
					</div>

				</div>
			</form>

			<div class="w3-row">

				<p>
					<strong>팀원목록:</strong>
				</p>

				<ul class="w3-ul w3-card-4">

					<c:forEach items="${memberList}" var="member"
						varStatus="cntOfMembers">

						<li class="w3-padding-16"><img
							src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg"
							class="w3-left w3-circle w3-margin-right" style="width: 40px">
							<span class="w3-xlarge">${member.alias}</span> <br></li>

					</c:forEach>
				</ul>

			</div>

			<div class="w3-row">
				<button class="w3-btn-floating-large w3-right " data-toggle="modal"
					data-target="#myModal">+</button>


			</div>



		</div>

		<div class="w3-black w3-center w3-padding-24 w3-card-12">
			Designed by <a href="http://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">Suho</a>
		</div>
	</div>
	<!-- End page content -->

</body>

</html>