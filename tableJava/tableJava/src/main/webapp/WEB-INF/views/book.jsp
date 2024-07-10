<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 화면</title>
	<link rel="stylesheet" href="css/book.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var a_count = parseInt($("#a_count").text()); // 성인 인원
		var k_count = parseInt($("#k_count").text()); // 유아 인원
		var s_count = parseInt($("#s_count").text()); // 유모차 개수
		var w_count = parseInt($("#w_count").text()); // 휠체어 개수

		// 성인 인원 증가/감소
		$('#a_increaseCount').on('click', function(event) {
			event.preventDefault();
			a_count++;
			$("#a_count").text(a_count);
			$('#hiddenAdultCount').val($("#a_count").text());
		});

		$('#a_decreaseCount').on('click', function(event) {
			event.preventDefault();
			if (a_count > 0) {
				a_count--;
				$("#a_count").text(a_count);
				$('#hiddenAdultCount').val($("#a_count").text());
			}
		});

		// 유아 인원 증가/감소
		$('#k_increaseCount').on('click', function(event) {
			event.preventDefault();
			k_count++;
			$("#k_count").text(k_count);
			$('#hiddenKidCount').val($("#k_count").text());
		});

		$('#k_decreaseCount').on('click', function(event) {
			event.preventDefault();
			if (k_count > 0) {
				k_count--;
				$("#k_count").text(k_count);
				$('#hiddenKidCount').val($("#k_count").text());
			}
		});

		// 유모차 개수 증가/감소
		$('#s_increaseCount').on('click', function(event) {
			event.preventDefault();
			s_count++;
			$("#s_count").text(s_count);
			$('#hiddenStroller').val($("#s_count").text());
		});

		$('#s_decreaseCount').on('click', function(event) {
			event.preventDefault();
			if (s_count > 0) {
				s_count--;
				$("#s_count").text(s_count);
				$('#hiddenStroller').val($("#s_count").text());
			}
		});

		// 휠체어 개수 증가/감소
		$('#w_increaseCount').on('click', function(event) {
			event.preventDefault();
			w_count++;
			$("#w_count").text(w_count);
			$('#hiddenWheelchair').val($("#w_count").text());
		});

		$('#w_decreaseCount').on('click', function(event) {
			event.preventDefault();
			if (w_count > 0) {
				w_count--;
				$("#w_count").text(w_count);
				$('#hiddenWheelchair').val($("#w_count").text());
			}
		});

		// 전 페이지로 돌아가기
		$("#goBackBtn").on('click', function(event) {
			event.preventDefault();
		})
	});

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
	<img src="image/logo1.png" alt="로고 이미지">
	<div class="buttons-container">
		<form method="post" action="userMainPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit">메인 화면</button>
		</form>
		<form method="post" action="userBookListPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit">예약 / 웨이팅</button>
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
<form action="book" method="post" id="frm">
	<input type="hidden" name="uId" value="${userId }">
	<input type="hidden" name="rId" value="${restaurantId }">
	<input type="hidden" name="rName" value="${restaurantName}">
	<div id="container">
		<div id="store_div">
			<img src="${restaurant.fileName}" class="photo">
			<div class="info">
				<h3>${restaurantName } </h3><br>
				<h3>${restaurant.rCity}시 ${restaurant.rAddress}</h3>
				<h3>${restaurant.rNumber}</h3>
			</div>
		</div>
		<div id="book_div">
			<div class="upperBookDiv">
				<div class="datetime">
					<h3>일정</h3>
					<label for="dateInput">날짜:</label>
					<input type="date" id="dateInput" name="rDate" class="styled-input" required><br>
					<label for="timeInput">시간:</label>
					<input type="time" id="timeInput" name="rTime" class="styled-input" required>
					<h3>예약자 성함</h3>
					<input id="nameInput" type="text" name="uName" size=5 value="${user.uName}" placeholder="${user.uName}" required> <br>
				</div>
				<div class="people">
					<h3>인원</h3>
					성인 &ensp;<button type="button" id="a_decreaseCount">-</button>
					<span id="a_count">0</span>
					<button type="button" id="a_increaseCount">+</button>
					<br>유아 &ensp;<button type="button" id="k_decreaseCount">-</button>
					<span id="k_count">0</span>
					<button type="button" id="k_increaseCount">+</button>
					<br>유모차<button type="button" id="s_decreaseCount">-</button>
					<span id="s_count">0</span>
					<button type="button" id="s_increaseCount">+</button>
					<br>휠체어<button type="button" id="w_decreaseCount">-</button>
					<span id="w_count">0</span>
					<button type="button" id="w_increaseCount">+</button>
					<input type="hidden" name="aCount" id="hiddenAdultCount" value="0">
					<input type="hidden" name="kCount" id="hiddenKidCount" value="0">
					<input type="hidden" name="sCount" id="hiddenStroller" value="0">
					<input type="hidden" name="wCount" id="hiddenWheelchair" value="0">
				</div>
			</div>
			<div class="lowerBookDiv">
				<div style="font-size: 18px; font-weight: bold" class="requirementDiv">
					<div>요청 사항</div>
					<textarea name="requirements" placeholder="요청 사항을 입력해주세요." id="textArea">요청 사항 없음</textarea>
				</div>
				<div class="btnsDiv">
					<button id="goBackBtn">뒤로가기</button>
					<button type="submit" id="bookBtn"  >예약하기</button>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="touch">

</div>
<script>
	document.getElementById('dateInput').value = new Date().toISOString().substring(0, 10);

	const currentDate = new Date();
	const timezoneOffset = currentDate.getTimezoneOffset();
	const KoreanTime = new Date(currentDate.getTime() + (timezoneOffset + 540) *60000);
	const formattedKST = KoreanTime.toISOString().slice(11, 16);
	document.getElementById('timeInput').value = formattedKST;
</script>
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