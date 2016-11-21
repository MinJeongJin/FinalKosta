<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.date {
	height: 100px;
	width: 100px;
}

table tr td {
	text-align: left;
	vertical-align: top;
}

.red {
	color: red;
}

.blue {
	color: blue;
}

ul {
	list-style-type: none;
	padding-left: 0;
	width: 150px
}
</style>
<body>
	<table border="3" style="width: 780px">

		<h1>2016.10 October</h1>
		<a href="InsertScheduleForm.jsp"> <input type="button"
			value="일정등록">
		</a>
		<colgroup>
			<col width="110px" />
			<col width="110px" />
			<col width="110px" />
			<col width="110px" />
			<col width="110px" />
			<col width="110px" />
			<col width="110px" />
		</colgroup>
		<tr>
			<th><h4>일</h4></th>
			<th><h4>월</h4></th>
			<th><h4>화</h4></th>
			<th><h4>수</h4></th>
			<th><h4>목</h4></th>
			<th><h4>금</h4></th>
			<th><h4>토</h4></th>
		</tr>
		<c:forEach step="1" begin="0" end="4" var="rowIdx">
			<tr class="date">
				<c:forEach step="1" begin="1" end="7" var="colIdx" varStatus="colSt">
					<c:set var="day" value="${(rowIdx*7) + colIdx }" />
					<c:choose>
						<c:when test="${day < 32 }">
							<td class="${colSt.last ? 'blue' : colSt.first ?  'red' : '' }">${day }
								<c:forEach items="${list }" var="list">
									<c:if test="${list.getDay() eq day }">
										<ul>
											<li>${list.title}</li>
										</ul>
									</c:if>
								</c:forEach>
							</td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>


