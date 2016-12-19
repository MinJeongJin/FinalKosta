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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">
    
<style type="text/css">
#reset, #okay {
display: none;
}
</style>
  </head>

  <body class="w3-light-grey w3-content" style="max-width: 1600px;">
  <input id="scheduleId" name="scheduleId" type="hidden" value="${schedule.scheduleId}">
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
				<h4>상세</h4>
			</h1>
			<div class="w3-section w3-bottombar "></div>
		</header>
		
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <a href="${pageContext.request.contextPath}/schedule/erase.do?scheduleId=${schedule.scheduleId}" class="glyphicon glyphicon-trash pull-right" style="padding:10px">삭제</a>
					<a onclick="bt_revise_click();" id="revise" class="glyphicon glyphicon-cog pull-right" style="padding:10px">수정</a>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form action="${pageContext.request.contextPath}/schedule/revise.do?scheduleId=${schedule.scheduleId}" method="post" 
                    data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">제목<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="title" name="title" required="required" class="form-control col-md-7 col-xs-12" value="${schedule.title }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">장소</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="place" name="place" class="form-control col-md-7 col-xs-12" value="${schedule.place }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">일시</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="date" id="startDay" name="startDay" value="${startDay }" readonly>
						  <input type="time" id="startHour" name="startHour" value="${startHour }" readonly>
						  -
						  <input type="date" id="endDay" name="endDay" value="${endDay }" readonly>
						  <input type="time" id="endHour" name="endHour" value="${endHour }" readonly>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="contents" name="contents" class="form-control col-md-7 col-xs-12" rows="7" readonly>${schedule.contents }</textarea>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button id="reset" type="reset" class="btn btn-primary">취소</button>
                          <button id="okay" type="submit" class="btn btn-success">수정</button>
                        </div>
                      </div>

                    </form>
                  </div>
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
    
	<script type="text/javascript">
	<!-- revise button click event -->
	function bt_revise_click(){
		$('#title, #place, #startDay, #startHour, #endDay, #endHour, #contents').attr('readonly',false);
		$('#reset, #okay').show();
	}
	</script>
</body>
</html>