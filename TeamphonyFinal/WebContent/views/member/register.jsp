<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title></title>

<!-- Stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/registerStyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/registerSet.css">

<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Playfair+Display'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:400,700'
	rel='stylesheet' type='text/css'>

<script type="text/javascript">
	function myFunction() {

		var path = document.getElementById("imagePath").value;
		document.getElementById("profileImage").src = path;
	}
</script>

<style type="text/css">
#profileImage {
	border-radius: 100%;
	display: block;
	overflow: hidden;
}
</style>

</head>

<body>
	<div id="main-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 left-side">
					<header>
						<span>Theamphony 가입</span>
						<h3>계정을 생성하세요</h3>
					</header>
				</div>
				<form action="${pageContext.request.contextPath}/member/create.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="starPoint">
					<div class="col-md-6 right-side">
						<img src="resources/images/default.png" alt="사진없음"
							id="profileImage" width="90" height="110"> <br> 
							<input type="file" id="imagePath" name="imagePath" />
						<button type="button" onclick="myFunction()">등록</button>
						<span class="input input--hoshi"> 
							<input class="input__field input__field--hoshi" type="text" id="memberId" name="memberId" /> 
							<label class="input__label input__label--hoshi input__label--hoshi-color-3" for="name"> 
								<span class="input__label-content input__label-content--hoshi">ID</span>
							</label>
						</span> 
						<span class="input input--hoshi">
							<input class="input__field input__field--hoshi" type="text" id="alias" name="alias" /> 
							<label class="input__label input__label--hoshi input__label--hoshi-color-3" for="email"> 
								<span class="input__label-content input__label-content--hoshi">별명</span>
							</label>
						</span> 
						<span class="input input--hoshi"> 
							<input class="input__field input__field--hoshi" type="password" id="password" name="password" /> 
							<label class="input__label input__label--hoshi input__label--hoshi-color-3" for="password"> 
								<span class="input__label-content input__label-content--hoshi">비밀번호</span>
							</label>
						</span> 
							<span class="input input--hoshi">
						</span>
						<div class="cta">
							<button type="submit" class="btn btn-primary pull-left">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end #main-wrapper -->

	<!-- Scripts -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/classie.js"></script>

	<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}

			[].slice.call(document.querySelectorAll('input.input__field'))
					.forEach(function(inputEl) {
						// in case the input is already filled..
						if (inputEl.value.trim() !== '') {
							classie.add(inputEl.parentNode, 'input--filled');
						}

						// events:
						inputEl.addEventListener('focus', onInputFocus);
						inputEl.addEventListener('blur', onInputBlur);
					});

			function onInputFocus(ev) {
				classie.add(ev.target.parentNode, 'input--filled');
			}

			function onInputBlur(ev) {
				if (ev.target.value.trim() === '') {
					classie.remove(ev.target.parentNode, 'input--filled');
				}
			}
		})();
	</script>

</body>
</html>
