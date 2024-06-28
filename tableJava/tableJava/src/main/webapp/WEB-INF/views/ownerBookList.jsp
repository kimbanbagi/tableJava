<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ownerBookList</title>
<link rel="stylesheet" href="css/ownerBookList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 예약 확정 처리 ajax
	function confirmStatus(rId, bId, rName, uId) {
		var status = "1";
		var restaurantId = rId;
		var bookId = bId; //예약한 사용자의 ID
		var restaurantName = rName;
		var userId = uId; // 사장님의 ID

		$.ajax({
			type : "POST",
			url : "updateRStatus",
			data : {
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				restaurantName : restaurantName,
				bookId : bookId
			},
			success : function(response) {
				alert("예약 확정되었습니다.");
				window.location.reload();
			},
			error : function() {
				alert("예약 확정에 실패했습니다. 다시 시도해주세요.");
			}
		});
	}

	// 예약 종료 처리 ajax
	function endStatus(rId, bId, rName, uId) {
		var status = "4";
		var restaurantId = rId;
		var bookId = bId;
		var restaurantName = rName;
		var userId = uId;

		$.ajax({
			type : "POST",
			url : "updateRStatus",
			data : {
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				restaurantName : restaurantName,
				bookId : bookId
			},
			success : function(response) {
				alert("예약 종료되었습니다.");
				window.location.reload();
			},
			error : function() {
				alert("예약 종료에 실패했습니다. 다시 시도해주세요.");
			}
		});
	}

	// 예약 취소 처리 ajax
	function cancelStatus(rId, bId, rName, uId) {
		var status = "3";
		var restaurantId = rId;
		var bookId = bId;
		var restaurantName = rName;
		var userId = uId;

		$.ajax({
			type : "POST",
			url : "updateRStatus",
			data : {
				status : status,
				userId : userId,
				restaurantId : restaurantId,
				restaurantName : restaurantName,
				bookId : bookId
			},
			success : function(response) {
				alert("예약 취소되었습니다.");
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
			<form method="POST" action="ownerMainPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit">메인 화면</button>
			</form>
			<button onclick="location.reload()">예약/웨이팅</button>
			<form method="post" action="ownerNotificationPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit">알림 화면</button>
			</form>
			<form method="POST" action="ownerMyPage">
				<input type="hidden" name="userId" value="${userId }"> <input
					type="hidden" name="restaurantId" value="${restaurantId }">
				<button type="submit" >마이 페이지</button>
			</form>
		</div>
	</div>

	<div class="container">
		<div class="optionDiv">
			<div class="btnDiv">
				<button onclick="location.reload()" id="btn">예약 내역</button>
			</div>
			<div class="btnDiv">
				<form method="post" action="ownerWaitListPage">
					<input type="hidden" name="userId" value="${userId }"> <input
						type="hidden" name="restaurantId" value="${restaurantId }">
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
						<div class="status">
							<div><h3>${book.rStatus }</h3></div>
						</div>
						예약자 : ${book.uId } <br> 예약 날짜 : ${book.rDate } <br>
						예약 시간 : ${book.rTime } <br> 예약 인원 수 : ${book.aCount + book.kCount }
						명 <br> 유모차 사용 : ${book.sCount } 개<br> 휠체어 사용 :
						${book.wCount } 개<br> 요청 사항 : ${book.requirements } <br>
					</div>
					<div class="bookBtnDiv">
						<c:if test="${book.rStatus ==  '예약 대기'}">
							<button type="button"
								onclick="confirmStatus('${restaurantId}', '${book.uId }', '${book.rName}', '${userId }')"
								id="confirmBtn">예약 확정</button>
							<button type="button"
								onclick="cancelStatus('${restaurantId}', '${book.uId }', '${book.rName}', '${userId }')"
								id="cancelBtn">예약 취소</button>
						</c:if>
						<c:if test="${book.rStatus ==  '예약 확정'}">
							<button type="button"
								onclick="endStatus('${restaurantId}', '${book.uId }', '${book.rName }', '${userId }')"
								id="endBtn">예약 종료</button>
							<button type="button" disabled>예약 취소</button>
						</c:if>
						<c:if
							test="${book.rStatus ==  '예약 종료' || book.rStatus == '예약 취소' || book.rStatus == '예약 거절'}">
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>