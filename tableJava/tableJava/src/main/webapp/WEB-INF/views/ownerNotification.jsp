<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사장님 알림 화면</title>
	<link rel="stylesheet" href="css/notification.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
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

			$('.dark-mode-btn').click(function () {
				$('body').toggleClass('dark-mode');
				$('#dark-mode-style').attr('href', $('body').hasClass('dark-mode') ? 'css/dark-mode.css' : '');
			});
		});
	</script>
</head>
<body>
		<div class="nav navbar_main">
			<img src="image/logo1.png" alt="로고 이미지" class="navbar_logo">
            <div class="buttons-container navbar_links">
				<form method="POST" action="ownerMainPage">
					<input type="hidden" name="userId" value="${userId }">
					<input type="hidden" name="restaurantId" value="${restaurantId }">
					<button type="submit">메인</button>
				</form>
				<form method="POST" action="ownerBookListPage">
					<input type="hidden" name="userId" value="${userId }">
					<input type="hidden" name="restaurantId" value="${restaurantId }">
					<button type="submit" >예약/웨이팅</button>
				</form>
				<form method="post" action="ownerNotificationPage">
					<input type="hidden" name="userId" value="${userId }">
					<input type="hidden" name="userId" value="${userId }">
					<input type="hidden" name="restaurantId" value="${restaurantId}">
					<button type="submit" name="action" value="userNotification">알림</button>
				</form>
				<form method="POST" action="ownerMyPage">
					<input type="hidden" name="userId" value="${userId }">
					<input type="hidden" name="restaurantId" value="${restaurantId }">
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
		<div class="labelDiv">
			<h1>알림</h1>
		</div>
		<div class="container">
			<div class="containerDiv">
				<c:forEach items="${notifications }" var="notification">
					<div class="notificationDiv">
						<div class="rNameDiv">
							<h3>${notification.uId }님</h3>
						</div>
						<div class="commentDiv">
							<h4>${notification.comments }</h4>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<footer class="footerContainer">
			<div class="workLinks">
				<ul>
					<li><a href="">회사소개</a>&emsp;|&nbsp;</li>
					<li><a href="">이용약관</a>&emsp;|&nbsp;</li>
					<li><a href="">개인정보처리방침</a>&emsp;|&nbsp;</li>
					<li><a href="">이메일무단수집거부</a>&emsp;|&nbsp;</li>
					<li><a href="">고정형 영상정보처리기긱 운영 및 관리방침</a>&emsp;|&nbsp;</li>
					<li><a href="">TABLE JAVA회원안내</a>&emsp;|&nbsp;</li>
					<li><a href="">배정기준</a>&emsp;|&nbsp;</li>
					<li><a href="">채용안내</a>&emsp;|&nbsp;</li>
					<li><a href="">광고/임대문의</a>&emsp;&nbsp;</li>
				</ul>
				<div class="footersen">
					<div>충청남도 천안시 동남구 대흥로 215 7층, 8층</div>
					<div>대표 이메일 humanec@naver.com | 고객센터 1566-9564 | 사업자등록번호 667-81-02135 | <a href="#"><span><u>사업자정보확인</u></span></a> </div>
					<div>대표이사 박춘보 | 개인정보 보호 책임자 차수 호스팅 제공자 휴먼교육센터</div>
					<div>Copyright &copy; HUMAN Cultureworks All Right Reserved. </div>
				</div>
			</div>
		</footer>
</body>
</html>