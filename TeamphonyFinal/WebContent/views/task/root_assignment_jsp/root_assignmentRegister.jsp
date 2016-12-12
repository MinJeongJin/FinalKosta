
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

<style>
a[name=aInBtn] {
	text-decoration: none;
}

a[name=aInBtn]:hover, a[name=aInBtn]:link, a[name=aInBtn]:active, a[name=aInBtn]:visited
	{
	text-decoration: none;
	color: white;
}
</style>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

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
<!--  Start Page  -->






		<form action="${pageContext.request.contextPath}/assignment/create.do"
			method="post">
			<table class="table">
				<colgroup>
					<col width="150">
					<col width="*">

				</colgroup>
				<tr>
					<th>제목</th>
					<td><input id="title" name="title" class="form-control"
						type="text" value="" placeholder="제목을 입력하세요."></td>
				</tr>
				<tr style="horizontal-align: left;">
					<th>제출자</th>
					<c:forEach items="${memberList }" var="member">
						<td style="float: left; width: 70px;"><input type="checkbox"
							name="memberIdList" class="form-control"
							style="width: 20px; margin: 0px;" value="${member.memberId }">
							${member.memberId }</td>
					</c:forEach>
				</tr>
				<tr>
					<th>제출 기한</th>
					<td><input type="date" id="deadlineDay" name="deadlineDay">
						<input type="time" id="deadlineHour" name="deadlineHour">

					</td>
				</tr>
				<tr>
					<th>평가 기한</th>
					<td><input type="date" id="evalDayStart" name="evalDayStart">
						<input type="time" id="evalHourStart" name="evalHourStart">-
						<input type="date" id="evalDayEnd" name="evalDayEnd"> <input
						type="time" id="evalHourEnd" name="evalHourEnd"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea id="contents" name="contents"
							class="form-control" rows="7" placeholder="부여할 과제의 내용을 입력하세요.">
						</textarea> <input type="hidden" name="flag" value="0" /></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<a href="assignmentList.do"><input class="btn" type="reset"
					value="취소"></a> <input class="btn btn-success" type="submit"
					value="저장">
			</div>
		</form>


		<div class="w3-black w3-center w3-padding-24 w3-card-12">
			Designed by <a href="http://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">Suho</a>
		</div>
	</div>
	<!-- End page content -->

</body>

</html>