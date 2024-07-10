<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
	<link rel="stylesheet" href="css/search.css">
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

	$("#searchIcon").click(function () {
		toggleSearchBar();
	});

	function toggleSearchBar() {
		const searchBar = $(".search-form");
		searchBar.toggleClass('active');
		const isOpen = searchBar.hasClass('active');
		if (isOpen) {
			$("#searchIcon").attr('src', './image/search.png'); // 검색창이 열리면 아이콘 변경
		} else {
			$("#searchIcon").attr('src', './image/search.png'); // 검색창이 닫히면 아이콘 원래대로 변경
		}
	}
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
			<button type="submit" >마이 페이지</button>
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
<div class="container">
	<div class="containerDiv">
		<div class="searchBar">
			<div class="searchIcon">
				<img src="./image/search.png" alt="Search Icon" id="searchIcon" onclick="toggleSearchBar()">
			</div>
			<form method="post" action="search" class="search-form">
				<input type="text" value="${keywords }" name="keywords">
				<input type="hidden" value="${userId }" name="userId">
				<button type="submit" class="search-button">검색</button>
			</form>
		</div>
		<div class="search_result">
			<c:forEach items="${searchResult}" var="result">
				<div class="resultDiv">
					<div class="labelDiv">
						<h3>${result.rName }</h3>위치 - ${result.rCity } <br>
					</div>
					<div class="btnDiv">
						<form method="post" action="restaurantDetail">
							<input type="hidden" name="restaurantId" value="${result.rId }">
							<input type="hidden" name="userId" value="${userId }">
							<input type="hidden" name="keywords" value="${keywords}">
							<button type="submit">식당 상세 보기</button>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>