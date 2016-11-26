
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부여 과제 리스트</title>
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
.starRating,
.starRating span{
    display:inline-block;
    height:14px;
    background:transparent url(<c:url value="/views/img/icoFiveStar.gif" />) no-repeat;
    overflow:hidden;
}
.starRating{
    width:79px;
    vertical-align:middle;
}
.starRating span{
    font-size:0;
    line-height:0;
    vertical-align:top;
    text-indent:-100px;
    *text-indent:0;
    background-position:0 -14px;
}
</style>
</head>
<body>
<div>

</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1>Assignment List</h1>
				<div align="right">
					<form action="searchByName.do">
						<input name="musicName" type="text" placeholder="검색어를 입력 하세요"
							value=""> <input class="btn btn-xs btn-default"
							type="submit" value="검색">
					</form>
				</div>
				<table class="table table-hover table-condensed" text-align:center;>
					<colgroup>
						<col width="100" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
					</colgroup>
					<thead>
						<tr>
							<th>순번ssss</th>
							<th>제목</th>
							<th>제출자</th>
							<th>제출기한</th>
							<th>평점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="task" varStatus="sts">
							<tr>
								<td>${sts.count }</td>
								<td><a href="${pageContext.request.contextPath}/assignment/searchByAssignmentId.do?taskId=${task.taskId }">${task.title }</a></td>
								<td></td>
								<td><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.deadline }"/></td>
								<td><p><span class="starRating">
								<%-- <span style="width:${task.pointStar }%">${task.point }점</span></span></p> --%>
								<span style="width:${task.getPointStar()}%">${task.point }점</span></span></p>
								</td>
								<%-- <td>${task.meberList.meber.id }제출자</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>