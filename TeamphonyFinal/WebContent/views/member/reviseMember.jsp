
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />

<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Playfair+Display'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:400,700'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">
	function myFunction() {

		var path = document.getElementById("imagePath").value;
		document.getElementById("profileImage").src = path;
	}
</script>

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
			<span class="image avatar"> <img src="${member.imagePath }"
				alt="사진없음" width="90" height="110" />
			</span>
			<h1 id="logo">${member.memberId}</h1>
			<p>${member.alias}</p>
		</header>
		<nav id="nav">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/resources/views/member/myPage.jsp"
					>마이페이지</a></li>
				<li><a href="#two" class="active">회원 정보 수정</a></li>
				<li><a href="#three">팀 탈퇴</a></li>
				<li><a href="#four">회원 탈퇴</a></li>
				<li><a href="#four">개발자</a></li>
			</ul>
		</nav>
	</section>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one">
				<form action="${pageContext.request.contextPath}/member/revise.do" method="Post">
					<table>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" /></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" /></td>
						</tr>
						<tr>
							<td>별명</td>
							<td><input type="text" value="${member.alias }" ></td>
						</tr>
						<tr>
							<td>사진</td>
							<td><input type="file" /></td>
						</tr>
					</table>
					<button type="submit">수정</button>
				</form>
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
	<!-- Scripts -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>

	<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}

			[].slice.call(document.querySelectorAll('input.input__field'))
					.forEach(function(inputEl) {
						// in case the input is already filled..
						if (inputEl.value.trim() !== '') {
							classie.add(inputEl.parentNode, 'input--filled');
						}

						// events:
						inputEl.addEventListener('focus', onInputFocus);
						inputEl.addEventListener('blur', onInputBlur);
					});

			function onInputFocus(ev) {
				classie.add(ev.target.parentNode, 'input--filled');
			}

			function onInputBlur(ev) {
				if (ev.target.value.trim() === '') {
					classie.remove(ev.target.parentNode, 'input--filled');
				}
			}
		})();
	</script>

</body>
</html>