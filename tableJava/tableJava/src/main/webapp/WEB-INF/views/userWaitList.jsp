<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userWaitList</title>
<link rel="stylesheet" href="css/userWaitList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	var msg = "${msg}";

	if (msg != null && msg != "") {
		alert(msg);
		request.removeAttribute("msg");
	}

	function cancelStatus(rId, uId, rName) {
		var status = "2";
		var restaurantId = rId;
		var userId = uId;
		var restaurantName = rName;

		$.ajax({
			type : "POST",
			url : "UserWaitList",
			data : {
				action : "status",
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				restaurantName : restaurantName
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
</script>
</head>
<body>
	<div class="nav">
		<img src="image/logo1.png" alt="로고 이미지">
		<div class="buttons-container">
			<form method="POST" action="userMainPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit">메인 화면</button>
			</form>
			<button onclick="location.reload()">예약/웨이팅</button>
			<form method="post" action="userNotificationPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit">알림</button>
			</form>
			<form method="POST" action="userMyPage">
				<input type="hidden" name="userId" value="${userId }">
				<button type="submit">마이
					페이지</button>
			</form>
		</div>
	</div>

	<div class="container">
		<div class="optionDiv">
			<div class="btnDiv">
				<form method="post" action="userBookListPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit">예약
						내역</button>
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
							<h3>웨이팅 상태 : ${wait.wStatus }</h3>
						</div>
						웨이팅한 식당 : ${wait.rName} <br> 인원수 : ${wait.hCount }
						<br> <br> <br><br>웨이팅숫자 : ${wait.wNumber} <br>
					</div>
					<div class="waitBtnDiv">
						<c:if test="${wait.wStatus == '웨이팅 중' }">
								<button type="button"
									onclick="cancelStatus('${wait.rId}', '${userId }', '${wait.rName }')" id="statusBtn">웨이팅 취소</button>
						</c:if>
						<c:if
							test="${wait.wStatus == '웨이팅 취소' || wait.wStatus == '웨이팅 거절' || wait.wStatus == '착석 완료' }">
							<button type="button" disabled>웨이팅 취소</button>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>