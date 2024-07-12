<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>웨이팅 화면</title>
    <link rel="stylesheet" href="css/wait.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
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
        <form method="post" action="userBookListPage">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit">예약/웨이팅</button>
        </form>
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
    <div class="containerDiv">
        <div class="titleDiv">
            <div><h1>웨이팅</h1></div>
        </div>
        <div class="nameNumberDiv">
            <div class="rNameDiv">
                <div>${restaurantName }</div>
            </div>
            <div class="waitNumberDiv">
                <div>
                    <h2>현재 웨이팅 순서</h2>
                    <div>
                        ${nextNumber } 번째 대기 입니다.
                    </div>
                </div>
            </div>
        </div>
        <div class="waitFormDiv">
            <form action="wait" method="post">
                <input type="hidden" name="uId" value="${userId }">
                <input type="hidden" name="rId" value="${restaurantId}">
                <input type="hidden" name="rName" value="${restaurantName}">
                <input type="hidden" name="wNumber" value="${nextNumber }">
                <div class="countNumberDiv">
                    <div class="hCountDiv">
                        <label>인원수</label>
                        <input type="number" id="headCount" name="hCount" size=5 min="1" required>
                    </div>
                    <div class="numberDiv">
                        <label>전화 번호</label>
                        <input type="text" name="uNumber" placeholder="ex 010-567-8999" required>
                    </div>
                </div>
                <div class="btnDiv">
                    <button type="submit">웨이팅 하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>