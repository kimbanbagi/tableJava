<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이 페이지</title>
<link rel="stylesheet" href="userMyPage.css">
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

    //햄버거 메뉴 스크립트
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
    <div class="nav navBar_main">
        <img src="image/logo1.png" alt="로고 이미지" class="navbar_logo">
        <div class="buttons-container navbar_links">
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
        <div class="container">
            <div class="profile">
                <div class="profile-pic">
                    <img src="user_pic.jpg" alt="User Profile Picture">
                </div>

                <div class="profile-info">
                    <p>ID : ${userId}</p>
                    <p>이름 : ${user.uName}</p>
                    <div class="logout">
                        <button onclick="logout()">로그아웃</button>
                        <button type="submit" class="save-btn">비밀번호 변경하기</button>
                    </div>
                </div>
            </div>
            <div class="history-section">
                <div class="history-section-h1">
                    마이 테이블
                </div>
                <div class="history-list">
                    <c:forEach items="${history }" var="history">
                        <div class="history-item">
                            <div class="history-date">날짜 : ${history.rDate }</div>
                            <div class="history-time">시간 : ${history.rTime }</div>
                            <div class="history-restaurant">식당 이름 : ${history.rName }</div>

                            <form action="reviewPage" method="post">
                                <input type="hidden" name="restaurantId" value="${history.rId}">
                                <input type="hidden" name="restaurantDate" value="${history.rDate}">
                                <input type="hidden" name="restaurantTime" value="${history.rTime}">
                                <input type="hidden" name="restaurantName" value="${history.rName}">
                                <input type="hidden" name="userId" value="${userId}">
                                <button type="submit">리뷰 등록하기</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>