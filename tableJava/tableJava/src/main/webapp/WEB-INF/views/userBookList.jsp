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
			url : "bookCancelFromUser",
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
	</div>

	<div class="container">
		<div class="optionDiv">
			<div class="btnDiv">
				<button onclick="location.reload()">예약 내역</button>
			</div>
			<div class="btnDiv">
				<form method="post" action="userWaitListPage">
					<input type="hidden" name="userId" value="${userId }">
					<button type="submit">웨이팅 내역</button>
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
								인원  ${book.aCount + book.kCount } <br>
							</div>
							<div class="bookContentRequirement">
								유모차  ${book.sCount } <br>
								휠체어  ${book.wCount} <br>
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
</body>
</html>