<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사장님 마이 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function logout() {
		alert("로그아웃 되었습니다.");
		window.location.href="login.jsp";
	}
</script>
</head>
<body>
    <div class="container">
        <div class="nav">
            <form method="POST" action="ownerMainPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<input type="hidden" name="restaurantId" value="${restaurantId }">
            	<button type="submit">메인 화면</button>
            </form>
            <form method="POST" action="ownerBookListPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<input type="hidden" name="restaurantId" value="${restaurantId }">
            	<button type="submit">예약 / 웨이팅</button>
            </form>
            <form method="post" action="ownerNotificationPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<input type="hidden" name="restaurantId" value="${restaurantId }">
            	<button type="submit">알림 화면</button>
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
                <p>이름 : ${owner.uName}</p>
            </div>
            <!-- 개인 정보 수정 버튼 / 클릭 시 팝업창 뜨고 비밀번호 일치하면 정보 수정 페이지로 이동 -->
        </section>
        <button onclick="logout()">로그아웃</button>
    </div>
</body>
</html>