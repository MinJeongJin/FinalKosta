<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Teamphony</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<body class="w3-light-grey w3-content" style="max-width: 1600px;">

	<!-- side bar -->
	<%@ include file="/views/common/sideBar.jspf"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-container w3-main" style="margin-left: 300px;">

		<!-- Header -->
		<header class="w3-container">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<h1>
				<b>게시판</b>
			</h1>
			<h4>팀원들과 공유하고 싶은 자료를 올려보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>

		<div class="w3-container w3-padding-32" style="padding-left: 10%;">
			<form enctype="multipart/form-data" method="post"
				action="${pageContext.request.contextPath}/post/create.do">

				<div class="row">
					<div class="form-group col-xs-7">
						<label for="contents">내용 : </label>
						<textarea class="form-control input-lg" name="contents"
							id="contents" style="width: 675px; height: 300px;"></textarea>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-xs-7">
						<label for="contents">영상 링크 : </label> <input type="text"
							class="form-control input-lg" name="videoLink" id="contents">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-xs-7">
						<label for="contents">사진 첨부 : </label> <input type="file"
							class="form-control input-lg" id="imagePath" name="imagePath">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-xs-7">
						<label for="contents">파일 첨부 : </label> <input type="file"
							class="form-control input-lg" id="filePath" name="filePath">
					</div>
				</div>

				<div>
					<button type="submit" class="btn btn-info btn-lg">등록</button>
					<a
						href="${pageContext.request.contextPath}/post/postList.do?teamCode=${teamCode}"
						class="btn btn-warning btn-lg">취소</a>
				</div>
			</form>

		</div>

		<div class="w3-black w3-center w3-padding-24 w3-card-12">
			Designed by <a href="http://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">Suho</a>
		</div>
	</div>
	<!-- End page content -->

</body>
</html>