<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Teamphony !  </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">
    
  </head>

  <body class="w3-light-grey w3-content" style="max-width: 1600px;">
  
  	<!-- side bar -->
	<%@ include file="/views/common/sideBar.jspf"%>
	
        <!-- page content -->
        <div class="w3-container w3-main" style="margin-left: 250px;">
        
        <!-- Header -->
		<header class="w3-container">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<h1>
				<b>일정</b>
				<h4>일정을 등록하세요</h4>
			</h1>
			<div class="w3-section w3-bottombar "></div>
		</header>
            
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_content">
                    <br />
                    <form action="${pageContext.request.contextPath}/schedule/create.do" method="post" 
                    data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">제목<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">장소</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="place" name="place" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">일시</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="startDay" name="startDay" value="${startDay }">
						  <input type="time" id="startHour" name="startHour">
						  -
						  <input type="date" id="endDay" name="endDay" value="${endDay }">
						  <input type="time" id="endHour" name="endHour">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="contents" name="contents" class="form-control col-md-7 col-xs-12" rows="7" placeholder="일정에 필요한 설명을 남기세요."></textarea>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="reset" class="btn btn-primary">취소</button>
                          <button type="submit" class="btn btn-success">등록</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <!-- /page content -->
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>

	<script>
	$(document).ready(function(){
		var date = new Date();
		
		var hours = date.getHours();
		var minutes = date.getMinutes();
		
		if(hours < 10) hours = "0" + hours;
		if(minutes < 10) minutes = "0" + minutes;
		
		var currentTime = hours + ':' + minutes;
		
		var endTime;
		
		if(hours == '23'){
			endTime = hours + ':' + '59';
		} else if(hours == '09'){
			endTime = (parseInt(hours) + 1) + ':' + minutes;
		} else {
			endTime = (parseInt(hours) + 1) + ':' + minutes;
		}
		
		$('#startHour').val(currentTime);
		$('#endHour').val(endTime);
	})
	</script>
</body>
</html>