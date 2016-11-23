<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부여 과제 상세</title>
<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../../resources/css/style.css" rel="stylesheet">
<script src="../../../resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="../../../resources/js/schedule/schedule.js"></script>
</head>
<body>
	<input id="taskId" name="taskId" type="hidden" value="">
	<a href="assignmentList.do">과제리스트 돌아가기</a>
	<h3>부여 과제 상세</h3>

	<br>
	<form>
		<table class="table">
			<colgroup>
				<col width="150">
				<col width="*">

			</colgroup>
			<tr>
				<th>제목</th>
				<td><label for="assignmetTitle" name="assignmetTitle"
					class="form-control"  >${task.title } 제목입니다.</label></td>
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
					<label for="date" id="startDay" name="startDay">시작 날짜 
					<label for="time" id="startHour" name="startHour">시작 시간 - 
					<label for="date" id="endDay" name="endDay">종료 날짜
					<label for="time" id="endHour" name="endHour">종료 시간 
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><label for="assignmentContents" name="assignmentContents"
						class="form-control" rows="7" >${task.contents } 내용 입니다.</label></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<a href="assignmentModify.do?taskId=${task.id}"><input class="btn" type="reset" value="수정"></a> 
			<a href="assignmentErase.do?taskId=${task.id} "><input class="btn btn-success" type="submit" value="삭제"></a>
		</div>
	</form>
	<br>
</body>
</html>
