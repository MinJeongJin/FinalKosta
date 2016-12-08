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
				<td>
					<input id="title" name="title" class="form-control" type="text" value="" placeholder="${task.title } ">
					<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
				</td>
			</tr>
			<tr style="horizontal-align: left;">
				<th>제출자</th>
					<td>
						<h6 style="color: blue;">
							<c:forEach items="${task.memberIdList }" var="memberId" varStatus="sts">
								${memberId }
							</c:forEach>
						</h6>
					</td>
			</tr>
			<tr>		
			<th></th>
				<c:forEach items="${task.memberList }" var="member">
					<td style="float: left; width: 70px;">
						<input type="checkbox" name="memberIdList" class="form-control" style="width: 20px; margin: 0px;" value="${member.memberId }" >
						${member.memberId }
					</td>
				</c:forEach>
			</tr>
			<tr>
				<th>제출 기한</th>
				<td>
					<h6 style="color: red"> 
						<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.deadline }"/><br>
					</h6> 
						<input type="date" min="" id="deadlineDay" name="deadlineDay" value= "">
						<input type="time" id="deadlineHour" name="deadlineHour" value= "">  
				</td>
			</tr>
			<tr>
				<th>평가 기간</th>
				<td>
					<h6 style="color: red"> 
						<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.evaluationPeriodStart }"/>-
						<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.evaluationPeriodEnd }"/>
					</h6> 
						<input type="date" min="" id="evalDayStart" name="evalDayStart">
						<input type="time" id="evalHourStart" name="evalHourStart" >-  
						<input type="date" min="" id="evalDayEnd" name="evalDayEnd">
						<input type="time" id="evalHourEnd" name="evalHourEnd">
				</td>
			</tr>
			<tr>
				<th>내용</th>
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
	<br>
</body>
</html>
