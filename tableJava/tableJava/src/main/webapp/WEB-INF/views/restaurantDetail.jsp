<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="css/restaurantDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var msg = "${msg}";

	if (msg != null && msg != "") {
		alert(msg);
		request.removeAttribute("msg");
	}
</script>
</head>
<body>
	<div class="nav">
		<img src="image/logo1.png" alt="로고이미지">
		<div class="buttons-container">
			<form method="POST" action="userMain">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit">메인 화면</button>
			</form>
			<form method="POST" action="UserBookList">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit" name="action" value="bookList">예약 /
					웨이팅</button>
			</form>
			<form method="post" action="Notification">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit" name="action" value="userNotification">알림</button>
			</form>
			<form method="POST" action="MyPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit" name="action" value="getUserInfo">마이
					페이지</button>
			</form>

			<div class="logout">
				<button onclick="logout()">로그아웃</button>
			</div>
		</div>
	</div>
	<h1>식당 상세정보</h1>
	<div class="container">
		<div class="flex">
			<p class="img">식당 사진:${restaurant.rPhoto}</p>
			<div class="box">
				<p>식당 이름: ${restaurant.rName}</p>
				<p>도시: ${restaurant.rCity}</p>
				<p>주소: ${restaurant.rAddress}</p>
				<p>식당 전화번호: ${restaurant.rNumber}</p>
			</div>
		</div>
		<c:choose>
			<c:when test="${restaurant.rStatus == 'T' }">
				<div class="btns">
					<form method="post" action="bookPage">
						<input type="hidden" name="userId" value="${userId }"> <input
							type="hidden" name="restaurantId" value="${restaurantId }">
						<input type="hidden" name="restaurantName"
							value="${restaurant.rName }">
						<button type="submit" id="aaa" name="action" value="bookBtn">예약 하기</button>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="btns">
					<button value="bookBtn" disabled>예약 하기</button>
				</div>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${restaurant.wStatus == 'T' }">
				<div class="btns">
					<form method="post" action="waitPage">
						<input type="hidden" name="userId" value="${userId }"> <input
							type="hidden" name="restaurantId" value="${restaurantId }">
						<input type="hidden" name="restaurantName"
							value="${restaurant.rName }">
						<button type="submit" >웨이팅 하기</button>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="btns">
					<button disabled>웨이팅 하기</button>
				</div>
			</c:otherwise>
		</c:choose>
		<div>
			<form method="post" action="search">
				<input type="hidden" name="userId" value="${userId }">
				<input type="hidden" name="keywords" value="${keywords }">
				<button type="submit" id="backBtn" value="backBtn">뒤로 가기</button>
			</form>
		</div>
	</div>
</body>
</html>