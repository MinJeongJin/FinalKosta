<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과제 제출</title>
<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../../resources/css/style.css" rel="stylesheet">
<script src="../../../resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="../../../resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="${pageContext.request.contextPath}/submission/searchAll.do">과제리스트 돌아가기</a>
	<h3>과제 제출</h3>

	<br>
	<form action="${pageContext.request.contextPath}/submission/create.do"
		method="post" enctype="multipart/form-data">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input id="title" name="title"
					class="form-control" type="text" value="" placeholder="제목을 입력하세요."></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="contents" name="contents"
						class="form-control" rows="7" placeholder="부여할 과제의 내용을 입력하세요."></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input style="width: 250px" ; type="file" name="attchFile" class="form-control">
					<input type="hidden" name="flag" value="1" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px" ; type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px" ; type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px" ; type="file" name="attchFile" class="form-control">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input style="width: 250px" ; type="file" name="attchFile" class="form-control">
				</td>
			</tr>
	
			
		</table>
		<div align="center">
			<a href="${pageContext.request.contextPath}/submission/searchAll.do"><input class="btn" type="button" value="취소"></a> 
			<input class="btn btn-success" type="submit" value="저장">
		</div>
		</form>
</body>
</html>
