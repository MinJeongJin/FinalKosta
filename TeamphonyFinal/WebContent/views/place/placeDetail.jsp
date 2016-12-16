<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Teamphony !</title>

	<!-- contents css -->
	<link rel="stylesheet" href="https://ssl.pstatic.net/spacecloud/static/web/css/deploy/20161129053144/min/guest.min.css">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/place/custom.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/resources/place/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/place/js-image-slider.js" type="text/javascript"></script>

	 <style>
	    .screen_out {display:block;overflow:hidden;position:absolute;left:-9999px;width:1px;height:1px;font-size:0;line-height:0;text-indent:-9999px}
	    .wrap_content {overflow:hidden;height:330px}
	    .wrap_map {width:50%;height:300px;float:left;position:relative}
	    .wrap_roadview {width:50%;height:300px;float:left;position:relative}
	    .wrap_button {position:absolute;left:15px;top:12px;z-index:2}
	    .btn_comm {float:left;display:block;width:70px;height:27px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/sample_button_control.png) no-repeat}
	    .btn_linkMap {background-position:0 0;}
	    .btn_resetMap {background-position:-69px 0;}
	    .btn_linkRoadview {background-position:0 0;}
	    .btn_resetRoadview {background-position:-69px 0;}
	    .pre_contents {font-family: NanumBarunGothic;font-size:13px;line-height:21px;color:#656565;word-break:break-all;word-wrap:break-word;background-color: white;border-color: white;}
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
                <h3>모임 장소</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                  
                  <!-- 관리자모드 -->
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a style="visibility: hidden;" class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a style="visibility: hidden;" class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="${pageContext.request.contextPath}/place/revise.do?placeId=${place.placeId}">수정</a>
                          </li>
                          <li><a onclick="deleteFile(); deletePlace();">삭제</a>
                          </li>
                        </ul>
                      </li>
                      
                    </ul>
                    
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                     <div class="col-md-7 col-sm-7 col-xs-12">
                      <div id="sliderFrame">
				        <div id="slider">
				           <!-- handlbars -->
				        </div>
				        <!--thumbnails-->
				        <div id="thumbs">
				          <!-- handlbars -->
				        </div>
				    </div>
                    </div> 

                    <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

                      <h3 class="prod_title">${place.address }</h3>
                      <br>
                      <div class="">
                        <div class="product_price">
                          <h1 class="price">${place.name }</h1>
                          <br /><br>
                          <span class="price-tax">${place.phoneNum }</span>
                          <br>
                        </div>
                      </div>

                    </div>
                   
                    <div class="col-md-12">

                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">소개</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">위치</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <div class="text_box">
								<h3 class="h_intro">공간 소개</h3>
								<pre class="pre_contents">${place.contents }</pre>

								<ul class="info_list officehours">
									<li><span class="tit">이용시간</span> <span class="data">${place.businessHour }</span></li>
									<li><span class="tit">휴무일</span> <span class="data"> ${place.holiday } </span></li>
								</ul>
							</div>
                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                           <div class="detail_box map_box">
								<h3 class="h_intro blind">공간 위치 정보</h3>
								<div class="host_profile">
									<div class="inner">
										<div class="sp_location">
											<p class="sp_name">${place.name }</p>
											<p class="sp_address">${place.address }</p>
										</div>

										<div class="row" id="_contact">
											<div class="col col6">
												<a href="javascript:void(0);" class="btn btn_rounded btn_call nclk"
													id="_contact_call" _nclk="end.call">
													<span class="btn_inner">
													<i class="ico_call sp_icon"></i>전화걸기</span>
												</a>
											</div>
											<div class="col col6">
												<a href="javascript:void(0);" _lat="37.560177" lng="126.92085" 
												class="btn btn_rounded btn_way nclk" id="_contact_map" _nclk="end.route"> 
												<span class="btn_inner way"> 
												<i class="ico_way sp_icon"></i>길찾기
												</span>
												</a>
											</div>
											<div class="col col6">
											</div>
										</div>

									</div>
								</div>
								
								<div class="wrap_content">
								    <div class="wrap_map">
								        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
								        <div class="wrap_button">
								            <a href="javascript:;" class="btn_comm btn_linkMap" target="_blank" onclick="moveDaumMap(this)"><span class="screen_out">지도 크게보기</span></a> <!-- 지도 크게보기 버튼입니다 -->
								            <a href="javascript:;" class="btn_comm btn_resetMap" onclick="resetDaumMap()"><span class="screen_out">지도 초기화</span></a> <!-- 지도 크게보기 버튼입니다 -->
								        </div>
								    </div>
								    <div class="wrap_roadview">
								        <div id="roadview" style="width:100%;height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
								        <div class="wrap_button">
								            <a href="javascript:;" class="btn_comm btn_linkRoadview" target="_blank" onclick="moveDaumRoadview(this)"><span class="screen_out">로드뷰 크게보기</span></a> <!-- 로드뷰 크게보기 버튼입니다 -->
								            <a href="javascript:;" class="btn_comm btn_resetRoadview" onclick="resetRoadview()"><span class="screen_out">로드뷰 크게보기</span></a> <!-- 로드뷰 리셋 버튼입니다 -->
								        </div>
								    </div>
								</div>
								
							</div>
                          </div>
                        </div>
                      </div>

                    </div>
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
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>
    
	<!-- Daum map API -->
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ab42606eabf146a2840ea3e9b21a2ac0&libraries=services"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <script id="templateImage" type="text/x-handlebars-template">
	<a data-src="{{fullName}}" class="lazyImage" href="{{getLink}}"></a>
	</script>
	
	<script id="templateGallary" type="text/x-handlebars-template">
	<div class="thumb"><img src="{{getLink}}" /></div>
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
	
	var placeId = ${place.placeId};
	var templateImage = Handlebars.compile($("#templateImage").html());
	var templateGallary = Handlebars.compile($("#templateGallary").html());
	
	$.getJSON("${pageContext.request.contextPath}/place/getFile.do?placeId="+placeId, function(list){
    	
    	$(list).each(function(){
    		var fileInfo = getFileInfo(this);
    		var html = templateImage(fileInfo);
    		var galleryHtml = templateGallary(fileInfo);
    		$("#slider").append(html);
    		$("#thumbs").append(galleryHtml);
    	});
    });
	</script>
	
	<!-- 지도 script -->
 	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	var coords;
	// 주소로 좌표를 검색합니다
	geocoder.addr2coord('${place.address}', function(status, result) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var mMarker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var mLabel = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${place.name}</div>'
	        });
	        mLabel.open(map, mMarker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	    
	    var rvContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div
	 	var rv = new daum.maps.Roadview(rvContainer); // 로드뷰 객체 생성
	 	var rc = new daum.maps.RoadviewClient(); // 좌표를 통한 로드뷰의 panoid를 추출하기 위한 로드뷰 help객체 생성
	 	var rvResetValue = {} //로드뷰의 초기화 값을 저장할 변수
	 	rc.getNearestPanoId(coords, 50, function(panoId) {
	 	    rv.setPanoId(panoId, coords);//좌표에 근접한 panoId를 통해 로드뷰를 실행합니다.
	 	    rvResetValue.panoId = panoId;
	 	});
	 	
	 // 로드뷰 초기화 이벤트
		daum.maps.event.addListener(rv, 'init', function() {

		    // 로드뷰에 올릴 마커를 생성합니다.
		    var rMarker = new daum.maps.Marker({
		        position: coords,
		        map: rv //map 대신 rv(로드뷰 객체)로 설정하면 로드뷰에 올라갑니다.
		    });

		    // 로드뷰에 올릴 장소명 인포윈도우를 생성합니다.
		    var rLabel = new daum.maps.InfoWindow({
		        position: coords,
		        content: '${place.name}'
		    });
		    rLabel.open(rv, rMarker);

		    // 로드뷰 마커가 중앙에 오도록 로드뷰의 viewpoint 조정 합니다.
		    var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
		    
		    // 마커의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
		    var viewpoint = projection.viewpointFromCoords(rMarker.getPosition(), rMarker.getAltitude());
		    rv.setViewpoint(viewpoint); //로드뷰에 뷰포인트를 설정합니다.

		    //각 뷰포인트 값을 초기화를 위해 저장해 놓습니다.
		    rvResetValue.pan = viewpoint.pan;
		    rvResetValue.tilt = viewpoint.tilt;
		    rvResetValue.zoom = viewpoint.zoom;
		});
	 
	});  
	
	/* var rvContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div
 	var rv = new daum.maps.Roadview(rvContainer); // 로드뷰 객체 생성
 	var rc = new daum.maps.RoadviewClient(); // 좌표를 통한 로드뷰의 panoid를 추출하기 위한 로드뷰 help객체 생성
 	var rvResetValue = {} //로드뷰의 초기화 값을 저장할 변수
 	rc.getNearestPanoId(coords, 50, function(panoId) {
 	    rv.setPanoId(panoId, coords);//좌표에 근접한 panoId를 통해 로드뷰를 실행합니다.
 	    rvResetValue.panoId = panoId;
 	});  */
	
	//지도 이동 이벤트 핸들러
	function moveDaumMap(self){
	    
	    var center = map.getCenter(), 
	        lat = center.getLat(),
	        lng = center.getLng();

	    self.href = 'http://map.daum.net/link/map/' + encodeURIComponent('${place.name}') + ',' + lat + ',' + lng; //Daum 지도로 보내는 링크
	}

	//지도 초기화 이벤트 핸들러
	function resetDaumMap(){
	    map.setCenter(coords); //지도를 초기화 했던 값으로 다시 셋팅합니다.
	    map.setLevel(mapOption.level);
	}

	//로드뷰 이동 이벤트 핸들러
	function moveDaumRoadview(self){
	    var panoId = rv.getPanoId(); //현 로드뷰의 panoId값을 가져옵니다.
	    var viewpoint = rv.getViewpoint(); //현 로드뷰의 viewpoint(pan,tilt,zoom)값을 가져옵니다.
	    self.href = 'http://map.daum.net/?panoid='+panoId+'&pan='+viewpoint.pan+'&tilt='+viewpoint.tilt+'&zoom='+viewpoint.zoom; //Daum 지도 로드뷰로 보내는 링크
	}

	//로드뷰 초기화 이벤트 핸들러
	function resetRoadview(){
	    //초기화를 위해 저장해둔 변수를 통해 로드뷰를 초기상태로 돌립니다.
	    rv.setViewpoint({
	        pan: rvResetValue.pan, tilt: rvResetValue.tilt, zoom: rvResetValue.zoom
	    });
	    rv.setPanoId(rvResetValue.panoId);
	} 
	</script>
   
 
	<script>
	// 삭제버튼 클릭시 file 삭제
	function deleteFile(){
		var arr=[];
		$("#slider a").each(function(index){
			arr.push($(this).attr("data-src"));
		});
		if(arr.length > 0){
			$.post("${pageContext.request.contextPath}/place/deleteAllFiles.do", {files:arr}, function(){
			
			});
		}
	}
	// 삭제버튼 클릭시 place 삭제()
	function deletePlace(){
		var id = ${place.placeId};
		location.href = "${pageContext.request.contextPath}/place/erase.do?placeId=" + ${place.placeId};
	}
	
	</script>
	
	
  </body>
</html>
