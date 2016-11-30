<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부여 과제 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="${pageContext.request.contextPath}/assignment/searchAll.do">과제리스트 돌아가기</a>
	<h3>부여 과제 수정</h3>

	<br>
	<form action="${pageContext.request.contextPath}/assignment/revise.do" method="post">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">

			</colgroup>
			<tr>
				<th>제목</th>
				<td><input id="title" name="title"
					class="form-control" type="text" value="" placeholder="${task.title } 입력된 제목"></td>
			</tr>
			<tr style="horizontal-align: left;">
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
					  
					<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.deadline }"/><br>
				</td>
			</tr>
			<tr>
			<th>수정 기한</th>
				<td>
					<input type="date" min="2016-02-01" id="deadlineDay" name="deadlineDay" value= "">
					<input type="time" id="deadlineHour" name="deadlineHour" value= "">  
				
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea id="contents" name="contents"
						class="form-control" rows="7" placeholder="${task.contents } 입력된 내용"></textarea></td>
			</tr>
		</table>
		<br>
		<div align="center">
				<a href="assignmentList.do"><input class="btn" type="reset" value="취소"></a> 
				<input class="btn btn-success" type="submit" value="완료">
		</div>
	</form>
	<br>
</body>
</html>
