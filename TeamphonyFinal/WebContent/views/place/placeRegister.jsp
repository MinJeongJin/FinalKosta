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
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Dropzone.js -->
    <link href="${pageContext.request.contextPath}/resources/place/vendors/dropzone/dist/dropzone.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/schedule/build/css/custom.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
    
    <style>
    .fileDrop {
    width: 80%;
    height: 100px;
    border: 1px dotted gray;
    margin: auto;
    
    }
    
    small {
    margin-left: 3px;
    font-weight: bold;
    color: gray;
    }
    
    .popup {position: absolute;}
   	.back { background-color: gray; opacity:0.5; width: 50%; height: 50%; overflow:hidden; z-index:1101;}
   	.front {
   		z-index:1110; opacity:1; border:1px; margin: auto;
   	}
   	.show{
   		position:relative;
   		max-width: 1200px;
   		max-height: 800px;
   		overflow: auto;
   	}
    </style>
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
      <!-- Sidenav/menu -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left "
		style="z-index: 3; width: 250px;" id="mySidenav">
		<br>
		<div class="w3-container w3-card-4 w3-padding-16"
			style="margin-bottom: 20px;">
			<a href="#" onclick="w3_close()"
				class="w3-hide-large w3-right w3-jumbo w3-padding"
				title="close menu"> <i class="fa fa-remove"></i>
			</a> <img
				src="${pageContext.request.contextPath}/resources/images/admin.jpg"
				style="width: 45%;" class="w3-round"> <br><br>
			<h4 class="w3-padding-0">
				<span>어서오세요</span><br>
			</h4>
			<p class="w3-text-grey">관리자 님</p>
		</div>
		
		<a href="${pageContext.request.contextPath}/place/searchAll.do" id="menu1"
			name="menuItem" onclick="clickCheck('menu1');closeAcc();" class="w3-padding w3-card-4">
			<i class="fa fa-wrench fa-fw w3-margin-right"></i>장소 목록</a>

	</nav>

        <!-- page content -->
        <div class="right_col" role="main" style="padding-left:70px;">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>장소 등록 </h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h4>정보 입력</h4>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	
                  	<form id="registerForm" class="form-horizontal form-label-left" enctype="multipart/form-data" target="zeroFrame"
                  	action="${pageContext.request.contextPath}/place/create.do" method="post">

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">이름 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">주소 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="address" type="text" name="address" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">연락처(전화번호) <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="tel" id="phoneNum" name="phoneNum" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">설명 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="contents" required="required" name="contents" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>
                      </div>
                      
                      <!-- 이미지를 보여주기 위해 화면상에 숨겨진 div를 작성하고 이미지 파일명을 클릭하면 큰 크기로 보여주게 함. -->
                    <div class="popup back" style="display:none;"></div>
                    <div id="popup_front" class="popup front" style="display:none;">
                    	<img id="popup_img">
                    </div>
                    
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">휴무일
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="holiday" type="text" name="holiday" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" placeholder="ex) 없음 / 매주 일요일">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">영업시간
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="businessHour" type="text" name="businessHour" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" placeholder="ex) 9~23시 / -월~금:8:00~22:00">
                        </div>
                      </div>
                      <br><br>
                      
                      <div class="form-group">
                   	 <label for="exampleInputEmail1">업로드할 파일을 끌어다 놓으세요.</label>
                    <div class="fileDrop"></div>
                    </div>
                    
                    <div class="box-footer">
                    	<div>
                    	<hr>
                    	</div>
                    	
                    	<ul class="mailbox-attachments clearfix uploadedList"></ul>
                    </div>
                    
                    <div class="ln_solid"></div>
                   	<div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                           <button type="submit" class="btn btn-primary">Cancel</button>
                          <button id="send" type="submit" class="btn btn-success">Submit</button>
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

      </div>
    </div>
	
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.js"></script>
    <!-- Dropzone.js -->
    <script src="${pageContext.request.contextPath}/resources/place/vendors/dropzone/dist/dropzone.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>
    
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   	
   	<script src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>
    <script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"> <i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
	</script>
	
	<script>
	var template = Handlebars.compile($("#template").html());
	
	/* 파일 드래그하여 업로드 할 때*/
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url: '${pageContext.request.contextPath}/place/uploadAjax.do', 
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			}
		});
	});
	
	/* submit 누르는 부분 */
	
	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str = "";
		
		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") + "'> ";
		});
		
		that.append(str);
		// get(0)은 순수한 DOM객체를 얻어내기 위해 사용한다.
		that.get(0).submit();
	});
	
	/* 이미지 옆 X버튼 누르면 삭제 */
	
	$(".uploadedList").on("click", "li a.delbtn", function(event){
		event.preventDefault();
		
		var that = $(this);
		var fullName = that.attr("href");
		
		$.ajax({
			url:"${pageContext.request.contextPath}/place/deleteFile.do",
			type:"post",
			data: {fileName:fullName},
			dataType:"text",
			success:function(result){
				if(result == 'deleted'){
					that.parent("div").parent("li").remove();
				}
			}
		});
	});
	
	/* 이미지인지 일반 파일인지 구분 */
	
	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}

	function getFileInfo(fullName){
		var fileName, imgsrc, getLink;
		var fileLink;
		
		if(checkImageType(fullName)){
			imgsrc = "${pageContext.request.contextPath}/place/displayFile.do?fileName="+fullName;
			fileLink = fullName.substr(14);
			
			var front = fullName.substr(0,12); // /2016/00/00/
			var end = fullName.substr(14);
			
			getLink = "${pageContext.request.contextPath}/place/displayFile.do?fileName="+front + end;
		} else{
			alert("이미지 파일만 등록해주세요");
		}
		
		fileName = fileLink.substr(fileLink.indexOf("_") + 1);
		
		return {
			fileName: fileName,
			imgsrc: imgsrc,
			getLink: getLink,
			fullName: fullName
		};
	}
	
	/* 이미지 클릭시 보여지게 하는 부분*/
	
	$(".uploadedList").on("click", ".mailbox-attachment-name", function(event){
    	var fileLink = $(this).attr("href");
    	
    	if(checkImageType(fileLink)){
    		event.preventDefault();
    		
    		// 현재 클릭한 이미지의 경로를 id가 'popup_img'인 요소에 추가.
    		var imgTag = $("#popup_img");
    		imgTag.attr("src", fileLink);
    		
    		// 추가된 뒤 화면에 보이도록 show()를 호출하고, 필요한 CSS를 추가.
    		$(".popup").show('slow');
    		imgTag.addClass("show");
    	}
    });
	
	// 화면에 이미지가 보여진 후 사용자가 다시 클릭하면 이미지가 사라짐.
    $("#popup_img").on("click", function(){
    	$(".popup").hide('slow');
    });
	</script>
    
  </body>
</html>