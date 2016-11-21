<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>

<html>
<head>
<title>Welcome to Teamphony</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="resources/teamPage/css/main.css" />

<style type="text/css">
.date {
	height: 100px;
	width: 100px;
}

table tr td {
	text-align: left;
	vertical-align: top;
}

.red {
	color: red;
}

.blue {
	color: blue;
}
</style>

</head>
<body>

	<!-- Header -->
	<section id="header">
		<header>
			<span class="image avatar"> 
			<img src="${member.imagePath}" alt="사진없음" width="90" height="110"/> 
			</span>
			<h1 id="logo">${member.id}</h1>
			<p>${member.alias}</p>
		</header>
		<nav id="nav">
			<ul>
				<li><a href="#one" class="active">일정</a></li>
				<li><a href="#two">게시판</a></li>
				<li><a href="#three">과제</a></li>
				<li><a href="#four">팀관리</a></li>
				<li><a href="#four">장소정보</a></li>
			</ul>
		</nav>

	</section>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one">

				<table border="3" style="width: 780px">

					<h1>2016.10 October</h1>
					<a href="InsertScheduleForm.jsp"> <input type="button"
						value="일정등록">
					</a>
					<colgroup>
						<col width="110px" />
						<col width="110px" />
						<col width="110px" />
						<col width="110px" />
						<col width="110px" />
						<col width="110px" />
						<col width="110px" />
					</colgroup>
					<tr>
						<th><h4>일</h4></th>
						<th><h4>월</h4></th>
						<th><h4>화</h4></th>
						<th><h4>수</h4></th>
						<th><h4>목</h4></th>
						<th><h4>금</h4></th>
						<th><h4>토</h4></th>
					</tr>
					<c:forEach step="1" begin="0" end="4" var="rowIdx">
						<tr class="date">
							<c:forEach step="1" begin="1" end="7" var="colIdx"
								varStatus="colSt">
								<c:set var="day" value="${(rowIdx*7) + colIdx }" />
								<c:choose>
									<c:when test="${day < 32 }">
										<td
											class="${colSt.last ? 'blue' : colSt.first ?  'red' : '' }">${day }
											<c:forEach items="${schedules }" var="schedule">
												<c:if test="${schedule.getDay() eq day }">
													<ul>
														<li><a
															href="detailSchedule.do?scheduleId=${schedule.scheduleId}">${schedule.title}</a></li>
													</ul>
												</c:if>
											</c:forEach>
										</td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>


			</section>
		</div>
	</div>

	<!-- Scripts -->
	<script src="resources/teamPage/js/jquery.min.js"></script>
	<script src="resources/teamPage/js/jquery.scrolly.min.js"></script>
	<script src="resources/teamPage/js/skel.min.js"></script>
	<script src="resources/teamPage/js/util.js"></script>
	<script src="resources/teamPage/js/main.js"></script>

</body>
</html>