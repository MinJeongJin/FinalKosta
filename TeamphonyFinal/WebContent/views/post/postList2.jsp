
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
	<%@ include file="/views/post/createPost.jspf"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-container w3-main" style="margin-left: 300px;">

		<!-- Header -->
		<header class="w3-container">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/${member.memberId}/${member.imagePath}"
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



		<div class="w3-container">

			<form
				action="${pageContext.request.contextPath}/post/searchBycontents.do">



				<input class="w3-input w3-border w3-animate-input w3-white w3-large" type="text"
					style="padding-left:70px;padding-top:12px; padding-bottom:12px;width: 30%;display:inline-block;background:url(${pageContext.request.contextPath}/resources/images/search_icon.png) no-repeat;" placeholder="search">
				
				<button type="submit" class="w3-btn w3-dark-grey w3-large"
					style="display:none">검색</button>





			</form>
		</div>





		<div class="w3-container w3-padding-32">


			<c:choose>
				<c:when test="${listPost eq null || empty listPost }">
					<p>게시물이 존재하지 않습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${listPost}" var="post" varStatus="status">

						<figure style="display: inline-block">
							<div class="w3-card-4 w3-white"
								style="width: 300px; display: inline-block; word-break: break-all;">
								<header class="w3-container w3-padding-8">
									<img
										src="${pageContext.request.contextPath}/resources/images/${post.member.memberId}/${post.member.imagePath}"
										alt="Avatar" class="w3-left w3-circle w3-margin-right"
										style="width: 30px">
									<h3>${post.member.memberId }</h3>
								</header>
								<div class="w3-container">
									<c:if test="${post.imagePath ne pass}">
										<b class="glyphicon glyphicon-paperclip"></b>
									</c:if>
									<c:if test="${post.videoLink ne pass}">
										<b class="glyphicon glyphicon-hd-video"></b>
									</c:if>
									<c:if test="${post.imagePath ne pass}">
										<b class="glyphicon glyphicon-picture"></b>
									</c:if>
									<hr>

									<p>${post.contents}</p>
									<br>
								</div>
								<a
									href="${pageContext.request.contextPath}/post/detail.do?postId=${post.postId}"
									class="w3-btn-block w3-dark-grey" style="margin-bottom: 0px">+
									상세보기</a>

							</div>
						</figure>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<div class="w3-row">
				<a class="w3-btn-floating-large w3-right w3-dark-grey"
					onclick="document.getElementById('postModal').style.display='block';"
					href="#">+</a>
			</div>

		</div>




		<div class="w3-black w3-center w3-padding-24 w3-card-12">
			Designed by <a href="http://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">Suho</a>
		</div>
	</div>
	<!-- End page content -->



</body>

</html>