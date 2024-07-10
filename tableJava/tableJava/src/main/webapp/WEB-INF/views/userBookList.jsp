<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userBookList</title>
<link rel="stylesheet" href="css/userBookList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var msg = "${msg}";

	if (msg != null && msg != "") {
		alert(msg);
		request.removeAttribute("msg");
	}

	function cancelStatus(rId, uId, rName) {
		var restaurantId = rId;
		var userId = uId;
		var restaurantName = rName;

		var button = document.getElementById("cancelBtn");

		$.ajax({
			type : "POST",
			url : "cancelBook",
			data : {
				userId : userId,
				restaurantId : restaurantId,
				restaurantName : restaurantName
			},
			success : function(response) {
				alert("예약 취소 되었습니다.");
				button.value = "취소 완료";
				button.disabled = true;
				window.location.reload();
			},
			error : function() {
				alert("예약 취소에 실패했습니다. 다시 시도해주세요.");
			}
		});
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

		$('.dark-mode-btn').click(function () {
			$('body').toggleClass('dark-mode');

			// 테마 상태 저장
			if ($('body').hasClass('dark-mode')) {
				localStorage.setItem('theme', 'dark-mode');
			} else {
				localStorage.setItem('theme', '');
			}

			// 테마 적용 (선택사항)
			const theme = localStorage.getItem('theme');
			if (theme) {
				$('#dark-mode-style').attr('href', theme === 'dark-mode' ? 'css/dark-mode.css' : '');
			}
		});

// 페이지 로드 시 테마 복원 (선택사항)
		const theme = localStorage.getItem('theme');
		if (theme) {
			$('body').addClass(theme);
			$('#dark-mode-style').attr('href', theme === 'dark-mode' ? 'css/dark-mode.css' : '');
		}
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
			<button onclick="location.reload()">예약/웨이팅</button>
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
		<div class="optionDiv">
			<div class="bookOptionDiv">
				<button onclick="location.reload()">예약</button>
			</div>
			<div class="waitOptionDiv">
				<form method="post" action="userWaitListPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit">웨이팅</button>
				</form>
			</div>
		</div>
		<div class="contentDiv">
			<div class="labelDiv">
				<h1>예약 내역</h1>
			</div>
			<c:forEach items="${bookList}" var="book">
				<div class="bookDiv">
					<div class="bookContent">
						<div class="status"><h3>${book.rStatus }</h3></div>
						<div class="bookContentHead">
								<h3>${book.rName }</h3>
						</div>
						<div class="bookContentDiv">
							<div class="bookContentTail">
								일정  ${book.rDate } ${book.rTime } <br>
								성함  ${book.uName} <br>
								인원  ${book.aCount + book.kCount }명 <br>
								( 성인 ${book.aCount}명 + 유아 ${book.kCount}명 )
							</div>
							<div class="bookContentRequirement">
								유모차  ${book.sCount } <br>
								휠체어  ${book.wCount} <br><br>
								요청 사항 <br>
									${book.requirements }
							</div>
						</div>
					</div>
					<div class="bookBtnDiv">
						<c:if test="${book.rStatus == '예약 대기'}">
							<button type="button"
								onclick="cancelStatus('${book.rId}', '${userId }', '${book.rName}')"
								id="cancelBtn">예약 취소</button>
						</c:if>
						<c:if
							test="${book.rStatus == '예약 확정' || book.rStatus == '예약 취소' || book.rStatus == '예약 거절' || book.rStatus == '예약 종료' }">
							<button type="button" disabled>예약 취소</button>
						</c:if>
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