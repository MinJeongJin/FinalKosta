<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출 과제 평가</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
<style type="text/css">

.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
    display: inline-block;
    vertical-align: top;
    background: url(${pageContext.request.contextPath}/views/img/StarPointStar.png) no-repeat;
}
.star-input{
    white-space: nowrap;
}
.star-input>.input{
    display:inline-block;
    width: 100px;
    background-size: 100px;
    height: 19px;
    white-space: nowrap;
    overflow: hidden;
    position: relative;
}
.star-input>.input>input{
    position: absolute;
    width: 1px;
    height: 1px;
    opacity: 0;
}
.star-input>.input.focus{
    outline: 1px dotted #ddd;
}
.star-input>.input>label{
    width: 10px;
    height: 0;
    padding: 19px 0 0 0;
    overflow: hidden;
    float: left;
    cursor: pointer;
    position: absolute;
    top: 0;
    left: 0;
}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
    background-size: 100px;
    background-position: 0 bottom;
}
.star-input>.input>label:hover~label{
    background-image: none;
}
.star-input>.input>label[for="p1"]{ 
    width: 10px;
    z-index: 10;
}
.star-input>.input>label[for="p2"]{ 
    width: 20px;
    z-index: 9;
}
.star-input>.input>label[for="p3"]{ 
    width: 30px;
    z-index: 8;
}
.star-input>.input>label[for="p4"]{ 
    width: 40px;
    z-index: 7;
}
.star-input>.input>label[for="p5"]{ 
    width: 50px;
    z-index: 6;
}
.star-input>.input>label[for="p6"]{ 
    width: 60px;
    z-index: 5;
}
.star-input>.input>label[for="p7"]{ 
    width: 70px;
    z-index: 4;
}
.star-input>.input>label[for="p8"]{ 
    width: 80px;
    z-index: 3;
}
.star-input>.input>label[for="p9"]{ 
    width: 90px;
    z-index: 2;
}
.star-input>.input>label[for="p10"]{ 
    width: 100px;
    z-index: 1;
}
.star-input>output{
    display: inline-block;
    width: 36px;
    text-align: right;
}
.star-input>output>b{
    font:bold 18px Helvetica, Arial, sans-serif;
    vertical-align: middle;
}

</style>
</head>
<body>
	<h3>제출 과제 평가(footer)</h3>

	<br>

	<table class="table">
		<colgroup>
			<col width="10;">
			<col width="10">
			<col width="10">
			<col width="10">
			<col width="10">
			<col width="10">
		</colgroup>
		<tr>
			<td>																						
				<form action="${pageContext.request.contextPath}/submission/evaluate.do?point=point & taskId=88;">
					<span class="star-input">
							<span class="input">
								<input type="radio" name="point" id="p1" value="1"><label for="p1">1</label>
								<input type="radio" name="point" id="p2" value="2"><label for="p2">2</label>
								<input type="radio" name="point" id="p3" value="3"><label for="p3">3</label>
								<input type="radio" name="point" id="p4" value="4"><label for="p4">4</label>
								<input type="radio" name="point" id="p5" value="5"><label for="p5">5</label>
								<input type="radio" name="point" id="p6" value="6"><label for="p6">6</label>
								<input type="radio" name="point" id="p7" value="7"><label for="p7">7</label>
								<input type="radio" name="point" id="p8" value="8"><label for="p8">8</label>
								<input type="radio" name="point" id="p9" value="9"><label for="p9">9</label>
								<input type="radio" name="point" id="p10" value="10"><label for="p10">10</label>
							</span>
							<output for="star-input"><b>0</b>점</output>
							<a href="${pageContext.request.contextPath}/assignment/revise.do?taskId=15&point=getPoint()"></a>
							<input class="btn" type="submit" value="평가완료"></input>
					</span>
				</form>
			</td>
		</tr>
	</table>
	<br>
	<div align="center">
	
		
	</div>
	<script type="text/javascript">
		var starRating = function(){
			  var $star = $(".star-input"),
			      $result = $star.find("output>b");
			  $(document)
			    .on("focusin", ".star-input>.input", function(){
			    $(this).addClass("focus");
			  })
			    .on("focusout", ".star-input>.input", function(){
			    var $this = $(this);
			    setTimeout(function(){
			      if($this.find(":focus").length === 0){
			        $this.removeClass("focus");
			      }
			    }, 100);
			  })
			    .on("change", ".star-input :radio", function(){
			    $result.text($(this).next().text());
			  })
			    .on("mouseover", ".star-input label", function(){
			    $result.text($(this).text());
			  })
			    .on("mouseleave", ".star-input>.input", function(){
			    var $checked = $star.find(":checked");
			    if($checked.length === 0){
			      $result.text("0");
			    } else {
			      $result.text($checked.next().text());
			    }
			  });
			};
			starRating();
	</script>
</body>
</html>
