
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부여 과제 리스트</title>
<link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../../resources/css/style.css" rel="stylesheet">
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
				<h1>Assignment List</h1>
				<div align="right">
					<form action="searchByName.do">
						<input name="musicName" type="text" placeholder="검색어를 입력 하세요"
							value=""> <input class="btn btn-xs btn-default"
							type="submit" value="검색">
					</form>
				</div>
				<table class="table table-hover table-condensed">
					<colgroup>
						<col width="100" align="center">
						<col width="100" align="center">
						<col width="100" align="center">
						<col width="100" align="center">
						<col width="100" align="center">
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>제출자</th>
							<th>제출기한</th>
						</tr>
					</thead>
					<tbody>
						<table>
							<tr>
								<td>
									<ul>
										<li style="float: left; width: 90px;">${sts.count }번호</li>
										<a href="assignmentDetail.do?taskId=${task.id }"><li
											style="float: left; width: 90px;">${task.title }제목</li></a>
										<li style="float: left; width: 90px;">${task.meberList.meber.id }제출자</li>
										<li style="float: left; width: 90px;">${task.deadline }제출기한</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td>
									<a href=""><input class="btn" type="reset" value="이전 단계"></a> 
									<a href="assignmentRegister.do ">
									<input class="btn btn-success" type="submit" value="부여과제 등록"></a>
								</td>
							</tr>
						</table>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>