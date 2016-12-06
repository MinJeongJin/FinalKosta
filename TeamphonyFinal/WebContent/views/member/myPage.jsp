<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Welcome to teamphony</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/mainStyle.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	var click = new function() {
		fn_openBoardList();
	}
	
	function fn_openBoardList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='${pageContext.request.contextPath}/views/team/main.do?flag=0'/>");
        comSubmit.submit();
    }
	
	
	function readURL(input) {

	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgInp").change(function(){
	    readURL(${member.imagePath});
	});
</script>

</head>

<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<label class="navbar-brand" onclick="">Teamphony</label>
			</div>

			<ul class="nav navbar-nav">

				<li><a href="${pageContext.request.contextPath}/views/member/myPage.jsp">마이 페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/views/member/reviseMember.jsp">회원 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/member/delete.do">회원 탈퇴</a></li>

			</ul>

		</div>
	</nav>

	<div id="wrapper-container">

		<div id="contents">

			<div>
				<div><img id="blah" alt="사진 없음" src="${member.imagePath}"></div>
			</div>

		</div>

	</div>

</body>

</html>