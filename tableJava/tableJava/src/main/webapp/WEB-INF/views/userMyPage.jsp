<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function logout() {
		alert("로그아웃 되었습니다.");
		window.location.href="login.jsp";
	}
	
	function withdrawal_confirm(uId) {
		var userId = uId;
		
		if(confirm("정말 탈퇴하시겠어요?")){
			$.ajax({
				type : "POST",
				url : "MyPage",
				data : {
					action : "withdrawal",
					userId : userId
				},
				success : function(response) {
					alert("회원 탈퇴가 완료 되었습니다.");
					window.location.href="login.jsp"
				},
				error : function() {
					alert("회원 탈퇴에 실패했습니다.");
				}
			})
		}
	}
</script>
</head>
<body>
    <div class="container">
        <div class="nav">
            <form method="POST" action="userMainPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<button type="submit">메인 화면</button>
            </form>
            <form method="POST" action="userBookListPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<button type="submit" name="action" value="bookList">예약 / 웨이팅</button>
            </form>
            <form method="post" action="userNotificationPage">
        		<input type="hidden" name="userId" value="${userId }">
        		<button type="submit" name="action" value="userNotification">알림</button>
        	</form>
            <button onclick="location.reload()">마이 페이지</button>
    	</div>
        <section class="profile">
            <div class="profile-pic">
                <!-- User profile picture -->
                <img src="user_pic.jpg" alt="User Profile Picture">
            </div>
            <div class="profile-info">
                <!-- User ID and Name -->
                <h2>ID : ${userId}</h2>
                <p>이름 : ${user.uName}</p>
            </div>
            <div>
            	<form method="post" action="updatePW.jsp">
            		<input type="hidden" name="userId" value="${userId }">
            		<button type="submit">비밀번호 변경</button>
            	</form>
            </div>
            <div>
            	<button onclick="confirm_withdrawal('${userId}')">회원 탈퇴</button>
            </div>
        </section>
        <div>
        	<h1>내가 이용한 식당 리스트</h1>
        	<c:forEach items="${history }" var="history">
        		<div>
        			날짜 : ${history.rDate }
        			시간 : ${history.time }
        			식당 이름 : ${history.restaurant_name }
        		</div>
        	</c:forEach>
        </div>
        <button onclick="logout()">로그아웃</button>
    </div>
</body>
</html>