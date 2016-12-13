<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출 과제 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
</head>
<body>
	<a class="btn btn-success" href="${pageContext.request.contextPath}/submission/searchAll.do">제출 과제 리스트</a>
	<h3>제출 과제 수정</h3>

	<br>
	<form action="${pageContext.request.contextPath}/submission/revise.do" method="post" enctype="multipart/form-data">
		<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">

			</colgroup>
			<tr>
				<th>제목</th>
				<td>
					<input id="title" name="title" class="form-control" type="text" value="" placeholder="${task.title }">
				</td>
			</tr>
			<tr>
				<th>내용</th>	
					<td>
						<textarea id="contents" name="contents" class="form-control" rows="7" placeholder="${task.contents }"></textarea>
					</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:forEach items="${task.taskFileList }" var="taskFile">
						${taskFile.filePath }<br>
					</c:forEach>
					<input type="hidden" id="flag" name="flag" value="${task.flag }"  />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<h6 style="color: red">**첨부파일은 최대 5개 입니다.</h6>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px"  type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px"  type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px"  type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px"  type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px"  type="file" name="attchFile" class="form-control">
				</td>
			</tr>
		</table>
		<br>
		<div align="center">
				<input class="btn" type="reset" value="취소">
				<input class="btn btn-success" type="submit" value="완료">
		</div>
	</form>
	<br>
</body>
</html>
