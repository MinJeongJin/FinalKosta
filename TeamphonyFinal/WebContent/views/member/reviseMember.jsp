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
				<li><a href="#myModal" data-toggle="modal">회원 정보</a></li>
				<li><a
					href="${pageContext.request.contextPath}/views/member/checkMember.jsp">회원 수정</a></li>
				<li><a href="#">회원 탈퇴</a></li>
			</ul>
		</div>
	</header>
	<div class="w3-container w3-padding-xxlarge">
		<div class="w3-bottombar" style="margin-bottom: 30px;">
			<h2>회원 수정</h2>
		</div>
		<img alt="사진 없음" style="border-radius: 100%; display: block; overflow: hidden;" width="90" height="110" src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg">
		<br>
		<form action="${pageContext.request.contextPath}/member/revice.do" method="post"  enctype="multipart/form-data">
			<table class="table table-bordered">
				<colgroup>
					<col width="60" />
					<col width="100" />
					<col width="*" />
					<col width="150" />
					<col width="120" />
				</colgroup>
				
				<tr>
					<th>프로필</th>
					<td><input id="imagePath" type="file" name="imagePath" class="form-control" value=""></td>
				</tr>
				<tr>
					<th>별명</th>
					<td><input id="alias" type="text" name="alias" class="form-control" value=""></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input id="password" type="password" name="password" class="form-control" value=""></td>
				</tr>
				<tr>
					<th>비밀 번호 확인</th>
					<td><input id="passwordCheck" type="password" name="passwordCheck" class="form-control" value=""></td>
				</tr>
			</table>
			<div>
				<div style="display: inline-block;"><button class="btn btn-info btn-lg">확인</button></div>
				<div style="display: inline-block;"><button class="btn btn-danger btn-lg">취소</button></div>
			</div>
		</form>
	</div>
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