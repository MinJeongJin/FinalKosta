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
			<h2>회원 확인</h2>
		</div>
		<table>
			<tr>
				<td>패스워드</td>
				<td><input id="password" name = "password" type="password"></td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" id="passwordCheck" name="passwordCheck"></td>
			</tr>
		</table>
		<div>
			<div style="display: inline-block;"><button class="btn btn-info btn-lg">확인</button></div>
			<div style="display: inline-block;"><button class="btn btn-danger btn-lg">취소</button></div>
		</div>
	</div>
</body>
</html>