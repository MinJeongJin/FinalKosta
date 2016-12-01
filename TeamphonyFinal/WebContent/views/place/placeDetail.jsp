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
  <div class="wrap main">
   <!-- //gnb -->
   <div id="_root" style="overflow: hidden; width: 100%; height: 100%;">
     <div id="_container">
     <div id="spaceDetail" _path="/space" _position="1" _fit="false"_firstPosition="[0, 0]" _reload="true" class="_page">
	   <div class="inner_width">
		  <div class="detail_forms ">
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
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
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
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
										<iclass="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i
											class="fa fa-close"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
							<div class="col-md-7 col-sm-7 col-xs-12">
								<div class="product-image">
									<img
										src="${pageContext.request.contextPath}/resources/place/img/img_1.jpg"
										alt="..." />
								</div>
								<div class="product_gallery">
									<a> <img src="images/prod-2.jpg" alt="..." />
									</a> <a> <img src="images/prod-3.jpg" alt="..." />
									</a> <a> <img src="images/prod-4.jpg" alt="..." />
									</a> <a> <img src="images/prod-5.jpg" alt="..." />
									</a>
								</div>
							</div>
							<div class="col-md-5 col-sm-5 col-xs-12" style="border: 0px solid #e5e5e5;">
								<h3 class="prod_title">장소 이름</h3>
								<br>
								<p>장소 간략 설명 주소 전화번호</p>
								<br>
								<br>
								<div class="">
									<div class="product_price">
										<h1 class="price">가격?</h1>
										<span class="price-tax">시간당/인</span> <br>
									</div>
								</div>
							</div>
						<div class="col-md-12">

							<div class="" role="tabpanel" data-example-id="togglable-tabs">
								<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
									<li role="presentation" class="active">
									<a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">소개</a></li>
									<li role="presentation" class="">
									<a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">시설 안내</a></li>
									<li role="presentation" class="">
									<a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">지도</a></li>
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
									<div role="tabpanel" class="tab-pane fade"
										id="tab_content2" aria-labelledby="profile-tab">
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
									</div>
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

													<div class="row" id="_contact" _spaceId="3235" spcNm="이야호연습실 홍대점 -큰홀&#44;작은홀">
														<div class="col col4">
															<a href="javascript:void(0);" tel="050-7790-7080" class="btn btn_rounded btn_call nclk"
																id="_contact_call" _nclk="end.call">
																<span class="btn_inner">
																<i class="ico_call sp_icon"></i>전화걸기</span>
															</a>
														</div>
														<div class="col col4">
															<a href="javascript:void(0);" _lat="37.560177"
																_lng="126.92085"
																class="btn btn_rounded btn_way nclk"
																id="_contact_map" _nclk="end.route"> <span
																class="btn_inner way"> <i
																	class="ico_way sp_icon"></i>길찾기
															</span>
															</a>
														</div>
														<div class="col col4">
															<a href="javascript:void(0);" _lat="37.560177"
																_lng="126.92085"
																class="btn btn_rounded btn_navi nclk"
																id="_contact_navi" _nclk="end.navi"> <span
																class="btn_inner"> <i
																	class="ico_navi sp_icon"></i>내비게이션
															</span>
															</a>
														</div>
													</div>

												</div>
											</div>

									<div class="map" id="_map" _lat="37.560177"
												_lng="126.92085">
												<img id="_detailStaticMap" class="lazy"
													src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7">
												<div id="_mapLayer"></div>

												<div class="btn_util" id="_staticMap"
													_type="staticMap">
													<a href="javascript:void(0);" class="btn_lock"
														title="지도잠금설정"><i class="sp_icon ico_lock_on">지도잠금설정</i></a>
													<span class="btn_zoom"> <a
														href="javascript:void(0);" class="zoomin"
														title="지도확대"> <i class="sp_icon ico_zoomin">지도확대</i>
													</a> <a href="javascript:void(0);" class="zoomout"
														title="지도축소"> <i class="sp_icon ico_zoomout">지도축소</i>
													</a>
													</span>
												</div>
											</div>
										</div>

										<div class="layer_popup call" id="_telLayerinPc"
											style="display: none">
																<div class="popup_wrap">
																	<div class="pop_container">
																		<div class="call_info">
																			이야호연습실 홍대점 -큰홀&#44;작은홀<br> <a
																				href="javascript:void(0);">050-7790-7080</a>
																		</div>
																		<div class="btns full">
																			<a href="javascript:void(0);"
																				class="btn btn_full btn_default close">확인</a>
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
				</div>
			</div>
		</div>
	</div>

</div>
				<!-- /page content -->

			</div>
		</div>
	</div>

	<div class="dimmed"></div>
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>

	<script
		src="https://ssl.pstatic.net/spacecloud/static/web/js/deploy/20161129053144/min/jquery.min.js"></script>
</body>
</html>
