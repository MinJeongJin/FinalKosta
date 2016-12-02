<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부여 과제 상세</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
<style type="text/css">
#reset, #okay {
display: none;
}
</style>
</head>
<body>
	
	<a href="${pageContext.request.contextPath}/assignment/searchAll.do">과제리스트 돌아가기</a>
	<h3>부여 과제 상세</h3>

	<br>
<form action="${pageContext.request.contextPath}/assignment/revise.do" method="post">
	<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
		<tr>
			<th>제목</th>
				<td>
					<input id="title" name="title" class="form-control" type="text" value="${task.title }" readonly>
				</td>
		</tr>
		<tr>
			<th>제출자</th>
			<td>
				<ul>
					<li style="float: left; width: 70px;">이은채</li>
					<li style="float: left; width: 70px;">진민정</li>
					<li style="float: left; width: 70px;">현대경</li>
					<li style="float: left; width: 70px;">김수호</li>
					<li style="float: left; width: 70px;">윤영민</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th>제출 기한</th>
			<td>
				<input type="date" id="deadlineDay" name="deadlineDay" value="" hidden="true">
				<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.deadline }"/>
			</td>
			<td>
				<input type="date" id="deadlineHour" name="deadlineHour" value="" hidden="true">
			</td>
		</tr>
		<tr>
			<th>평가 기간</th>
			<td>
				<input type="date" id="evalDayStart" name="evalDayStart" value=""  hidden="true">
				<input type="time" id="evalHourStart" name="evalHourStart" value="" hidden="true">
				시작: 
				<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.evaluationPeriodStart }"/>
			</td>
		</tr>
		<tr>
			<th></th>
			<td>
				<input type="date" id="evalDayEnd" name="evalDayEnd" value="" hidden="true">
				<input type="time" id="evalHourEnd" name="evalHourEnd" value="" hidden="true">
				종료: 
				<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.evaluationPeriodEnd }"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
				<td>
					<textarea id="contents" name="contents" class="form-control" rows="7" readonly>${task.contents }</textarea>
				</td>
		</tr>
	</table>
		<br>
			<div align="center">
				<input id="reset" class="btn" type="reset" value="취소" > 
				<input id="okay" class="btn btn-success" type="submit" value="저장" >
			</div>	
</form>
	<br>
	<div align="center">
	<a href="#" onclick="revise_click();return false;" class="btn btn-success">수정</a>
	<a class="btn btn-success"  href="${pageContext.request.contextPath}/assignment/erase.do?taskId=103">삭제</a>
	<a class="btn btn-success"  href="${pageContext.request.contextPath}/assignment/evaluate.do?taskId=${task.taskId}">평가</a>
	</div>
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	function revise_click() {
		$('#title, #contents').attr('readonly',false);

		$('#reset, #okay').show();
		 document.getElementById(deadlineDay).style.display ='block';
		
		/* $('#deadlineDay, #deadlineHour, #evalDayStart, #evalHourStart, #evalDayEnd, #evalHourEnd,').hi; */
	}
</script>
</body>
















</html>
