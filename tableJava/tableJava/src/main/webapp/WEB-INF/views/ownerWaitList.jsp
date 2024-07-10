<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ownerWaitList</title>
<link rel="stylesheet" href="css/ownerWaitList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 웨이팅 취소 메소드
	function cancelStatus(rId, wId, uId, rName) {
		var status = "3";
		var restaurantId = rId;
		var waitId = wId;
		var userId = uId;
		var rName = rName;

		$.ajax({
			type : "POST",
			url : "updateWStatus",
			data : {
				action : "status",
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				waitId : waitId,
				restaurantName : rName
			},
			success : function(response) {
				alert("웨이팅 취소되었습니다.");
				window.location.reload();
			},
			error : function() {
				alert("웨이팅 취소에 실패했습니다. 다시 시도해주세요.");
			}
		});
	}

	// 웨이팅 호출 메소드
	function confirmStatus(rId, wId, uId, rName) {
		var status = "1";
		var restaurantId = rId;
		var waitId = wId;
		var userId = uId;
		var rName = rName;

		$.ajax({
			type : "POST",
			url : "updateWStatus",
			data : {
				action : "status",
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				waitId : waitId,
				restaurantName : rName
			},
			success : function(response) {
				alert("고객님을 호출했습니다.");
				window.location.reload();
			},
			error : function() {
				alert("고객님 호출에 실패했습니다. 다시 시도해주세요.");
			}
		});
	}

	// 착석 완료 메소드
	function endStatus(rId, wId, uId, rName) {
		var status = "4";
		var restaurantId = rId;
		var waitId = wId;
		var userId = uId;
		var rName = rName;

		$.ajax({
			type : "POST",
			url : "updateWStatus",
			data : {
				action : "status",
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				waitId : waitId,
				restaurantName : rName
			},
			success : function(response) {
				alert("착석 완료 되었습니다.");
				window.location.reload();
			},
			error : function() {
				alert("웨이팅 종료에 문제가 발생했습니다. 다시 시도해주세요.");
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
			<form method="POST" action="ownerMainPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit">홈</button>
			</form>
			<form method="POST" action="ownerBookListPage">
				<input type="hidden" name="userId" value="${userId }">
				<input type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit" >예약/웨이팅</button>
			</form>
			<form method="post" action="ownerNotificationPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit">알림
					화면</button>
			</form>
			<form method="POST" action="ownerMyPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
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
				<form method="post" action="ownerBookListPage">
					<input type="hidden" name="userId" value="${userId }"> <input
						type="hidden" name="restaurantId" value="${restaurantId }">
					<button type="submit" style="font-size: 18px; font-weight: bold">예약</button>
				</form>
			</div>
			<div class="waitOptionDiv">
				<button onclick="location.reload()" id="btn" style="font-size: 18px; font-weight: bold">웨이팅</button>
			</div>
		</div>
		<div class="contentDiv">
			<div class="labelDiv">
				<h1>웨이팅 내역</h1>
			</div>
			<c:forEach items="${waitList}" var="wait">
				<div class="waitDiv">
					<div class="waitContent">
						<div class="status">
							<div>
								<h3>${wait.wStatus }</h3>
							</div>
						</div>
						웨이팅한 사용자의 아이디 : ${wait.uId} <br> 인원수 : ${wait.hCount }
						명 <br>${wait.wNumber}번째 대기 팀 <br> <br>
					</div>
					<div class="waitBtnDiv">
						<c:if test="${wait.wStatus == '웨이팅 중' }">
							<button type="button"
								onclick="confirmStatus('${restaurantId}', '${wait.uId }', '${userId }', '${wait.rName }')"
								id="callBtn">고객 호출</button>
							<button type="button"
								onclick="cancelStatus('${restaurantId}', '${wait.uId }', '${userId }', '${wait.rName }')"
								id="cancelBtn">웨이팅 취소</button>
						</c:if>
						<c:if test="${wait.wStatus == '고객 호출' }">
							<button type="button"
									onclick="confirmStatus('${restaurantId}', '${wait.uId }', '${userId }', '${wait.rName }')"
									id="callBtn">고객 호출</button>
							<button type="button" onclick="endStatus('${restaurantId}', '${wait.uId}', '${userId}', '${wait.rName}')">착석 완료</button>
						</c:if>
						<c:if
							test="${wait.wStatus == '웨이팅 취소' || wait.wStatus == '웨이팅 거절' || wait.wStatus == '착석 완료' }">
							<button type="button" disabled>고객 호출</button>
							<button type="button" disabled>착석 완료</button>
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