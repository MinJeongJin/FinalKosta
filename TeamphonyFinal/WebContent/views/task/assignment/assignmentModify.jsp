
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
				<b>부여과제 수정</b>
			</h1>
			<h4>부여과제 정보를 확인하고 관리해 보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>
<!--  Start Page  -->



<div style="padding: 50px"> 
	<div style="padding-left: 90px"> 
		<div style="padding-right: 180px"> 
			<div style="padding-bottom: 50px" align="right">
				<div class="w3-container">
		<form action="${pageContext.request.contextPath}/assignment/revise.do" method="post">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">
			</colgroup>
			<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
				<th>
					<label class="w3-label w3-validate" style="color: #050505">제목</label>
				</th>
				<td>
					<input id="title" name="title" class="w3-input" type="text" value="" placeholder="${task.title } ">
					<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
				</td>
			</tr>
			<tr class="w3-hover w3-padding w3-card-2 " style="horizontal-align: left;">
				<th>
					<label class="w3-label w3-validate" style="color: #050505">제출자</label>
				</th>
					<td>
						<h6 style="color: black">	
							<c:forEach items="${task.memberIdList }" var="memberId" varStatus="sts">
								${memberId }
							</c:forEach>
						</h6>
					</td>
			</tr>
			<tr class="w3-hover-light-grey w3-padding w3-card-2 ">		
			<th></th>
				<c:forEach items="${task.memberList }" var="member">
					<td style="float: left; width: 70px;">
						<input type="checkbox" name="memberIdList" class="w3-check:checked+.w3-validate" style="width: 20px; margin: 0px;" value="${member.memberId }" >
						${member.memberId }
					</td>
				</c:forEach>
			</tr>
			<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
				<th>
					<label class="w3-label w3-validate" style="color: #050505">제출 기한</label>
				</th>
				<td>
					<label class="w3-label w3-validate" style="color: black">
						${task.deadline }
					</label><br> 
						<input type="date" min="" id="deadlineDay" name="deadlineDay" value= "">
						<input type="time" id="deadlineHour" name="deadlineHour" value= "">  
				</td>
			</tr>
			<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
				<th>
					<label class="w3-label w3-validate" style="color: #050505">평가 기간</label>
				</th>
				<td>
					<label class="w3-label w3-validate" style="color: black">
						${task.evaluationPeriodStart }-
						${task.evaluationPeriodEnd }
					</label><br> 
					
						<input type="date" min="" id="evalDayStart" name="evalDayStart">
						<input type="time" id="evalHourStart" name="evalHourStart" >-  
						<input type="date" min="" id="evalDayEnd" name="evalDayEnd">
						<input type="time" id="evalHourEnd" name="evalHourEnd">
				</td>
			</tr>
			<tr class="w3-hover-light-gray w3-padding w3-card-2 ">
				<th>
					<label class="w3-label w3-validate" style="color: #050505">내용</label>
				</th>
					<td>
						<textarea id="contents" name="contents" class="form-control" rows="7" placeholder="${task.contents } "></textarea>
					</td>
			</tr>
		</table>
		<br>
		<div align="center">
				<a href="assignmentList.do"><input class="btn" type="reset" value="취소"></a> 
				<input class="btn btn-success" type="submit" value="완료">
		</div>
	</form>



			</div>
		</div>
	</div>
</div>
	<!-- End page content -->

</body>

</html>