<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />

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
				<img src="${member.imagePath }" alt="사진없음" width="90" height="110" />
			</span>
			<h1 id="logo">${member.memberId}</h1>
			<p>${member.alias}</p>
		</header>
		<nav id="nav">
			<ul>
				<li><a href="#one" class="active">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/member/revise.do">회원 정보 수정</a></li>
				<li><a href="#three">팀 관리</a></li>
				<li><a href="${pageContext.request.contextPath}/member/delete.do">회원 탈퇴</a></li>
				<li><a href="">개발자</a></li>
			</ul>
		</nav>
	</section>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one">
				회원 수정 페이지!!!!
			</section>
		</div>
	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>