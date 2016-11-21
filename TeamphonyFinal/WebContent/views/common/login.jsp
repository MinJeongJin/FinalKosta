<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Welcome to Teamphony</title>

<!-- Google Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="../../resources/login/css/loginAnimate.css">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="../../resources/login/css/loginStyle.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden">
				<span id="logo">Teamphony</span>
			</h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>

			<form method="post" action="login.do">
				<label for="username">ID</label> <br /> 
				
				<input type="text" id="loginId" name="loginId"> 
				
				<br /> 
				
				<label for="password">PW</label> 
				
				<br />
				
				<input type="password" id="loginPw" name="loginPw"> 
				
				<br />
				
				<button type="submit" >enter</button>
				
				<br /> <a href="register.jsp"><p class="small">Register?</p></a>
			</form>

		</div>
	</div>
</body>

<script>
	$(document).ready(function () {
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

</html>