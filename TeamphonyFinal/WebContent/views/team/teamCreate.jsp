<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../../resources/css/style.css" rel="stylesheet">
</head>
<body>

	<h3>팀 등록</h3>

	<form action="makeTeam.do" method="post">
		<table class="table table-bordered">
			<colgroup>
				<col width="60" />
				<col width="100" />
				<col width="*" />
				<col width="150" />
				<col width="120" />
			</colgroup>
			<tr>
				<th>팀 이름</th>
				<td><input id="name" type="text" name="name" class="form-control" value=""></td>
			</tr>
			<tr>
				<th>팀 평가 주기</th>
				<td><input id="price" type="text" name="cycle" class="form-control" value=""
				
				placeholder = "예) 2주 라면  2 입력"
				
				></td>
			</tr>
			<tr>
				<th>평가 종료 기간</th>
				<td><input id="userLike" type="text" name="endDate" class="form-control" value=""
				
				placeholder = "yyyy-mm-dd"></td>
			</tr>

		</table>
		<button class="btn btn-primary" type="submit">추가</button>
	</form>

</body>
</html>
