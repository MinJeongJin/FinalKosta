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
	<a href="submissionList.do">과제리스트 돌아가기</a>
	<h3>과제 제출</h3>

	<br>
	<form action="submissionRegister.do" method="post">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">
			</colgroup>

			<form action="" method="post" enctype="multipart/form-data"
				name="filePath">
				<tr>
					<input type="file" name=file>
				</tr>
			</form>
			<tr>
				<th>제목</th>
				<td><input id="submissionTitle" name="submissionTitle"
					class="form-control" type="text" value="" placeholder="제목을 입력하세요."></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="submissionContents" name="submissionContents"
						class="form-control" rows="7" placeholder="부여할 과제의 내용을 입력하세요."></textarea></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<a href="submissionList.do"><input class="btn" type="reset"
				value="취소"></a> <a
				href="assignmentRegister.do?memberId=${member.id} "><input
				class="btn btn-success" type="submit" value="저장"></a>
		</div>
	</form>
	<br>
</body>
</html>
