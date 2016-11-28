<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당신이 속한 팀을 확인하세요</title>

<!-- Behavioral Meta Data -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<!-- CSS -->

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300'
	rel='stylesheet' type='text/css'>

<link href='https://fonts.googleapis.com/css?family=Pacifico'
	rel='stylesheet' type='text/css'>

<link
	href='${pageContext.request.contextPath}/resources/main/css/style.css'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



<link
	href='${pageContext.request.contextPath}/resources/css/teamGenerate.css'
	rel='stylesheet' type='text/css'>

<!-- CSS -->

</head>

<body>


	<!-- HEADER -->

	<div id="wrapper-header">
		<div id="main-header" class="object">

			<div class="logo">
				<h2>Teamphony</h2>
			</div>

			<div id="main_tip_search">
				<form>
					<input type="text" name="search" id="tip_search_input"
						list="search" autocomplete=off required placeholder="Team code">
				</form>
			</div>

		</div>
	</div>

	<!-- NAVBAR -->

	<div id="wrapper-navbar">
		<div class="navbar object">
			<div id="wrapper-sorting">
				<div class="recent object">로그아웃</div>
				<div class="recent object">마이페이지</div>
				<a class="recent object" href="#" data-toggle="modal"
					data-target="#myModal">팀 생성</a>
			</div>
		</div>
	</div>


	<!-- Modal -->

	<div class="container">


		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			
			<form action="${pageContext.request.contextPath}/team/create.do" method="post">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 class="modal-title">
							팀 생성
							</h4>
					</div>
					<div class="modal-body">
						<p>
							<input type="text" class="form-control" name="name" placeholder="팀 이름">
						</p>
						<p>
							<input type="number" class="form-control" name="cycle" placeholder="평가주기">
						</p>
						<p>
							<input type="date" class="form-control" name="endDate" placeholder="평가 만료기간">
						</p>
					</div>
					<div class="modal-footer">

						<button type="submit" class="btn btn-info btn-lg">생성</button>
						<button type="button" class="btn btn-info btn-lg">취소</button>
					</div>
				</div>

			</div>
			
			</form>
			
		</div>

	</div>

	<!-- Modal -->


	<!-- PORTFOLIO -->

	<div id="wrapper-container">

		<div class="container object">

			<div id="main-container-image">

				<section class="work">

					<c:forEach items="${teamList}" var="team" varStatus="teamStatus">

						<figure class="white">
							<a href="teamPage.do?teamCode=${team.code}">
								<div id="wrapper-part-info">
									<div class="part-info-image"></div>
									<div id="part-info">${team.name}</div>
								</div>
							</a>
						</figure>

					</c:forEach>


				</section>
			</div>
		</div>
	</div>
	<!-- SCRIPT -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/jquery.scrollTo.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/jquery.localScroll.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/jquery-animate-css-rotate-scale.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/fastclick.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/jquery.animate-colors-min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/jquery.animate-shadow-min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/main/js/main.js"></script>

	<!-- SCRIPT -->
</body>
</html>
