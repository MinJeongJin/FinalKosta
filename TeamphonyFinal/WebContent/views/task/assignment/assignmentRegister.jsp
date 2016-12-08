<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과제 부여</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="${pageContext.request.contextPath}/assignment/searchAll.do">과제리스트 돌아가기</a>
	<h3>과제 부여</h3>

	<br>
	<form action="${pageContext.request.contextPath}/assignment/create.do" method="post">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">

			</colgroup>
			<tr>
				<th>제목</th>
				<td>
					<input id="title" name="title" class="form-control" type="text" value="" placeholder="제목을 입력하세요.">
				</td>
			</tr>
			<tr style="horizontal-align: left;">
				<th>제출자</th>
					<c:forEach items="${memberList }" var="member">
						<td style="float: left; width: 70px;">
								<input type="checkbox" name="memberIdList" class="form-control" style="width: 20px; margin: 0px;" value="${member.memberId }" >
								${member.memberId }
						</td>
					</c:forEach>
			</tr>
			<tr>
				<th>제출 기한</th>
				<td>
					<input type="date" id="deadlineDay" name="deadlineDay"> 
					<input type="time" id="deadlineHour" name="deadlineHour"> 
					
				</td>
			</tr>
			<tr>
				<th>평가 기한</th>
				<td>
					<input type="date" id="evalDayStart" name="evalDayStart"> 
					<input type="time" id="evalHourStart" name="evalHourStart">-
					<input type="date" id="evalDayEnd" name="evalDayEnd"> 
					<input type="time" id="evalHourEnd" name="evalHourEnd"> 
					
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
					<td>
						<textarea id="contents" name="contents" class="form-control" rows="7" placeholder="부여할 과제의 내용을 입력하세요.">
						</textarea>
						<input type="hidden" name="flag" value="0"/>
					</td>
			</tr>
		</table>
		<br>
		<div align="center">
			<a href="assignmentList.do"><input class="btn" type="reset" value="취소"></a> 
			<input class="btn btn-success" type="submit" value="저장">
		</div>
	</form>
	<br>
</body>
</html>
