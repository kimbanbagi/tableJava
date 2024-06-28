<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>로그인 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="">
    <script>
        var msg = "${msg}";

        if(msg != null && msg != ""){
            alert(msg);
        }

        function login(id, pwd) {
            var userId = id;
            var userPwd = pwd;

            $.ajax({
                type : "POST",
                url : "login",
                data : {
                    action : "login",
                    userId : userId,
                    userPwd : userPwd
                },
                success : function(response) {
                },
                error : function() {
                    alert("일치하는 정보가 없습니다.");
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <form action="login" method="post">
        <img src="">
        <div class="input-group">
            <label>아이디</label> <input type="text" name="userId"
                                                    required>
        </div>
        <div class="input-group">
            <label>비밀번호</label> <input type="password"
                                                      name="userPwd" required>
        </div>
        <button type="submit" value="로그인" class="login-btn">
            로그인<br>
        </button>
    </form>
    <div class="links">
        <form method="post" action="joinPage">
            <button id="joinBtn" class="link-btn">회원가입</button>
        </form>
        <form method="post" action="findIDPage">
            <button id="findIDBtn" class="link-btn">아이디 찾기</button>
        </form>
        <form method="post" action="findPWPage">
            <button id="findPWBtn" class="link-btn">비밀번호 찾기</button>
        </form>
    </div>
</div>
</body>
</html>