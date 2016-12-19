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


<style type="text/css">
.list-member {
	padding: 14px;
}

#menuTitle {
	margin-bottom: 50px;
}

#withdrawBtn {
	margin-top: 60px;
}

#teamManage {
	padding-top: 7%;
	padding-left: 10%;
	margin-right: 0px;
}

.profile {
	margin-bottom: 80px;
}
</style>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
<body class="w3-light-grey w3-content" style="max-width: 1600px;" onload="showInput();">

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
		<div class="w3-container w3-padding-32">
			<form action="${pageContext.request.contextPath}/post/revise.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${post.postId }" name="postId" id="postId">
				<table class="table">
					<colgroup>
						<col width="150">
						<col width="*">
					</colgroup>
					<tbody>
							<tr>
								<th>내용</th>
								<td>
									<textarea id="contents" name="contents"class="form-control" rows="5">${post.contents}</textarea>
								</td>
							</tr>
							<tr id="videoView">
								<th>영상</th>
								<td>
									<c:if test="${post.videoLink eq 'pass'}">
										<input type="text" name="videoLink" id="videoLink" placeholder="유튜부 영상 링크만 가능">
									</c:if>
									<c:if test="${post.videoLink ne 'pass'}">
										<input type="text" name="videoLink" id="videoLink" placeholder="유튜부 영상 링크만 가능" value="https://youtu.be/${post.videoLink }">
									</c:if>
								</td>
							</tr>
							<tr id="imageView">
								<th>이미지</th>
								<td><input type="file" name="imagePath" id="imagePath" accept="image/*"></td>
							</tr>
					</tbody>
				</table>
				<br>
				<div align="center">
					<a id="back" class="btn" type="reset"
						href="${pageContext.request.contextPath}/post/list.do?teamCode=${teamCode}">목록으로</a>
					<button id="okay" class="btn btn-success" type="submit">저장</button>
				</div>
			</form>
		</div>
	</div>
	<!-- End page content -->
</body>

</html>