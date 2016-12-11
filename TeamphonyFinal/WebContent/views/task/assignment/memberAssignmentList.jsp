
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>멤버의 부여받은 과제 리스트</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<style type="text/css">
body {
	padding: 50px;
}

h1 {
	font-weight: bold;
	color: #A0B0DB;
}

.ranking {
	text-align: center;
	font-size: 28pt;
}

.spanTitle {
	font-size: 18pt;
	font-weight: bold;
	margin-right: 10px;
}

.pAlbum {
	color: gray;
	margin-left: 5px;
}

.imgAlbum {
	width: 80px;
	height: 80px;
	margin-right: 10px;
}

.btnPlay {
	margin-top: 40%
}

/* Star Rating */
.starRating, .starRating span {
	display: inline-block;
	height: 14px;
	background: transparent
		url(< c : url value = "/views/img/icoFiveStar.gif"/ >) no-repeat;
	overflow: hidden;
}

.starRating {
	width: 79px;
	vertical-align: middle;
}

.starRating span {
	font-size: 0;
	line-height: 0;
	vertical-align: top;
	text-indent: -100px;
	*text-indent: 0;
	background-position: 0 -14px;
}
</style>
</head>
<body>
<div>

</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1>${memberId } 님의 Assignment List</h1>
				<div align="right">
					<form action="${pageContext.request.contextPath}/assignment/searchByMemberId.do" method="post">
						<input name="memberId" id="memberId" type="text" class="btn btn-xs btn-default" value="" placeholder="팀원 아이디를 입력 하세요"/>
						<input type="submit" class="btn btn-success" name="searchByMemberId" value="검색"/>
					</form>
				</div>
				<table class="table table-hover table-condensed" text-align:center;>
					<colgroup>
						<col width="100" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>제출기한</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="task" varStatus="sts">
							<c:if test="${task.flag eq 0 }"  >
								<tr>
								<td>${sts.count }</td>
								<td><a href="${pageContext.request.contextPath}/assignment/searchByTaskId.do?taskId=${task.taskId }">${task.title }</a></td>
								<td>${task.deadline }</td>
								<td>
									<a href="${pageContext.request.contextPath}/views/task/submission/submissionRegister.jsp?AssignmentTitle=${task.title }">
									<input class="btn btn-success" type="button" value="과제 제출 하기">
									</a>
								</td>
								</tr>
							</c:if>
						</c:forEach>
							<tr>
							<th></th>
								<td></td>
								<td>																	
									<a href="${pageContext.request.contextPath}/assignment/searchAll.do">
										<input class="btn" type="button" value="부여 과제 리스트">
									</a> 
									<a href="${pageContext.request.contextPath}/submission/searchAll.do">
										<input class="btn" type="button" value="제출 과제 리스트">
									</a> 
								</td>
							</tr>
					</tbody>
				</table>
				
<h1>${memberId } 님의 Submission List</h1>
	<table class="table table-hover table-condensed" text-align:center;>
		<colgroup>
			<col width="100" align="center">
			<col width="400" align="center">
			<col width="400" align="center">
			<col width="400" align="center">
		</colgroup>
		<thead>
			<tr>
				<th>순번</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="task" varStatus="sts">
				<c:if test="${task.flag eq 1 }"  >
					<tr>
					<td>${sts.count }</td>
					<td><a href="${pageContext.request.contextPath}/submission/searchByTaskId.do?taskId=${task.taskId }">${task.title }</a></td>
					<td>${task.deadline }</td>
					<td>
						<a href="${pageContext.request.contextPath}/submission/revise.do?taskId=${task.taskId }&memberId=${memberId }">
							<input class="btn btn-success" type="button" value="수정">
						</a>
						<a href="${pageContext.request.contextPath}/submission/erase.do?taskId=${task.taskId }&flag=${task.flag }">
							<input class="btn btn-success" type="button" value="삭제">
						</a>
					</td>
					</tr>
				</c:if>
			</c:forEach>
				<tr>
				<th></th>
					<td></td>
					<td>																	
						<a href="${pageContext.request.contextPath}/assignment/searchAll.do">
							<input class="btn" type="button" value="부여 과제 리스트">
						</a> 
						<a href="${pageContext.request.contextPath}/submission/searchAll.do">
							<input class="btn" type="button" value="제출 과제 리스트">
						</a> 
					</td>
				</tr>
		</tbody>
	</table>
</html>