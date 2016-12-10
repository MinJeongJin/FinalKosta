"use strict";
	
	
	var showSnackBar = function(msg) {
	    var x = document.getElementById("snackbar");
	    x.innerHTML = msg;
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 2000);
	}
	

	var loadData = function(url) {

		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var data = JSON.parse(xhttp.responseText);
				var flag = data.flag;
				
				switch (flag) {

				case '0':

					
					showSnackBar('존재하지 않는 팀 입니다.');
				

					break;

				case '-1':

					showSnackBar('이미 가입 되어 있는 팀 입니다.');
				
					break;

				default:
					window.location.href = "/TeamphonyFinal/team/main.do";

					break;

				}
			}
		};

		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhttp.send("teamCode=" + document.getElementById('teamCode').value);
		document.getElementById('myForm').reset();
	}

	var submitWithScript = function(num) {

		var element = document.getElementsByName("teamLink")[num - 1];
		element.target = "_blank";
		element.submit();
	}

	var getMinDate = function() {

		var date = new Date();
		var year = date.getFullYear(); // 년도
		var month = (1 + date.getMonth()); // 월
		month = month >= 10 ? month : '0' + month; // 월 두자리로 변경 작업
		var day = date.getDate(); // 일 
		day = day >= 10 ? day : '0' + day; //일 두자리로 변경 작업

		document.getElementById('endDate').min = year + '-' + month + '-' + day;// yyyy-mm-dd format 변경
	}

	var checkNameLength = function() {

		var teamList = document.getElementsByName("teamName");
		var len = teamList.length;

		for (var i = 0; i < len; i++) {

			var teamName = teamList[i].getAttribute("value");
			if (teamName.length > 6) {

				teamList[i].innerHTML = teamName.substring(0, 8) + " ...";

			}

		}

	}

	var setOnlyNumber = function(event) {

		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}

	var removeChar = function(event) {

		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");

	}

	window.onload = function() {

		checkNameLength();
		getMinDate();

	}