<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료 화면</title>
	<link rel="stylesheet" href="css/bookSuccess.css">
</head>
<body>
	<div class="container">
		<div class="containerDiv">
			<div class="titleDiv">
				<h1>예약 완료 내역</h1>
			</div>
			<div class="bookDiv">
				예약한 식당 : ${book.rName } <br>
				예약 날짜 : ${book.rDate } <br>
				예약 시간 : ${book.rTime } <br>
				예약자 성함 : ${book.uName}<br>
				<c:choose>
					<c:when test="${book.rStatus == '1'}">
						예약 상태 : 예약 확정
					</c:when>
					<c:when test="${book.rStatus == '2'}">
						예약 상태 : 예약 취소
					</c:when>
					<c:when test="${book.rStatus == '3'}">
						예약 상태 : 예약 거절
					</c:when>
					<c:when test="${book.rStatus == '4'}">
						예약 상태 : 예약 종료
					</c:when>
					<c:otherwise>
						예약 상태 : 예약 대기
					</c:otherwise>
				</c:choose>
				<br>
				예약 인원 수 : ${book.aCount + book.kCount } 명 (성인 ${book.aCount}명 유아 ${book.kCount}명)<br>
				유모차 사용 : ${book.sCount } 개<br>
				휠체어 사용 : ${book.wCount } 개<br>
				요청 사항 : ${book.requirements } <br>
			</div>
			<div class="btnDiv">
				<form method="post" action="userBookListPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit" >확인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>