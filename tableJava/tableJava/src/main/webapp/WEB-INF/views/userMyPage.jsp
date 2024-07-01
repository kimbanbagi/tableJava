<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 마이 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="css/userMyPage.css">
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
    <img src="image/logo1.png" alt="로고이미지" class="navbar_logo">
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
                <a href="#None">다크모드</a>
            </li>
            <li>
                <a href="#None">설정</a>
            </li>
            <li>
                <button onclick="logout()" >로그아웃</button>
            </li>
        </ul>
    </div>
</div>
<div class="container">
    <div class="profile">
        <div class="profile-pic">
            <!-- User profile picture -->
            <img src="user_pic.jpg" alt="User Profile Picture">
        </div>
        <div class="profile-info">
            <!-- User ID and Name -->
            <h2>ID : ${userId}</h2>
            <p>이름 : ${user.uName}</p>
        </div>
        <%--            <div>--%>
        <%--            	<form method="post" action="updatePW.jsp">--%>
        <%--            		<input type="hidden" name="userId" value="${userId }">--%>
        <%--            		<button type="submit">비밀번호 변경</button>--%>
        <%--            	</form>--%>
        <%--            </div>--%>
        <%--            <div>--%>
        <%--            	<button onclick="confirm_withdrawal('${userId}')">회원 탈퇴</button>--%>
        <%--            </div>--%>
    </div>
    <div class="history-section">
        <div class="history-section-h1">
            내가 이용한 식당 리스트
        </div>
        <div class="history-list">
            <c:forEach items="${history }" var="history">
                <div class="history-item">
                    <div class="history-content">
                        날짜 : ${history.rDate }<br>
                        시간 : ${history.rTime }<br>
                        식당 이름 : ${history.rName }<br>
                    </div>
                    <div class="review">
                        <form action="reviewPage" method="post">
                            <input type="hidden" name="restaurantId" value="${history.rId}">
                            <input type="hidden" name="restaurantDate" value="${history.rDate}">
                            <input type="hidden" name="restaurantTime" value="${history.rTime}">
                            <input type="hidden" name="restaurantName" value="${history.rName}">
                            <input type="hidden" name="userId" value="${userId}">
                            <button type="submit">리뷰 등록</button>
                        </form>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
    <%--        <button onclick="logout()">로그아웃</button>--%>
</div>
</body>
</html>