<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
   
   <!-- 업로드한 파일을 원본 그대로 확인할 수 있도록
  		이미지를 클릭하면 화면이 전환되면서 보여지게끔. 별도의 이벤트 처리가 필요. 
   		CSS를 이용해서 화면의 맨 앞쪽으로 보여지게 처리. -->
   <style type="text/css">
   .fileDrop {
    width: 80%;
    height: 200px;
    border: 1px dotted gray;
    margin: auto;
    
    }
    
    small {
    margin-left: 3px;
    font-weight: bold;
    color: gray;
    }
   
   	.popup {position: absolute;}
   	.back { background-color: gray; opacity:0.5; width: 80%; height: 70%; overflow:hidden; z-index:1101;}
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

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>장소 정보 수정</h3>
              </div>

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상세 정보</h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	
                  	<form id="modifyForm" class="form-horizontal form-label-left" enctype="multipart/form-data" target="zeroFrame"
                  	action="${pageContext.request.contextPath}/place/revise.do" method="post">
                  	<input type="hidden" name="placeId" value="${place.placeId }">

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">이름 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" required="required" type="text" 
                          value="${place.name }">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">주소 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="address" type="text" name="address" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12"
                          value="${place.address }">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">연락처(전화번호) <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="tel" id="phoneNum" name="phoneNum" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12"
                          value="${place.phoneNum }">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">설명 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="contents" required="required" name="contents" class="form-control col-md-7 col-xs-12">${place.contents }</textarea>
                        </div>
                      </div>
                  
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">휴무일
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="holiday" type="text" name="holiday" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" 
                          placeholder="ex) 없음 / 매주 일요일" value="${place.holiday }">
                        </div>
                      </div>
                          
                    <!-- 이미지를 보여주기 위해 화면상에 숨겨진 div를 작성하고 이미지 파일명을 클릭하면 큰 크기로 보여주게 함. -->
                    <div class="popup back" style="display:none;"></div>
                    <div id="popup_front" class="popup front" style="display:none;">
                    	<img id="popup_img">
                    </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">영업시간
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="businessHour" type="text" name="businessHour" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12"
                           placeholder="ex) 9~23시 / -월~금:8:00~22:00" value="${place.businessHour }">
                        </div>
                      </div>
                      <br><br>
                      
                      <div class="form-group">
                   	 <label for="exampleInputEmail1">업로드할 파일을 끌어다 놓으세요.</label>
                    <div class="fileDrop"></div>
                    </div>
                      
                    <div class="box-footer">
                    	
                    	<p>파일 이름을 선택하면 원본 이미지를 볼 수 있어요.</p>
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
    <!-- validator 
    <script src="${pageContext.request.contextPath}/resources/place/vendors/validator/validator.js"></script>  -->
    <!-- Dropzone.js -->
    <script src="${pageContext.request.contextPath}/resources/place/vendors/dropzone/dist/dropzone.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{fullName}}'>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"> <i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
    </script>
    
    <script>
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
    
	/* 파일 불러와서 보이게 하는 부분 */
    var placeId = ${place.placeId};
    var template = Handlebars.compile($("#templateAttach").html());
    
    
    $.getJSON("${pageContext.request.contextPath}/place/getFile.do?placeId="+placeId, function(list){
    	
    	$(list).each(function(){
    		var fileInfo = getFileInfo(this);
    		var html = template(fileInfo);
    		$(".uploadedList").append(html);
    	});
    });
    
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
	
	$("#modifyForm").submit(function(event){
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
    
    </script>
    
</body>
</html>