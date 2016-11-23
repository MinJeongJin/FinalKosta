<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출 과제 수정</title>
<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../../resources/css/style.css" rel="stylesheet">
<script src="../../../resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="../../../resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="assignmentList.do">과제리스트 돌아가기</a>
	<h3>부여 과제 수정</h3>

	<br>
	<form action="taskModify.do" method="post">
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">

			</colgroup>
			<tr>
				<th>제목</th>
				<td><input id="assignmetTitle" name="assignmetTitle"
					class="form-control" type="text" value="" placeholder="${task.tilte } 입력된 제목"></td>
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
					<label for="date" id="startDay" name="startDay">시작 날짜 
					<label for="time" id="startHour" name="startHour">시작 시간 - 
					<label for="date" id="endDay" name="endDay">종료 날짜
					<label for="time" id="endHour" name="endHour">종료 시간 
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="assignmentContents" name="assignmentContents"
						class="form-control" rows="7" placeholder="${task.contents } 입력된 내용"></textarea></td>
			</tr>
		</table>
		<br>
		<div align="center">
				<a href="assignmentList.do"><input class="btn" type="reset" value="취소"></a> 
				<a href="assignmentRegisterModigfy.do?memberId=${member.id} "><input class="btn btn-success" type="submit" value="완료"></a>
		</div>
	</form>
	<br>
</body>
</html>
