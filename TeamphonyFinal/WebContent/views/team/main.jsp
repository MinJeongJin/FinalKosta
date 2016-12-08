<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>

<title>Welcome to Teamphony</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/mainStyle.css"
	rel="stylesheet">


<style>
#snackbar {
	visibility: hidden;
	min-width: 250px;
	margin-left: -125px;
	background-color: #333;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 17px;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>



<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	"use strict";
	
	
	var showSnackBar = function(msg) {
	    var x = document.getElementById("snackbar");
	    x.innerHTML = msg;
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 2000);
	}
	

	var loadData = function(url) {

		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var data = JSON.parse(xhttp.responseText);
				var flag = data['flag'];

				console.log("success");
				switch (flag) {

				case '0':

					showSnackBar('존재하지 않는 팀 입니다.');
				

					break;

				case '-1':

					showSnackBar('이미 가입 되어 있는 팀 입니다.');
				
					break;

				default:
					window.location.href = "/TeamphonyFinal/team/main.do";

					break;

				}
			}
		};

		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhttp.send("teamCode=" + document.getElementById('teamCode').value);
		document.getElementById('myForm').reset();
	}

	var submitWithScript = function(num) {

		var element = document.getElementsByName("teamLink")[num - 1];
		element.target = "_blank";
		element.submit();
	}

	var getMinDate = function() {

		var date = new Date();
		var year = date.getFullYear(); // 년도
		var month = (1 + date.getMonth()); // 월
		month = month >= 10 ? month : '0' + month; // 월 두자리로 변경 작업
		var day = date.getDate(); // 일 
		day = day >= 10 ? day : '0' + day; //일 두자리로 변경 작업

		document.getElementById('endDate').min = year + '-' + month + '-' + day;// yyyy-mm-dd format 변경
	}

	var checkNameLength = function() {

		var teamList = document.getElementsByName("part-info");
		var len = teamList.length;

		for (var i = 0; i < len; i++) {

			var teamName = teamList[i].getAttribute("value");

			if (teamName.length > 6) {

				teamList[i].innerHTML = teamName.substring(0, 6) + " ...";

			}

		}

	}

	var setOnlyNumber = function(event) {

		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}

	var removeChar = function(event) {

		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");

	}

	window.onload = function() {

		checkNameLength();
		getMinDate();

	}
</script>

</head>

<body>

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

			<form id="myForm" class="navbar-form navbar-right" method="post"
				action="${pageContext.request.contextPath}/team/join.do">
				<div class="form-group">
					<input type="text" class="form-control" name="teamCode"
						onkeydown="return setOnlyNumber();" onkeyup="removeChar();"
						maxlength="4" id="teamCode" placeholder="팀 코드 입력">
				</div>
				<button type="button"
					onclick="loadData('${pageContext.request.contextPath}/team/join.do');"
					class="btn btn-default">검색</button>
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
						<a href="javascript:submitWithScript(${cntOfTeam.count});">


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
	
	<div id="snackbar">Some text some message..</div>

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

						<button type="submit" class="btn btn-info btn-lg">생성</button>
						<button type="button" class="btn btn-info btn-lg">취소</button>
					</div>
				</div>

			</div>

		</form>

	</div>

</body>

</html>