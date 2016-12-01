<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출 과제 평가</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="${pageContext.request.contextPath}/assignment/searchAll.do">과제리스트 돌아가기</a>
	<h3>제출 과제 평가</h3>

	<br>

	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
		<tr>
			<th>제목</th>
			<td><label for="title" name="title" class="form-control">${task.title }
			</label></td>
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
			<td><label for="deadline" id="deadline" name="deadline">${task.deadline}
		</tr>
		<tr>
			<th>내용</th>
			<td><label for="contents" name="contents" class="form-control"
				rows="7">${task.contents }</label></td>
		</tr>
	</table>
	<br>
	<div align="center">
		<a
			href="${pageContext.request.contextPath}/assignment/revise.do?taskId=15" />
		<input class="btn" type="submit" value="평가완료"></input> 
	</div>

	</br>
</body>
</html>
