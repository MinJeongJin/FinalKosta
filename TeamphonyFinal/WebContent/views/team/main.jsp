<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<title>Welcome to Teamphony</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainCustomStyle.css">
<!-- /CSS -->

<!-- Script -->
<script
	src="${pageContext.request.contextPath}/resources/js/mainCustomScript.js">
	
</script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- /Script -->

</head>

<body class="w3-light-gray">

	<header id="mainHeader">
		<div class="w3-container">

			<ul class="w3-navbar w3-black w3-large w3-card-12 w3-padding-12">
				<li class="w3-navitem w3-tangerine">Teamphony</li>
				<li><a href="#myModal" data-toggle="modal">팀 생성</a></li>
				<li><a
					href="${pageContext.request.contextPath}/views/member/checkMember.jsp">마이페이지</a></li>
				<li><a href="#">로그아웃</a></li>

				<div class="w3-right" style="margin-right: 10px;">
					<li><input type="text" class="w3-input w3-white"
						name="teamCode" onkeydown="return setOnlyNumber();"
						onkeyup="removeChar();" maxlength="4" id="teamCode"
						placeholder="팀 코드 입력"></li>

					<li>
						<button class="w3-btn w3-brown"
							onclick="loadData('${pageContext.request.contextPath}/team/join.do');">검색</button>
					</li>
				</div>


			</ul>

		</div>
	</header>

	<div class="w3-container">
		<div class="w3-panel w3-sand w3-leftbar w3-card-12"
			style="padding: 20px">
			<p>
				<i class="w3-serif w3-xlarge">조직을 승리로 이끄는 힘의 25%는 실력이고 나머지 75%는
					팀워크이다.&nbsp &nbsp &nbsp by 딕 버메일</i>
			</p>

			<p>
				<strong>당신의 일을 성공적으로 수행하게 도와줄 팀을 찾아보세요.</strong>
			</p>
		</div>

	</div>

	<div class="w3-container w3-padding-xxlarge">


		<div class="w3-bottombar" style="margin-bottom: 30px;">
			<h2>팀 목록</h2>
		</div>

		<c:forEach items="${teamList}" var="team" varStatus="cntOfTeam">
			<form name="teamLink" method="post" style="display: inline-block;"
				action="${pageContext.request.contextPath}/team/search.do">

				<figure class="w3-card-12 w3-red w3-hover-Khaki">

					<input type="text" value="${team.code}" name="teamCode" hidden="true">

					<div class="imgContainer">
						<img
							src="${pageContext.request.contextPath}/resources/images/team.png">
					</div>

					<a href="javascript:submitWithScript(${cntOfTeam.count});" 
						style="text-decoration: none" >
						<span class="teamNameContainer" >
							<strong name="teamName" value="${team.name}">${team.name}</strong>
						</span>
					</a>

				</figure>

			</form>
		</c:forEach>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">

		<form action="${pageContext.request.contextPath}/team/create.do"
			method="post">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 class="modal-title">팀 생성</h2>
					</div>
					<div class="modal-body">
						<p>
							<input type="text" class="form-control" name="name"
								placeholder="팀 이름" maxlength="20" required>
						</p>
						<p>
							<input type="number" class="form-control" name="cycle" min="0"
								max="3" placeholder="평가주기" required>
						</p>
						<p>
							<input type="date" class="form-control" name="endDate"
								id="endDate" placeholder="평가 만료기간" required>
						</p>
					</div>
					<div class="modal-footer">

						<button type="submit" class="w3-btn w3-brown w3-xlarge w3-round">생성</button>
						<button type="button" class="w3-btn w3-brown w3-xlarge w3-round" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>

		</form>

	</div>


	<div id="snackbar">Some text some message..</div>
</body>


<footer> </footer>


</html>