<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>

<title>Welcome to teamphony</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/mainStyle.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	var submit = function(num) {

		document.getElementsByName("teamLink")[num-1].submit();

	}

	var getMinDate = function() {

		var date = new Date();
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; // month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장

		document.getElementById('endDate').min = year + '-' + month + '-' + day;
	}

	var checkNameLength = function() {

		var teamList = document.getElementsByName("part-info");
		var len = teamList.length;

		for (i = 0; i < len; i++) {

			var teamName = teamList[i].getAttribute("value");

			if (teamName.length > 6) {

				teamList[i].innerHTML = teamName.substring(0, 6) + " ...";

			}

		}

	}

	var warnningMsg = function(flag) {

		if (flag == 0) {

			window.alert("존재하지 않는 팀 입니다.");

		} else if (flag == -1) {

			window.alert("이미 가입 되어 있는 팀 입니다.");

		}

	}
</script>

</head>

<body onload="checkNameLength(); getMinDate(); warnningMsg(${flag});">


	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<label class="navbar-brand">Teamphony</label>
			</div>

			<ul class="nav navbar-nav">

				<li><a href="#myModal" data-toggle="modal">팀 생성</a></li>
				<li><a
					href="${pageContext.request.contextPath}/views/member/checkMember.jsp">마이페이지</a></li>
				<li><a href="#">로그아웃</a></li>

			</ul>

			<form class="navbar-form navbar-right" method="post"
				action="${pageContext.request.contextPath}/team/join.do">
				<div class="form-group">
					<input type="number" class="form-control" name="teamCode"
						maxlength="4" placeholder="팀 코드 입력" min="1000" max="9999">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>

		</div>
	</nav>

	<div id="wrapper-container">

		<div id="contents">

			<h2 id="title" style="margin-bottom: 20px">팀 목록</h2>

			<c:forEach items="${teamList}" var="team" varStatus="cntOfTeam">

				<form name="teamLink" method="post"
					action="${pageContext.request.contextPath}/team/search.do">

					<figure class="white">
						<input type="text" value="${team.code}" name="teamCode" hidden>
						<a href="javascript:submit(${cntOfTeam.count});">
							<div id="wrapper-part-info">

								<div class="part-info-image">
									<img
										src="${pageContext.request.contextPath}/resources/images/team.png"
										alt="np" style="width: 24px; height: 24px">
								</div>
								<div id="part-info" value="${team.name}" name="part-info">${team.name}</div>
							</div>
						</a>
					</figure>
				</form>
			</c:forEach>

		</div>

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
								max="5" maxlength="1" placeholder="평가주기" required>
						</p>
						<p>
							<input type="date" class="form-control" name="endDate"
								id="endDate" placeholder="평가 만료기간" required>
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

</body>

</html>