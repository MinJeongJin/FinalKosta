<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
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
    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/resources/schedule/build/css/custom.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>
    
    <script id="template" type="text/x-handlebars-template">
	<img style="width: 100%; display: block;" src="{{getLink}}" alt="image"/>
	</script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      
		<%@ include file="/views/common/sideBar.jspf"%>
   
        <!-- page content -->
        <div class="right_col" role="main" style="padding-left:70px;">
          <div class="">
            <div class="page-title">
              <div class="title_left" style="color:black">
                <h3><strong> 모임 장소  </strong></h3>
                
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <select id="sel">
				    <option value="1">상호명</option>
				    <option value="2">지역명</option>
				</select>
                  <div class="input-group">
                    <input id="searchText" type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="search();">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="w3-section w3-bottombar "></div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                     <h4>스터디 공간을 알려드릴게요</h4> 
                     
                    <div class="clearfix"></div>
                    
                  </div>
                  <div class="x_content">

                    <div class="row">
                    
                   	<c:forEach items="${places }" var="place" varStatus="status">
	                      <div class="col-md-4">
	                        <div class="thumbnail" style="height: 500%;">
	                          <div class="image view view-first" style="height: 160px;">
	                          <a class="imageA${status.index}" href="${pageContext.request.contextPath}/place/detail.do?placeId=${place.placeId}">
		                          <script>
				                      var placeId = ${place.placeId};
				                      var template = Handlebars.compile($("#template").html());
			                    
			                          $.getJSON("${pageContext.request.contextPath}/place/getThumnailFile.do?placeId="+placeId, function(list){
			                        	$(list).each(function(){
			                    			var front = this.substr(0,12); // /2016/00/00/
			                    			var end = this.substr(14);
			                        		var html = template({getLink : "${pageContext.request.contextPath}/place/displayFile.do?fileName="+front + end});
			                        		$(".imageA${status.index}").append(html);
			                        	});
			                        });
		                          </script>
	                       	  </a>
                              
	                          </div>
	                          <div class="caption">
	                           <h2> <strong><p>${place.name }</p></strong> </h2>
	                           <img src="${pageContext.request.contextPath}/resources/images/location-icon.png" style="width: 20px;"/>${place.address }
	                          </div>
	                        </div>
	                      </div>
                   </c:forEach>

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

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>
    
    <script>
    function search(){
    	var searchText = document.getElementById('searchText').value;
    	
    	if($('#sel option:selected').val() == ('1')){
    		location.href="${pageContext.request.contextPath}/place/searchByName.do?placeName=" + searchText;
    	} else {
    		location.href="${pageContext.request.contextPath}/place/searchByAddress.do?placeAddress=" + searchText;
    	}
    	
    }
    </script>
  </body>
</html>
