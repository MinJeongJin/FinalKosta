<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출 과제 리스트</title>
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
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1>Submission List</h1>
				<div align="right">
					<form action="searchByName.do">
						<input name="musicName" type="text" placeholder="검색어를 입력 하세요"
							value=""> <input class="btn btn-xs btn-default"
							type="submit" value="검색">
					</form>
				</div>
				<table class="table table-hover table-condensed" >
					<colgroup>
						<col width="100" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
						<col width="400" align="center">
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>제출자</th>
							<th>제출기한</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					<tbody >
						<c:forEach items="${taskList }" var="task" varStatus="sts">
									<tr>
										<td >
											${sts.count }
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/submission/searchByTaskId.do?taskId=122">${task.title }</a>
										</td>
										<td>
											제출자 미구현
										</td>
										<td>
											<fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${task.deadline }"/>
										</td>
										<td>
											<c:forEach items="${task.taskFileList}" var="taskFile">
											${taskFile.filePath}<br>
											</c:forEach>
										</td>
									</tr>
						</c:forEach>
									<tr>
										<td>
											<a href=""><input class="btn" type="reset" value="이전 단계"></a> 
											<a href="assignmentRegister.do ">
											<input class="btn btn-success" type="submit" value="부여과제 등록"></a>
										</td>
									</tr>
					</tbody>
				</table> 
			</div>
		</div>
	</div>
</body>
</html>