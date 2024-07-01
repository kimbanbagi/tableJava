<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웨이팅 화면</title>
<link rel="stylesheet" href="css/wait.css">
</head>
<body>
    <div class="container">
        <div class="containerDiv">
            <div class="titleDiv">
                <div><h1>웨이팅</h1></div>
            </div>
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
            <div class="waitFormDiv">
                <form action="wait" method="post">
                    <input type="hidden" name="uId" value="${userId }">
                    <input type="hidden" name="rId" value="${restaurantId}">
                    <input type="hidden" name="rName" value="${restaurantName}">
                    <input type="hidden" name="wNumber" value="${nextNumber }">
                    
                    <div class="hCountDiv">
                        <label>인원수</label>
                        <input type="number" id="headCount" name="hCount" size=5 min="1" required>
                    </div>
                    <div class="numberDiv">
                        <label>전화 번호</label>
                    <input type="text" name="uNumber" placeholder="ex 010-567-8999" required>
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