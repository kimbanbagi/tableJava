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
	function cancelStatus(rId, bId, uId) {
		var status = "2";
		var restaurantId = rId;
		var bookId = bId;
		var userId = uId;

		$.ajax({
			type : "POST",
			url : "OwnerWaitList",
			data : {
				action : "status",
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				bookId : bookId
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
	function confirmStatus(rId, bId, uId) {
		var status = "1";
		var restaurantId = rId;
		var bookId = bId;
		var userId = uId;

		$.ajax({
			type : "POST",
			url : "OwnerWaitList",
			data : {
				action : "status",
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				bookId : bookId
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
</script>
</head>
<body>
	<div class="nav">
		<img src="image/logo1.png" alt="로고 이미지">
		<div class="buttons-container">
			<form method="POST" action="ownerMainPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit">메인 화면</button>
			</form>
			<button onclick="location.reload()">예약/웨이팅</button>
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
	</div>

	<div class="container">
		<div class="optionDiv">
			<div class="btnDiv">
				<form method="post" action="ownerBookListPage">
					<input type="hidden" name="userId" value="${userId }"> <input
						type="hidden" name="restaurantId" value="${restaurantId }">
					<button type="submit">예약 내역</button>
				</form>
			</div>
			<div class="btnDiv">
				<button onclick="location.reload()" id="btn">웨이팅 내역</button>
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
								onclick="confirmStatus('${restaurantId}', '${wait.userId }', '${userId }', '${wait.restaurantName }')"
								id="callBtn">고객 호출</button>
							<button type="button"
								onclick="cancelStatus('${restaurantId}', '${wait.userId }', '${userId }', '${wait.restaurantName }')"
								id="cancelBtn">웨이팅 취소</button>
						</c:if>
						<c:if test="${wait.wStatus == '고객 호출' }">
							<button type="button" disabled>고객 호출</button>
							<button type="button">착석 완료</button>
						</c:if>
						<c:if
							test="${wait.wStatus == '웨이팅 취소' || wait.wStatus == '웨이팅 거절' || wait.wStatus == '착석 완료' }">
							<button type="button" disabled>웨이팅 취소</button>
							<button type="button" disabled>고객 호출</button>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>