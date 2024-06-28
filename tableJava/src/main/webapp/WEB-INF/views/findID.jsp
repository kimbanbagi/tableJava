<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="css/findID.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1>아이디 찾기</h1>
            <form action="findID" method="post">
                <div class="input-group">
                    <label for="email">이메일</label>
                    <input type="email" name="email" id="email" placeholder="이메일" required />
                </div>
                <div class="input-group">
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" placeholder="이름" required />
                </div>
                <input type="submit" value="아이디 찾기" class="submit-btn" />
            </form>
        </div>
    </div>
</body>
</html>