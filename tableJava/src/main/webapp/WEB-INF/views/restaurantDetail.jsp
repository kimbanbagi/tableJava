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

	$(document).ready(function() {
		let subToggle = true;

		$(".menu").click(function() {
			const $submenu = $(".sub");
			if (subToggle) {
				$submenu.stop().slideDown(300);
			} else {
				$submenu.stop().slideUp(300);
			}
			subToggle = !subToggle;
		});
	});
</script>
</head>
<body>
	<div class="nav">
		<img src="image/logo1.png" alt="로고이미지">
		<div class="buttons-container">
			<form method="POST" action="userMainPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit">홈</button>
			</form>
			<form method="POST" action="userBookListPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit" name="action" value="bookList">예약/웨이팅</button>
			</form>
			<form method="post" action="userNotificationPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit" name="action" value="userNotification">알림</button>
			</form>
			<form method="POST" action="userMyPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit" name="action" value="getUserInfo">마이
					페이지</button>
			</form>
		</div>
		<div class="menu">
			<span>☰</span>
			<ul class="sub">
				<li>
					<button>다크 모드</button>
				</li>
				<li>
					<form method="post" action="changePwdPage">
						<input type="hidden" name="userId" value="${userId}">
						<button type="submit">비밀번호 변경</button>
					</form>
				</li>
				<li>
					<form method="post" action="logout">
						<button type="submit">로그아웃</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
	<h1>식당 상세정보</h1>
	<div class="container">
		<div class="container_detail">
			<div class="flex">
				<img src="${restaurant.fileName}" class="img">
				<div class="box">
					<p style="font-weight: bold; font-size:22px;">${restaurant.rName}</p>
					<p style="font-weight: bold; font-size:18px;">${restaurant.rCity}시 ${restaurant.rAddress}</p>
					<p style="font-weight: bold; font-size:18px;">${restaurant.rNumber}</p>
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
							<button type="submit" class="aaa" name="action" value="bookBtn">예약 하기</button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="btns">
						<button value="bookBtn" class="aaa" disabled>예약 하기</button>
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
							<button type="submit" class="bbb" >웨이팅 하기</button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="btns">
						<button disabled class="bbb">웨이팅 하기</button>
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
			<div class="container_review">
				<h2>리뷰</h2>
				<c:forEach items="${reviewList}" var="review">
					<div class="reviewDiv">
						<div class="titleDiv">
							<div>
								<img src="image/star.png">
									${review.star}점
							</div>
							<div class="nickname">
									${review.uId}님의 리뷰
							</div>
						</div>
						<div class="commentDiv">
								${review.review}
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>