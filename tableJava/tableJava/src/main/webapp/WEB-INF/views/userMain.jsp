<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 메인 화면</title>
	<link rel="stylesheet" href="css/userMain.css">
	<script type="text/javascript"
			src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>

		// 햄버거 메뉴 스크립트
		$(document).ready(function () {
			let subToggle = true;

			$(".menu").click(function () {
				const $submenu = $(".sub");
				if (subToggle) {
					$submenu.stop().slideDown(300);
				} else {
					$submenu.stop().slideUp(300);
				}
				subToggle = !subToggle;
			});

			// 다크모드
			$('.dark-mode-btn').click(function () {
				$('body').toggleClass('dark-mode');
				$('#dark-mode-style').attr('href', $('body').hasClass('dark-mode') ? 'css/dark-mode.css' : '');
			});

			// 추천리스트 페이지네이션 스크립트
			const itemWidth = $('.listDiv').outerWidth(true);
			let currentPosition = 0;
			const numItems = $('.listDiv').length;
			const containerWidth = $('.list-section').width();
			const totalWidth = numItems * itemWidth;

			$('.listDiv-container').width(totalWidth);

			function continuousSlide() {
				currentPosition += 1; // 슬라이드 속도 제어
				if (currentPosition >= totalWidth - containerWidth) {
					currentPosition = 0;
				}
				$('.listDiv-container').css('left', -currentPosition + 'px');
			}

			let continuousSlideInterval = setInterval(continuousSlide, 20);

			$('.prev-button').click(function () {
				clearInterval(continuousSlideInterval); // 버튼 클릭 시 슬라이드 멈춤
				slideTo(currentPosition - containerWidth / 5);
				continuousSlideInterval = setInterval(continuousSlide, 20);
			});

			$('.next-button').click(function () {
				clearInterval(continuousSlideInterval);
				slideTo(currentPosition + containerWidth / 5);
				continuousSlideInterval = setInterval(continuousSlide, 20);
			});

			// 버튼 클릭 시 슬라이드 함수 호출
			function slideTo(position) {
				position = Math.min(Math.max(position, 0), totalWidth - containerWidth);
				$('.listDiv-container').animate({ left: -position }, 500);
				currentPosition = position;
			}

			// 마우스가 슬라이드 영역에 들어오면 슬라이드 멈춤
			$('.list-section').mouseenter(function () {
				clearInterval(continuousSlideInterval);
			});

			// 마우스가 슬라이드 영역에서 나가면 슬라이드 다시 시작
			$('.list-section').mouseleave(function () {
				continuousSlideInterval = setInterval(continuousSlide, 20);
			});

			// 폼 제출 관련 처리
			const form = document.getElementById("frm");
			form.addEventListener('click', function (event) {
				form.submit();
			});

		});
	</script>

</head>
<body>
<div class="nav">
	<img src="image/logo1.png" alt="로고 이미지">
	<div class="buttons-container">
		<form method="post" action="userMainPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit">홈</button>
		</form>
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
			<button type="submit">마이 페이지</button>
		</form>
	</div>
	<div class="menu">
		<span>☰</span>
		<ul class="sub">
			<li>
				<button class="dark-mode-btn">다크 모드</button>
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
<div class="container">
	<div class="containerDiv">
		<div class="titleDiv">
			<div>${user.uName} 님 안녕하세요 !!</div>
			<div class="search-box">
				<form method="post" action="search" class="search-form">
					<input type="text" id="keywords" name="keywords" placeholder="식당 이름을 입력하세요" required>
					<input type="hidden" name="userId" value="${userId }">
					<input type="submit" value="검색" class="search-button">
				</form>
			</div>
		</div>
		<div class="controls prev-controls">
			<button class="prev-button">이전</button>
		</div>
		<div class="list-section">
			<div class="labelDiv">
				인기 식당 TOP 10
			</div>
			<div class="listDiv-container">
				<div class="listDiv-wrapper">
					<c:forEach items="${recommendList}" var="restaurant">
						<form method="post" action="restaurantDetail" id="frm">
							<input type="hidden" name="userId" value="${userId}">
							<input type="hidden" name="restaurantId" value="${restaurant.rId}">
							<input type="hidden" name="keywords" value="${restaurant.rName}">
							<div class="listDiv">
								<div class="listDiv-list">
									<div id="listDivImage">
										<img src="${restaurant.fileName}">
									</div>
									<div>${restaurant.rName}</div>
									<div>${restaurant.rCity}</div>
									<div>${restaurant.rAddress}</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="controls next-controls">
			<button class="next-button">다음</button>
		</div>
	</div>
</div>
<div class="lowerDiv">
	<div class="todayRestaurantDiv">
		<div class="labelDiv_">
			오늘의 추천 식당
		</div>
		<div class="todayRestaurant">
			<div class="resDiv">
				<div>
					<h2>${randomRestaurant.rName}</h2>
					<img src="image/placeholder.png">
					<h4>${randomRestaurant.rCity}시 ${randomRestaurant.rAddress}</h4>
					<img src="image/phone.png">
					<h4>${randomRestaurant.rNumber}</h4>
				</div>
			</div>
			<div class="reviewDiv">
				<div>
					<img src="image/star.png">
					<h3>${randomReview.uId}님의 리뷰</h3>
					<h4>${randomReview.review}</h4>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>