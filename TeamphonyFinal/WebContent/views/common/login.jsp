<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Login</title>

<!-- CSS -->


<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loginStyle.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">

<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>

<!-- /CSS -->

<!-- script -->
<script
	src="${pageContext.request.contextPath}/resources/js/registerScript.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js">
	$(document).ready(function() {
		$('#logo').addClass('animated fadeInDown');
		$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>
<!-- /script -->

</head>

<body>
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden">
				<span id="logo">Teamphony</span>
			</h1>
		</div>

		<%@ include file="/views/common/registerMember.jspf"%>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>



			<form method="post"
				action="${pageContext.request.contextPath}/member/login.do">
				<label for="username">ID</label> <br /> <input type="text"
					id="loginId" name="loginId"> <br /> <label for="password">PW</label>

				<br /> <input type="password" id="loginPw" name="loginPw">

				<br />
				<c:if test="${result eq 'true'}">
					<label>아이디와 비밀번호가 다릅니다.</label>
					<br />
				</c:if>
				<c:if test="${result eq 'notId'}">
					<label>아이디가 존재하지 않습니다.</label>
					<br />
				</c:if>

				<br />
				<button type="submit">enter</button>

				<br />
				<p class="small">
					<a
						onclick="document.getElementById('registerModal').style.display='block'"
						href="#">Register?</a>
				</p>
			</form>
		</div>
	</div>

	<script>
		var upload = document.getElementsByTagName('input')[0], holder = document
				.getElementById('holder'), state = document
				.getElementById('status');

		upload.onchange = function(e) {

			e.preventDefault();

			var file = upload.files[0], reader = new FileReader();

			reader.onload = function(event) {

				holder.src = event.target.result;

			};
			reader.readAsDataURL(file);

			return false;
		};

		var modalReset = function() {

			var idField = document.getElementById('id');
			var pwField = document.getElementById('pw');
			var aliasField = document.getElementById('alias');
			var img = document.getElementById('holder');
			var msgs = document.getElementsByClassName('msg');
			var len = msgs.length;

			idField.value = '';
			pwField.value = '';
			aliasField.value = '';
			img.src = "${pageContext.request.contextPath}/resources/images/default.png";

			for (var i = 0; i < len; i++) {

				msgs[i].innerHTML = ' ';

			}
		}
	</script>

</body>
</html>