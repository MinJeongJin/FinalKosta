<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>일정 상세 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<style type="text/css">
#reset, #okay {
display: none;
}
</style>

</head>


<body>
	<input id="scheduleId" name="scheduleId" type="hidden" value="${schedule.scheduleId}">
	<a href="${pageContext.request.contextPath}/schedule/calendar.do">달력으로 돌아가기</a>
	<h3>일정상세</h3>

	<form action="${pageContext.request.contextPath}/schedule/revise.do?scheduleId=${schedule.scheduleId}" method="post">
	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
        <a href="${pageContext.request.contextPath}/schedule/erase.do?scheduleId=${schedule.scheduleId}" class="glyphicon glyphicon-trash pull-right" style="padding:10px">삭제</a>
		<a onclick="bt_revise_click();" id="revise" class="glyphicon glyphicon-cog pull-right" style="padding:10px">수정</a>
		<tr>
			<th>제목</th>
			<td><input id="title" name="title"
				class="form-control" type="text" value="${schedule.title }" readonly></td>
		</tr>
		<tr>
			<th>장소</th>
			<td><input id="place" name="place"
				class="form-control" type="text" value="${schedule.place }" readonly></td>
		</tr>
		<tr>
			<th>일시</th>
				<td>
				<input type="date" id="startDay" name="startDay" value="${startDay }" readonly>
				<input type="time" id="startHour" name="startHour" value="${startHour }" readonly>
				-
				<input type="date" id="endDay" name="endDay" value="${endDay }" readonly>
				<input type="time" id="endHour" name="endHour" value="${endHour }" readonly>
				</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="contents" name="contents"
					class="form-control" rows="7" readonly>${schedule.contents }</textarea></td>
		</tr>
	
	</table>
	<br>
	<div align="center">
		<input id="reset" class="btn" type="reset" value="취소" > 
		<input id="okay" class="btn btn-success" type="submit"value="저장" >
	</div>
	</form>
	
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	<!-- revise button click event -->
	function bt_revise_click(){
		$('#title, #place, #startDay, #startHour, #endDay, #endHour, #contents').attr('readonly',false);
		$('#reset, #okay').show();
	}
	</script>
</body>
</html>

