
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
				<b>과제 제출</b>
			</h1>
			<h4>제출과제 정보를 확인하고 관리해 보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>

<!--  Start Page  -->
	<div style="padding-top: 50px">  
		<form class="w3-container"  action="searchByName.do">
			<input name="memberId" id="memberId" class="btn btn-xs btn-default" type="text" placeholder="제출자를 입력 하세요" value=""> 
			<button name="searchByMemberId" class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-large">검색</button>
		</form>
	</div>
		<table >
			<colgroup>
				<col width="200" align="center">
				<col width="400" align="center">
				<col width="400" align="center">
				<col width="400" align="center">
				<col width="400" align="center">
				<col width="400" align="center">
				<col width="400" align="center">
			</colgroup>
			<thead>
				<tr>
					<th>순번</th>
					<th>부여과제</th>
					<th>제목</th>
					<th>제출자</th>
					<th>첨부파일</th>
					<th>평점</th>
					<th>평가여부</th>
					<th>평가횟수</th>
				</tr>
			</thead>
			<tbody >
				<c:forEach items="${taskList }" var="task" varStatus="sts">
					<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
						<td >
							${sts.count }
						</td>
						<td>
							${param.AssignmentTitle}
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/submission/searchByTaskId.do?taskId=${task.taskId}">${task.title }</a>
						</td>
						<td>
							<c:forEach items="${task.memberIdList }" var="memberId" varStatus="sts">
								${memberId }
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${task.taskFileList}" var="taskFile">
							${taskFile.filePath}<br>
							</c:forEach>
						</td>
						<td >
							<p>
							<span class="starRating">
								<span style="width:${task.getPointStar() }%">
							</span>
							</span>
								<fmt:formatNumber value="${task.getAverage() }" pattern=".00"/>
								 점
							</p>
						</td>
						<td>		
							<c:choose>
								<c:when test="${task.evaluated == 1 }">
									Y
								</c:when>
								<c:when test="${task.evaluated == 0 }">
									N
								</c:when>
							</c:choose>
						</td>
						<td align="right">
							${task.evaluationCnt } 회
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td align="right">
						<a href="${pageContext.request.contextPath}/assignment/searchAll.do">
							<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-medium">부여과제 리스트</button>
						</a> 
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/views/task/submission/submissionRegister.jsp ">
							<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-medium">제출과제 등록</button>
						</a>
					</td>
				</tr>
			</tbody>
		</table> 
	</div>
<script type="text/javascript">

var starRating = function(){
  var $star = $(".star-input"),
      $result = $star.find("output>b");
  $(document)
    .on("focusin", ".star-input>.input", function(){
    $(this).addClass("focus");
  })
    .on("focusout", ".star-input>.input", function(){
    var $this = $(this);
    setTimeout(function(){
      if($this.find(":focus").length === 0){
        $this.removeClass("focus");
      }
    }, 100);
  })
    .on("change", ".star-input :radio", function(){
    $result.text($(this).next().text());
  })
    .on("mouseover", ".star-input label", function(){
    $result.text($(this).text());
  })
    .on("mouseleave", ".star-input>.input", function(){
    var $checked = $star.find(":checked");
    if($checked.length === 0){
      $result.text("0");
    } else {
      $result.text($checked.next().text());
    }
  });
};
starRating();






</script>
































<!-- End page content -->

</body>

</html>