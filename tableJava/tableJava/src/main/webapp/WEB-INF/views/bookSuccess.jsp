<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료 화면</title>
</head>
<body>
	<form>
		<h1>예약 완료 내역</h1>
			예약한 식당 : ${book.rName } <br>
			예약 날짜 : ${book.rDate } <br>
			예약 시간 : ${book.rTime } <br>
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
			예약 인원 수 : ${book.aCount + book.kCount } 명 <br>
			유모차 사용 : ${book.sCount } 개<br>
			휠체어 사용 : ${book.wCount } 개<br>
			요청 사항 : ${book.requirements } <br>
	</form>
	<!-- 확인 버튼 추가. 클릭 시 예약 내역 리스트 페이지로 이동 -->
	<form method="post" action="userBookListPage">
		<input type="hidden" name="userId" value="${userId }">
		<button type="submit" >확인</button>
	</form>
</body>
</html>