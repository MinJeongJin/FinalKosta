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
    <link href="${pageContext.request.contextPath}/resources/schedule/build/css/custom.min.css" rel="stylesheet">

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
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="col-md-7 col-sm-7 col-xs-12">
                      <div class="product-image">
                        <img class="mySlides" src="${pageContext.request.contextPath}/resources/place/img/img_1.jpg" alt="이미지" />
                        <img class="mySlides" src="${pageContext.request.contextPath}/resources/place/img/img_3.jpg" alt="이미지" />
                        <img class="mySlides" src="${pageContext.request.contextPath}/resources/place/img/img_5.jpg" alt="이미지" />
                      </div>
                      <div class="product_gallery">
                      	<a>
                          <img class="demo" src="${pageContext.request.contextPath}/resources/place/img/img_1.jpg" alt="이미지" onclick="currentDiv(1)"/>
                        </a>
                        <a>
                          <img class="demo" src="${pageContext.request.contextPath}/resources/place/img/img_3.jpg" alt="이미지" onclick="currentDiv(2)"/>
                        </a>
                        <a>
                          <img class="demo" src="${pageContext.request.contextPath}/resources/place/img/img_5.jpg" alt="이미지" onclick="currentDiv(3)"/>
                        </a>
                        <!-- <a>
                          <img src="images/prod-4.jpg" alt="..." />
                        </a>
                        <a>
                          <img src="images/prod-5.jpg" alt="..." />
                        </a> -->
                      </div>
                    </div>

                    <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

                      <h3 class="prod_title">장소 주소</h3>
                      <br>
<!-- 
                      <p>장소 주소</p>
                      <br />
					  <p>장소 전화번호</p>
                      <br />
 -->
                      <div class="">
                        <div class="product_price">
                          <h1 class="price">장소 이름</h1>
                          <br /><br>
                          <span class="price-tax">장소 전화번호</span>
                          <br>
                        </div>
                      </div>

                    </div>
                   
                    <div class="col-md-12">

                      <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">소개</a>
                          </li>
                          <!-- <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">시설 안내</a>
                          </li> -->
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">위치</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                            <div class="text_box">
								<h2 class="h_copy">댄스&#44; 연기&#44; 회의 등등 을 할수 있는 공간</h2>
								<h3 class="h_intro">공간 소개</h3>
								<p class="p_intro">
									시간대 별로 가격 다릅니다<br /> <br />A홀 7000~14000원<br />
									<br />B홀 5000~8000원<br /> <br />충격을 흡수해수는 댄스플로어
									시공<br /> <br /> <br />홍대역도보 4분거리 <br /> <br />넓은
									주차공간<br /> <br />카드결제가 안되시는 010-7762-6788로 연락주세요<br />
									<br />1시간대관도 연락주세요
								</p>

								<ul class="info_list officehours">
									<li><span class="tit">이용시간</span> <span class="data">0~24시</span></li>
									<li><span class="tit">휴무일</span> <span class="data"> 없음 </span></li>
								</ul>
							</div>
                          </div>
                          <!-- <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                            <div class="text_box">
								<h3 class="h_intro">시설 안내</h3>
								<ol class="info_list">

									<li><strong class="tit">1</strong><span class="data">거울</span></li>

									<li><strong class="tit">2</strong><span class="data">오디오</span></li>

									<li><strong class="tit">3</strong><span class="data">발레바</span></li>

									<li><strong class="tit">4</strong><span class="data">난방기</span></li>

									<li><strong class="tit">5</strong><span class="data">에어컨</span></li>

									<li><strong class="tit">6</strong>
									<span class="data">주차장 (1시간만 무료 입니다 . 이후부터 30분당1000원)</span></li>
								</ol>
							</div>
                          </div> -->
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                           <div class="detail_box map_box">
								<h3 class="h_intro blind">공간 위치 정보</h3>
								<div class="host_profile">
									<div class="inner">
										<div class="sp_location">
											<input type="hidden" name="spcLat" id="spcLat" value="37.560177" /> 
											<input type="hidden" name="spcLng" id="spcLng" value="126.92085" />
											<p class="sp_name">이야호연습실 홍대점 -큰홀&#44;작은홀</p>
											<p class="sp_address">서울특별시 마포구 연남동 565-15&nbsp;지하 (사우나 있는 건물)</p>
											<p class="sp_homepage">
												<a href="" target="_blank" alt="새창열기"></a>
											</p>
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
												<!-- <a href="javascript:void(0);" _lat="37.560177"_lng="126.92085"
													class="btn btn_rounded btn_navi nclk" id="_contact_navi" _nclk="end.navi"> 
													<span class="btn_inner"> 
													<i class="ico_navi sp_icon"></i>내비게이션
												</span>
												</a> -->
											</div>
										</div>

									</div>
								</div>
								
								<!-- daum map api -->
								<div id="map" style="width:100%;height:350px;"></div>
								
								
								<!-- 스페이스 쉐어 -->
								<!-- 지도영역  -->
								<ul class="mapArea"> 
								<li class="normalMap">
								<div id="mapArea" alt="지도" style="width:50%;height:300px; margin-right:1px;"></div>
								<button id="mapAreaLink">지도 크게보기</button>
								</li> 
								<li class="roadMap"><div id="roadviewArea" alt="로드맵" style="width:50%;height:300px;">
								</div>
								<button id="roadviewAreaLink">로드뷰 크게보기</button></li> </ul>
								<!-- 지도끝 -->
								 
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
    <script src="//apis.daum.net/maps/maps3.js?apikey=ab42606eabf146a2840ea3e9b21a2ac0"></script>
	
  <!-- <script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div의 id
    	mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성.
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	map.relayout();
	</script> -->
    
    
   <script type="text/javascript">
		var position = new daum.maps.LatLng('37.5593135185', '127.004993467');
		var daum_map_x = '37.5593135185';
		var daum_map_y = '127.004993467';
		var roadview_data = '';
		var roadview_update_flag = 'N';
			
		var map = new daum.maps.Map(document.getElementById('mapArea'), {
			center: position
			,level: 6
		});
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		var mapTypeControl = new daum.maps.MapTypeControl();
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
	
		var marker = new daum.maps.Marker({
			position: position
		});
		marker.setMap(map);	
	
		var roadview_obj = {};
		if(roadview_data != "" && roadview_update_flag == "Y") {
			var roadview_arr = roadview_data.split(",");
			var roadview_length = roadview_arr.length;

			switch(roadview_length) {
			case 5:
				roadview_obj = {pan:roadview_arr[2], tilt:roadview_arr[3], zoom:roadview_arr[4]};
				position = new daum.maps.LatLng(roadview_arr[0], roadview_arr[1]);
				break;
			default:
				roadview_obj = {pan:roadview_arr[0], tilt:roadview_arr[1], zoom:roadview_arr[2]};
				break;
			}
			
		}else {
			roadview_obj = {pan:0, tilt:0, zoom:0};
		}
		
		var rc = new daum.maps.RoadviewClient();
		var rv = new daum.maps.Roadview(document.getElementById("roadviewArea"), roadview_obj);
	
		rc.getNearestPanoId(position, 50, function(panoid) {
			rv.setPanoId(panoid);
		});		
		
		
		$("#mapAreaLink").click(function(){
			var url = 'http://map.daum.net/link/map/' + encodeURIComponent(spaceShareObj.spaceInfo.space_title.replace(/,/g,'')) + ','+daum_map_x+','+daum_map_y;
			var openNewWindow = window.open("about:blank");
			openNewWindow.location.href = url;
		});
		
		$("#roadviewAreaLink").click(function(){
		    var panoId = rv.getPanoId(); //현 로드뷰의 panoId값을 가져옵니다.
		    var viewpoint = rv.getViewpoint(); //현 로드뷰의 viewpoint(pan,tilt,zoom)값을 가져옵니다.
		    
		    var openNewWindow = window.open("about:blank");
		    openNewWindow.location.href = 'http://map.daum.net/?panoid='+panoId+'&pan='+viewpoint.pan+'&tilt='+viewpoint.tilt+'&zoom='+viewpoint.zoom; // Daum 지도 로드뷰로 보내는 링크		
		});	
		
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}

		function currentDiv(n) {
		  showDivs(slideIndex = n);
		}

		function showDivs(n) {
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("demo");
		  if (n > x.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = x.length}
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";
		  }
		   x[slideIndex-1].style.display = "block";
		}
		
	</script>
	
	<script>
	</script>
    

  </body>
</html>
