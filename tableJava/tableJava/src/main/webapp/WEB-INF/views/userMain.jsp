<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인 화면</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f3274f01f7f59a2883492e9cd1c8599"></script>
</head>
<body>
	<div class="navbar">
		<button onclick="location.reload()">메인 화면</button>
		<form method="post" action="userBookListPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit">예약/웨이팅</button>
		</form>
		<form method="post" action="userNotificationPage">
        	<input type="hidden" name="userId" value="${userId }">
        	<button type="submit">알림</button>
        </form>
		<form method="post" action="userMyPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit" >마이 페이지</button>
		</form>
	</div>
	<div>
		<h1>${user.uName} 님 안녕하세요 !!!</h1>
	</div>
	<div class="search-section">
		<div class="search-div">
			<form method="post" action="search" class="search-form">
				<label>검색할 이름:</label> <input type="text" id="keywords"
					name="keywords" placeholder="식당 이름을 입력하세요" required> <input
					type="hidden" name="userId" value="${userId }"> <input
					type="submit" value="검색" class="search-button">
			</form>
		</div>
	</div>
	<div class="list-section">
		<ul id="restaurant-list">사용자 위치 기반 주위 식당 리스트
		</ul>
	</div>
</body>
</html>
