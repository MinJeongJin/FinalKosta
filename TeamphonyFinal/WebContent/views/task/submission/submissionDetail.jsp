<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출 과제 상세</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="submissionList.do">과제리스트 돌아가기</a>
	<h3>제출 과제 상세</h3>

	<br>
	<form>
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">

			</colgroup>
			<tr>
				<th>제목</th>
				<td><label for="title" name="title"
					class="form-control"  >${task.title }</label></td>
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
						<li style="float: left; width: 70px;">미구현</li>
						
					</ul>
				</td>
			</tr>
			<tr>
				<th>제출 기한</th>
					<td>
						<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.deadline }"/>
					</td>
			</tr>
			<tr>
				<th>내용</th>
					<td>
						<label for="submissionContents" name="submissionContents"
								class="form-control" rows="7" >${task.contents }
						</label>
					</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input style="width: 250px" ; type="file" name="attchFile" class="form-control">
					<input type="hidden" name="flag" value="1" />
				</td>
			</tr>
			
		</table>
		<br>
		<div align="center">
			<a class="btn btn-success"  href="${pageContext.request.contextPath}/submission/revise.do?taskId=15" >수정</a>
			<a class="btn btn-success"  href="${pageContext.request.contextPath}/submission/erase.do?taskId=${task.taskId} " >삭제</a>
			<a class="btn btn-success"  href="${pageContext.request.contextPath}/submission/evaluate.do?taskId=${task.taskId} " >평가</a>
		</div>
	</form>
	<br>
</body>
</html>
