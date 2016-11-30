<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}
</style>

<body>

	<!-- Sidenav/menu -->
	<nav class="w3-sidenav w3-red w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 300px; font-weight: bold" id="mySidenav">

		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-padding-xlarge w3-hide-large w3-display-topleft w3-hover-white"
			style="width: 100%">Close Menu</a>

		<div class="w3-container">

			<img src="" alt="사진 없음">

		</div>

		<a href="#" onclick="w3_close()" class="w3-padding w3-hover-white">팀 관리</a>
		
		<a href="#showcase" onclick="w3_close()" class="w3-padding w3-hover-white">게시판</a> 
			
		<a href="#services" onclick="w3_close()" class="w3-padding w3-hover-white">과제</a> 
			
		<a href="#designers" onclick="w3_close()" class="w3-padding w3-hover-white">일정관리</a> 
		
		<a href="#packages" onclick="w3_close()" class="w3-padding w3-hover-white">팀원평가</a> 
		
		<a href="#contact" onclick="w3_close()" class="w3-padding w3-hover-white">장소정보</a>

	</nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
		<a href="javascript:void(0)"
			class="w3-btn w3-red w3-border w3-border-white w3-margin-right"
			onclick="w3_open()">☰</a> <span>Company Name</span>
	</header>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>





	<script>
		// Script to open and close sidenav
		function w3_open() {
			document.getElementById("mySidenav").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidenav").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}
	</script>

</body>
</html>
