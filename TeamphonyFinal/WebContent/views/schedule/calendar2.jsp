<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Teamphony !  </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/schedule/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

    <!-- Custom styling plus plugins -->
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
                            <h3>일정관리</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                               
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Calendar Events <small>Sessions</small></h2>
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

                                    <div id='calendar'></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
        </div>
    </div>

    <%-- <!-- calendar modal -->
    <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
				<input id="scheduleId" name="scheduleId" type="hidden" value="">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">일정등록</h4>
                </div>
                        <form id="antoform" class="form-horizontal calender" role="form"
                        action="${pageContext.request.contextPath}/schedule/create.do" method="POST">
                <div class="modal-body">
                    <div id="testmodal" style="padding: 5px 20px;">
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">제목</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="title" name="title" placeholder="일정을 입력하세요.">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">장소</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="place" name="place" placeholder="만나실 곳을 입력하세요.">
                                </div>
                            </div>
                            
                            <div class="form-group">
                            	<label class="col-sm-3 control-label">일시</label>
                            	<div class="col-sm-9">
                                    <input type="date" id="startDay" name="startDay">
                                    <input type="time" id="startHour" name="startHour">
                                    <br><br>
                                    <input type="date" id="endDay" name="endDay">
                                    <input type="time" id="endHour" name="endHour">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">내용</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="5" id="contents" name="contents" placeholder="일정에 필요한 설명을 남기세요."></textarea>
                                </div>
                            </div>
                   		 </div>
              		  </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default antoclose" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary antosubmit">등록</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    
    <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel2">일정수정</h4>
                </div>
                <div class="modal-body">

                    <div id="testmodal2" style="padding: 5px 20px;">
                        <form id="antoform2" class="form-horizontal calender" role="form"
                        action="${pageContext.request.contextPath}/schedule/revise.do" method="POST">
                        <input id="scheduleId" name="scheduleId" type="hidden" value="${schedule.scheduleId }">	
                            <div class="form-group">
                                <label class="col-sm-3 control-label">제목</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="title2" name="title2" value="${schedule.title }">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">장소</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="place2" name="place2" value="${schedule.place }">
                                </div>
                            </div>
                            
                            <div class="form-group">
                            	<label class="col-sm-3 control-label">일시</label>
                            	<div class="col-sm-9">
                                    <input type="date" id="startDay" name="startDay" value="${schedule.starDate}">
                                    <input type="time" id="startHour" name="startHour" value=${schdedule.startTime }>
                                    <br><br>
                                    <input type="date" id="endDay" name="endDay" value=${schedule.endDate }>
                                    <input type="time" id="endHour" name="endHour" value=${schedule.endTime }>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">내용</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="5" id="contents2" name="contents2">${schedule.contents }</textarea>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary antosubmit2">수정</button>
                </div>
            </div>
        </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
    <!-- /calendar modal -->  --%>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/nprogress/nprogress.js"></script>
    <!-- FullCalendar -->
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/schedule/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/schedule/build/js/custom.min.js"></script>

    <!-- FullCalendar -->
    <script>
        $(window).load(function () {
            var date = new Date(),
                d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear(),
                started,
                categoryClass;

            var calendar = $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                eventLimit: true,
                selectable: true,
                selectHelper: true,
                select: function (start, end, allDay) {
                    /*  $('#fc_create').click(); */

                    started = start;
                    ended = end;

                    /* $(".antosubmit").on("click", function () {
                        var title = $("#title").val();
                        var place = $("#place").val();
                        var contents = $("#contents").val();

                        var eventData; 

                        categoryClass = $("#event_type").val();

                        if (title) {
                           eventData = {
                               title: title,
                               start: started,
                               end: ended,
                               place: place,
                               contents: contents,
                               allDay: allDay
                           };
                            calendar.fullCalendar('renderEvent', eventData, true); // make the event "stick"
                        }

                        $('#title').val('');
                        $('#place').val('');
                        $('#contents').val('');

                        calendar.fullCalendar('unselect');

                        $('.antoclose').click();

                        return false;
                    });    */
                },
                
               /*  eventClick: function (calEvent, jsEvent, view) {
                    $('#fc_edit').click();
                    $('#title2').val(calEvent.title);
                    $('#place2').val(calEvent.place);
                    $('#contents2').val(calEvent.contents);

                    categoryClass = $("#event_type").val();

                    $(".antosubmit2").on("click", function () {
                        calEvent.title = $("#title2").val();

                        calendar.fullCalendar('updateEvent', calEvent);
                        $('.antoclose2').click();
                    });

                    calendar.fullCalendar('unselect');
                }, 
                 */
                editable: true,
               
            });
        });
    </script>
    <!-- /FullCalendar -->
</body>

</html>
