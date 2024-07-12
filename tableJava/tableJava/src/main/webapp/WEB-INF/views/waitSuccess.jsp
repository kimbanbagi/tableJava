<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>웨이팅 성공 화면</title>
    <link rel="stylesheet" href="css/waitSuccess.css">
<meta charset="UTF-8">
<title>웨이팅 성공 화면</title>
	<link rel="stylesheet" href="css/waitSuccess.css">
</head>
<body>
    <div class="container">
        <div class="containerDiv">
            <div class="labelDiv">
                <div class="imgDiv">
                    <img src="image/check.png">
                </div>
                <h2>웨이팅 등록이 완료되었습니다.</h2>
                <div class="btnDiv">
                    <form method="post" action="userWaitListPage">
                        <input type="hidden" name="userId" value="${userId }">
                        <button type="submit" name="action" value="waitList"> 확인</button>
                    </form>
               </div>
            </div>
        </div>
    </div>
</body>
</html>