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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainCustomStyle.css">

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

<!-- Script -->
<script
	src="${pageContext.request.contextPath}/resources/js/mainCustomScript.js">
	
</script>

<!-- /Script -->

</head>
<body class="w3-light-gray">
	<header id="mainHeader">
		<div class="w3-container">
			<ul class="w3-navbar w3-black w3-large w3-card-12 w3-padding-12">
				<li class="w3-navitem w3-tangerine">Teamphony</li>
				<li><a href="#">마이 페이지</a></li>
				<li><form action="${pageContext.request.contextPath}/member/erase.do" id="delete"><input type="hidden" value="member.memberId" name="memberId"><a href="${pageContext.request.contextPath}/member/erase.do" onclick="deleteAlter();">회원 탈퇴</a></form></li>
				<li class="w3-right"><a href="${pageContext.request.contextPath}/team/main.do"><i class="fa fa-sign-in"></i></a></li>
			</ul>
		</div>
	</header>
	<div class="w3-container w3-padding-xxlarge">
		<div class="w3-bottombar" style="margin-bottom: 30px;">
			<h2><strong>마이 페이지</strong></h2>
			<h4>자신의 정보를 확인하고 수정 할 수 있습니다.</h4>
		</div>

	</div>

	<div class="w3-modal-content w3-teal"
		style="min-width: 300px; max-width: 600px; margin-bottom: 30px;">


		<form id="reviseForm" class="w3-container"
			action="${pageContext.request.contextPath}/member/revise.do"
			method="post" enctype="multipart/form-data">
			<div class="w3-center">
				<br>
				<c:choose>

					<c:when test="${member.imagePath eq 'pass'}">

						<img id="holder"
							src="${pageContext.request.contextPath}/resources/images/default.png"
							alt="Avatar" style="width: 150px; height: 150px;"
							class="w3-circle w3-margin-top">


					</c:when>

					<c:otherwise>
						<img id="holder"
							src="${pageContext.request.contextPath}/resources/images/${member.memberId}/${member.imagePath}"
							alt="Avatar" style="width: 150px; height: 150px;"
							class="w3-circle w3-margin-top">

					</c:otherwise>

				</c:choose>


				<div class="filebox">
					<label for="ex_file" class="w3-btn w3-large w3-dark-grey"
						style="margin-top: 20px; display: inline-block;">프로필 사진 변경</label>
					<input type="file" id="ex_file" name="imagePath" accept="image/*">

				</div>
			</div>
			<div class="w3-section">

				<label><b>ID</b></label> <input class="w3-input w3-border"
					value="${member.memberId}" type="text" readonly> <br>
				<label><b>PW</b></label> <input
					class="w3-input w3-border w3-margin-bottom" type="password"
					placeholder="영문, 특수, 숫자 조합 9 ~ 15자" id="pw" name="password"
					maxlength="15" oninput="checkValidityInPw();"
					value="${member.password}">

				<p id="validityInPw" class="msg"></p>
				<input id="pwValidity" style="display: none" value="true"
					class="confirm"> <label><b>PW 확인</b></label> <input
					class="w3-input w3-border w3-margin-bottom" type="password"
					placeholder="PW 필드와 같은 비밀번호를 입력" id="pwCon" name="pwCon"
					maxlength="15" oninput="checkValidityInPwCon();"
					value="${member.password}">

				<p id="validityInPwCon" class="msg"></p>
				<input id="pwConValidity" style="display: none" value="true"
					class="confirm"> <label><b>별명</b></label> <input
					class="w3-input w3-border w3-margin-bottom" type="text"
					placeholder="공백 제외 2 ~ 10자" id="alias" name="alias" maxlength="10"
					oninput="checkValidityInAlias();" value="${member.alias}">

				<p id="validityInAlias" class="msg"></p>
				<input id="aliasValidity" style="display: none" value="true"
					class="confirm">

				<div class="w3-right w3-padding">
					<button class="w3-btn w3-padding w3-dark-grey w3-large"
						type="button" onclick="checkAll();">
						<b>수정</b>
					</button>

					<button class="w3-btn w3-padding w3-dark-grey w3-large"
						type="button" onclick="location.reload();">
						<b>취소</b>
					</button>

				</div>
			</div>
		</form>
	</div>

	<%@ include file="/views/member/alertInMyPage.jspf"%>
	<%@ include file="/views/member/alertDelete.jspf"%>

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
	</script>


	<script>
		var checkValidityInAlias = function() {

			var aliasVal = document.getElementById('alias').value;
			var confirm = document.getElementById('aliasValidity');
			var msg = document.getElementById('validityInAlias');

			if (aliasVal.length < 2) {

				msg.innerHTML = "2자 이상 10자 이하"
				confirm.value = "false";

			} else {

				msg.innerHTML = "사용가능한 별명 입니다.";
				confirm.value = "true";
			}
		}

		var checkValidityInPw = function() {

			var pwVal = document.getElementById('pw').value;
			var confirm = document.getElementById('pwValidity');
			var msg = document.getElementById('validityInPw');
			var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{9,15}$/;

			if (pwVal.length < 9) {

				msg.innerHTML = "9자 이상 15자 이하"
				confirm.value = "false";
			} else {

				if (pwReg.test(pwVal)) {

					msg.innerHTML = "올바른 비밀번호 형식입니다.";
					confirm.value = "true";

				} else {

					msg.innerHTML = "비밀번호는 영문, 특수, 숫자 조합입니다.";
					confirm.value = "false";
				}
			}
		}

		var checkValidityInPwCon = function() {

			var pwConVal = document.getElementById('pwCon').value;
			var pwVal = document.getElementById('pw').value;
			var confirm = document.getElementById('pwConValidity');
			var msg = document.getElementById('validityInPwCon');

			if (pwVal != pwConVal) {

				msg.innerHTML = "PW필드의 값과 일치하지 않습니다.";
				confirm.value = "false";

			} else {

				msg.innerHTML = "일치합니다.";
				confirm.value = "true";

			}
		}

		var checkAll = function() {

			var confirms = document.getElementsByClassName('confirm');
			var len = confirms.length;
			var trueCnt = 0;

			for (var i = 0; i < len; i++) {

				if (confirms[i].value == "true") {

					trueCnt++;
				}
			}
			
			if (trueCnt == len) {

				document.getElementById('alert').style.display='block';

			} else {
				//snack bar
				window.alert('완전히 기입되어 있지 않은 사항이 있습니다.');
			}
		}
		
		var deleteAlter = function() {

			document.getElementById('deleteAlter').style.display='block';

		};

	</script>


</body>
</html>