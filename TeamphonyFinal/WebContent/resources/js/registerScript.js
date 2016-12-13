var globalTestingVar = false;

var showSnackBar = function(msg) {
	var x = document.getElementById("snackbar");
	x.innerHTML = msg;
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 2000);
}

var checkRedun = function() {

	var confirm = document.getElementById('idValidity');
	var msg = document.getElementById('validityInId');

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var data = xhttp.responseText;

			switch (data) {

			case "true":

				msg.innerHTML = "사용가능한 ID 입니다.";
				confirm.value = "true";

				break;

			case "false":

				msg.innerHTML = "이미 사용중인 ID 입니다.";
				confirm.value = "false";

				break;

			default:
				console.log(data);

				break;

			}
		}
	};

	xhttp.open("POST", "/TeamphonyFinal/member/redunCheck.do", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("checkingId=" + document.getElementById('id').value);
}

var checkValidityInId = function() {

	var idVal = document.getElementById('id').value;
	var confirm = document.getElementById('idValidity');
	var msg = document.getElementById('validityInId');
	var idReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,15}$/;

	if (idVal.length < 4) {

		msg.innerHTML = '4자 이상 15자 이하';
		confirm.value = "false";

	} else {

		if (idReg.test(idVal)) {

			checkRedun();

		} else {

			msg.innerHTML = "ID는 영문 숫자 조합입니다.";
			confirm.value = false;
		}
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

			msg.innerHTML = "사용가능한 비밀번호 입니다.";
			confirm.value = "true";

		} else {

			msg.innerHTML = "비밀번호는 영문, 특수, 숫자 조합입니다.";
			confirm.value = "false";
		}
	}
}

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

var checkAll = function() {

	var confirms = document.getElementsByClassName('confirm');
	var len = confirms.length;
	var trueCnt = 0;
	var registerForm = document.getElementById('registerForm');

	for (var i = 0; i < len; i++) {

		if (confirms[i].value == "true") {

			trueCnt++;
		}
	}

	if (trueCnt == len) {

		registerForm.submit();

	} else {
		showSnackBar("완벽하게 기입되지 않은 항목이 존재합니다.");
	}
}
