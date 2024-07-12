<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
<link rel="stylesheet" type="text/css" href="css/findID_ON.css">
</head>
<body>
    <div class="container">
    	<div class="first">
    		<h1>아이디 찾기 결과</h1>
    	</div>
        <div class="second">
        	<div class="second_msg">고객님의 아이디는 다음과 같습니다.</div> 
        	<div class="second_id" style="font-weight: bold; font-size: 25px;">${userId }</div>
        </div>
        <div class="btn">
        	<div>
				<form action="loginPage" method="post">
					<button type="submit" style="font-weight: bold; font-size: 16px;">로그인</button>
				</form>

        	</div>
        	<div>
				<form action="findPWPage" method="post">
					<button type="submit" style="font-weight: bold; font-size: 16px;">비밀번호 찾기</button>
				</form>

        	</div>
        </div>
    </div>
</body>
</html>