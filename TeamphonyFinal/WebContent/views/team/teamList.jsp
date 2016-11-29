<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>


<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="teamListPage.css" type="text/css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link href="${pageContext.request.contextPath}/resources/css/mainPage.css" rel="stylesheet">

</head>

<body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <label class="navbar-brand">Teamphony</label>
            </div>


            <ul class="nav navbar-nav">

                <li><a href="#" data-toggle="modal" data-target="#myModal">팀 생성</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">로그아웃</a></li>

            </ul>

            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="number" maxlength="4" class="form-control" placeholder="팀 코드 입력">
                </div>
                <button type="submit" class="btn btn-default">검색</button>
            </form>

        </div>
    </nav>


    

    <div id="wrapper-container">

        <div id="contents">
            <fieldset id="field">

                <legend>
                    <h2 id="title">팀 목록</h2></legend>


                <figure class="white">
                    <a href="#">
                        <div id="wrapper-part-info">
                            <div class="part-info-image"></div>
                            <div id="part-info">Test</div>
                        </div>
                    </a>
                </figure>



            </fieldset>
        </div>

    </div>






    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">

        <form action="${pageContext.request.contextPath}/team/create.do" method="post">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title">
							팀 생성</h2>
                    </div>
                    <div class="modal-body">
                        <p>
                            <input type="text" class="form-control" name="name" placeholder="팀 이름">
                        </p>
                        <p>
                            <input type="number" class="form-control" name="cycle" placeholder="평가주기">
                        </p>
                        <p>
                            <input type="date" class="form-control" name="endDate" placeholder="평가 만료기간">
                        </p>
                    </div>
                    <div class="modal-footer">

                        <button type="submit" class="btn btn-info btn-lg">생성</button>
                        <button type="button" class="btn btn-info btn-lg">취소</button>
                    </div>
                </div>

            </div>

        </form>

    </div>










    <script>
        function getActualHeight() {
            var actualHeight = window.innerHeight ||
                document.documentElement.clientHeight ||
                document.body.clientHeight ||
                document.body.offsetHeight;

            return actualHeight;
        }


        window.onload = function () {

            document.getElementById("field").style.height = getActualHeight() / 2 + 'px';
        }
    </script>

</body>

</html>