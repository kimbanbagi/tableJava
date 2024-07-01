<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 알림 화면</title>
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
		});
	</script>
</head>
<body>
		<div class="nav navbar_main">
			<img src="image/logo1.png" alt="로고 이미지" class="navbar_logo">
			<div class="buttons-container navbar_links">
				<form method="POST" action="userMainPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit">메인 화면</button>
				</form>
				<form method="post" action="userBookListPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit">예약/웨이팅</button>
				</form>
				<button onclick="location.reload()">알림</button>
				<form method="POST" action="userMyPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit" >마이 페이지</button>
				</form>
			</div>
			<div class="menu">
				<span>☰</span>
				<ul class="sub">
					<li>
						<a href="#None">여기에</a>
					</li>
					<li>
						<a href="#None">무엇을</a>
					</li>
					<li>
						<a href="#None">넣을까요</a>
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
							<h3>${notification.rName }</h3>
						</div>
						<div class="commentDiv">
							<h4>${notification.comments }</h4>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
</body>
</html>