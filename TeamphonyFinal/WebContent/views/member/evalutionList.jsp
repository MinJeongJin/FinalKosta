
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

#okay, #reset {
	display: none;
}
</style>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<body class="w3-light-grey w3-content" style="max-width: 1600px;"
	onload="showInput();">

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


			<a
				href="${pageContext.request.contextPath}/post/erase.do?postId=${post.postId}"
				class="glyphicon glyphicon-trash pull-right" style="padding: 10px">삭제</a>
			<a onclick="revise();" href="#" id="revise"
				class="glyphicon glyphicon-cog pull-right" style="padding: 10px">수정</a>

			<table>
				<colgroup>
					<col width="100" align="center">
					<col width="100" align="center">
					<col width="100" align="center">
					<col width="100" align="center">
				</colgroup>
				<thead>
					<tr>
						<td>프로필</td>
						<td>아이디</td>
						<td>별명</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="evaluationMember"
						varStatus="status">
						<c:if test="${evaluationMember.memberId ne member.memberId }">
							<tr>
								<td><img class="evaluationProfile" alt="사진 없음"
									src="${evaluationMember.imagePath}"></td>
								<td>${evaluationMember.memberId}</td>
								<td>${evaluationMember.alias}</td>
								<td><a
									href="${pageContext.request.contextPath}/member/evaluation.do?memberId=${evaluationMember.memberId}"
									class="btn btn-success btn-lg">평가하기</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>




		</div>




		<div class="w3-black w3-center w3-padding-24 w3-card-12">
			Designed by <a href="http://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">Suho</a>
		</div>
	</div>
	<!-- End page content -->

	<script>
		// 2. This code loads the IFrame Player API code asynchronously.
		var tag = document.createElement('script');

		var change = function() {
			document.getElementById("player")
		};

		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		// 3. This function creates an <iframe> (and YouTube player)
		//    after the API code downloads.
		var player;
		function onYouTubeIframeAPIReady() {
			player = new YT.Player('player', {
				height : '360',
				width : '640',
				videoId : '${post.videoLink}',
				events : {
					'onReady' : onPlayerReady,
					'onStateChange' : onPlayerStateChange
				}
			});
		};

		// 4. The API will call this function when the video player is ready.
		function onPlayerReady(event) {
			event.target.playVideo();
		}

		// 5. The API calls this function when the player's state changes.
		//    The function indicates that when playing a video (state=1),
		//    the player should play for six seconds and then stop.
		var done = false;
		function onPlayerStateChange(event) {
			if (event.data == YT.PlayerState.PLAYING && !done) {
			}
		};
		function stopVideo() {
			player.stopVideo();
		};

		function revise() {
			$('#contents, #videoLink, #imagePath, #filePath').attr('readonly',
					false);
			$('#okay, #reset, #videoView, #imageView, #fileView').show();
			document.getElementById("back").style.display = "none";
		};

		$(document).ready(function() {
			if ($("#videoLink").value !== "pass") {
				$("#videoView").show();
			}
			if (document.getElementById("imagePath").value !== "pass") {
				$("#imageView").show();
			}
			if (document.getElementById("filePath").value !== "pass") {
				$("#fileView").show();
			}
		})

		function showInput() {
			if (document.getElementById("videoLink").value !== "pass") {
				$("#videoView").show();
			}
			if (document.getElementById("imagePath").value !== "pass") {
				$("#imageView").show();
			}
			if (document.getElementById("filePath").value !== "pass") {
				$("#fileView").show();
			}
		};

		function cancle() {

			var contents = document.getElementById("contents");
			var videoLink = document.getElementById("videoLink");
			var imagePath = document.getElementById("imagePath");
			var filePath = document.getElementById("filePath");

			contents.readOnly = true;
			videoLink.readOnly = true;
			imagePath.readOnly = true;
			filePath.readOnly = true;

			contents.value = "${post.contents}";
			videoLink.value = "${post.videoLink}";
			imagePath.value = "${post.imagePath}";
			filePath.value = "${post.filePath}";

			if (videoLink.value == "pass") {
				$("#videoView").hide();
			}

			if (imagePath.value == "pass") {
				$("#imageView").hide();
			}

			if (filePath.value == "pass") {
				$("#fileView").hide();
			}

		};
	</script>
















</body>

</html>