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

#okay, #reset {
	display: none;
}
</style>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<body class="w3-light-grey w3-content" style="max-width: 1600px;"
	onload="showInput();">

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
				<b>평가 회원 리스트</b>
			</h1>
			<h4>평가할 팀원을 선택해주세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>


		<div class="w3-container w3-padding-32">
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
					<c:forEach items="${memberList}" var="evaluationMember"
						varStatus="status">
						<c:if test="${evaluationMember.memberId ne member.memberId }">
							<tr>
								<td>
									<c:if test="${evaluationMember.imagePath eq 'pass'}">
										<img alt="사진 없음" src="${pageContext.request.contextPath}/resources/images/default.png" style="width: 65px;">
									</c:if>
									<c:if test="${evaluationMember.imagePath ne 'pass'}">
										<img class="evaluationProfile" alt="사진 없음" src="${pageContext.request.contextPath}/resources/images/${evaluationMember.memberId}/${evaluationMember.imagePath}" style="width: 65px;">
									</c:if>
								</td>
								<td>${evaluationMember.memberId}</td>
								<td>${evaluationMember.alias}</td>
								<td><a
									href="${pageContext.request.contextPath}/member/evaluation.do?memberId=${evaluationMember.memberId}"
									class="btn btn-success">평가하기</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- End page content -->
</body>

</html>