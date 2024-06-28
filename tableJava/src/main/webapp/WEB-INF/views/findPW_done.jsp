<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지 - 완료 창</title>
<link rel="stylesheet" href="css/findPW_done.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
	<h1>임시 비밀번호가 발급 되었습니다.</h1>
	<h3>[ ${tempPW} ]</h3>
	<form method="post" action="loginPage">
		<button type="submit">로그인</button>
	</form>
</div>
</body>
</html>