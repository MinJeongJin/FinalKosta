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
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

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

#check {
	display: none;
}

#imagView{
	dispaly: none;
}

#videoView {
	dispaly: none;
}

#fileView {
	dispaly: none;
}
</style>

</head>


<body class="nav-md">
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

					<div align="right">
						<a class="btn btn-info" onclick="revise();">수정</a>
					</div>

					<form enctype="multipart/form-data" method="post"
						action="${pageContext.request.contextPath}/post/revise.do">
						<input type="hidden" value="${post.postId }" name="postId">

						<div class="row">
							<div class="form-group col-xs-7">
								<label for="contents">내용 : </label>
								<textarea class="form-control input-lg" name="contents" id="contents" style="width: 100%; height: 150px;" readOnly>${post.contents }</textarea>
							</div>
						</div>

						<div id="player"></div>

						<div class="row videoView">
							<div class="form-group col-xs-7 videoView">
								<label for="contents">영상 링크 : </label> 
								<input type="text" class="form-control input-lg" name="videoLink" id="videoLink" value="https://www.youtu.be/${post.videoLink }" readOnly>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-xs-7">
								<label for="contents">사진 : </label> 
								<img class="form-control input-lg" id="imageView" name="imagePath" src="${post.imagePath }">
							</div>
						</div>

						<div class="row imageView">
							<div class="form-group col-xs-7 imageView">
								<label for="contents">사진 첨부 : </label> 
								<input type="file" class="form-control input-lg imageView" id="imagePath" name="imagePath" value="${post.imagePath }" readOnly>
							</div>
						</div>

						<div class="row fileView">
							<div class="form-group col-xs-7">
								<label for="contents">파일 첨부 : </label> 
								<input type="file" class="form-control input-lg" id="filePath" name="filePath" value="${post.filePath }" readOnly>
							</div>
						</div>


						<div>
							<c:if test="${post.member.memberId eq member.memberId }">

								<button type="submit" class="btn btn-info btn-lg" id="check">확인</button>
								<a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/post/delete.do?postId=${post.postId}">삭제</a>
							</c:if>
							<a href="${pageContext.request.contextPath}/post/postList.do?teamCode=${teamCode}" class="btn btn-warning btn-lg">뒤로</a>
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
			$('#check').show();
		};

		function change() {

			var videoLink = ${post.videoLink};
			var imagePath = ${post.imagePath};
			var filePath = ${post.filePath};
			

			if (!videoLink === "pass") {
				$('#videoView').show();
			}
			if (!(imagePath === "pass")) {
				$('#imageView').show();
			}
			if (!filePath === "pass") {
				$('#fileView').show();
			}
		};
	</script>
</body>



</html>