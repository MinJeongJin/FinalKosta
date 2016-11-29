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
</head>

<body>
	<input id="scheduleId" name="scheduleId" type="hidden"
		value="${schedule.scheduleId}">
	<h3>일정상세</h3>

	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
        <a href="${pageContext.request.contextPath}/article/remove.do?articleId=${article.articleId}&boardId=${article.boardId}" class="glyphicon glyphicon-trash pull-right" style="padding:10px">삭제</a>
		<a href="${pageContext.request.contextPath}/article/modify.do?articleId=${article.articleId}&boardId=${article.boardId}" class="glyphicon glyphicon-cog pull-right" style="padding:10px">수정</a>
		<tr>
			<th>제목</th>
			<td><input id="title" name="title"
				class="form-control" type="text" value="${schedule.title }" readonly></td>
		</tr>
		<tr>
			<th>장소</th>
			<td><input id="place" name=""place""
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

</body>
</html>

