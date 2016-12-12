<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Teamphony</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome cdn-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/teamStyle.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- Custom Theme Scripts -->
<script
	src="${pageContext.request.contextPath}/resources/js/teamScript.min.js"></script>



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

#okay, #reset{
	display: none;
}
</style>

</head>


<body class="nav-md" onload="showInput();">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>Teamphony</span></a>
					</div>

					<div class="clearfix"></div>


					<!-- menu profile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img
								src="${pageContext.request.contextPath}/resources/images/avatar.png"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>${member.memberId }</span>
							<h2>${member.alias }</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<%@ include file="/views/common/sideMenu.jspf"%>
					<!-- /sidebar menu -->


				</div>
			</div>

			<!-- top navigation -->

			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class="">
								<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
									<img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="">${member.alias}
									<span class=" fa fa-angle-down"></span>
								</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="${pageContext.request.contextPath}/member/logout.do"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="container" id="teamManage">
					<h2 id="menuTitle">게시물</h2>
					<form action="${pageContext.request.contextPath}/post/revise.do" method="post">
						<table class="table">
							<colgroup>
								<col width="150">
								<col width="*">
							</colgroup>
							<a href="${pageContext.request.contextPath}/post/erase.do?postId=${post.postId}" class="glyphicon glyphicon-trash pull-right" style="padding:10px">삭제</a>
							<a onclick="revise();" href="#" id="revise" class="glyphicon glyphicon-cog pull-right" style="padding:10px">수정</a>
							<tbody>
								<tr>
									<th>내용</th>
									<td><textarea id="contents" name="contents" class="form-control" readonly>${post.contents}</textarea></td>
								</tr>
								<tr id="videoView" hidden>
									<th>영상</th>
									<td>
										<div id="player">asdfgadad</div>
										<input type="text" name="videoLink" id="videoLink" value="${post.videoLink}" > 
									</td>
								</tr>
								<tr id="imageView" hidden>
									<th>이미지</th>
									<td>
										<img src="${post.imagePath}">
										<input type="text" id="imagePath" name="imagePath" value="${post.imagePath}" >
									</td>
								</tr>
								<tr id="fileView" hidden>
									<th>첨부파일</th>
									<td><input type="file" id="filePath" name="filePath" value="${post.filePath }"><input type="text" value="${post.filePath}"> </td>
								</tr>
							</tbody>
						</table>
						<br>
						<div align="center">
							<a id="back" class="btn" type="reset" href="${pageContext.request.contextPath}/post/list.do?teamCode=${teamCode}">목록으로</a>
							<input type="button" id="reset" class="btn" type="reset" value="취소" onclick="cancle()">
							<a id="okay" class="btn btn-success" type="submit" hidden>저장</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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
			$('#contents, #videoLink, #imagePath, #filePath').attr('readonly', false);
			$('#okay, #reset, #videoView, #imageView, #fileView').show();
			document.getElementById("back").style.display="none";
		};
		
		$(document).ready(function(){
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
		
		function cancle(){
			
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