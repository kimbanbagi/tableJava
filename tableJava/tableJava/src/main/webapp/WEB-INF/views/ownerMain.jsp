<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Information</title>
</head>
<body>

    <div class="container">
        <div class="header">
            <h1>사장님 메인 화면</h1>
            
        </div>
        <div class="nav">
            <button onclick="location.reload()">메인 화면</button>
            <form method="POST" action="ownerBookListPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<input type="hidden" name="restaurantId" value="${restaurantId }">
            	<button type="submit" >예약/웨이팅</button>
            </form>
            <form method="post" action="ownerNotificationPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<input type="hidden" name="restaurantId" value="${restaurantId }">
            	<button type="submit">알림 화면</button>
            </form>
            <form method="POST" action="ownerMyPage">
            	<input type="hidden" name="userId" value="${userId }">
            	<input type="hidden" name="restaurantId" value="${restaurantId }">
            	<button type="submit">마이 페이지</button>
            </form>
        </div>
            <div class="info">
                <p><strong>식당 이름:</strong> ${restaurant.rName}</p>
                <p><strong>사업자 번호:</strong> ${restaurant.rId}</p>
                <p><strong>식당 인원수:</strong> ${restaurant.rHead}</p>
                <p><strong>식당 도시:</strong> ${restaurant.rCity}</p>
                <p><strong>식당 상세주소:</strong> ${restaurant.rAddress}</p>
                <p><strong>식당 번호:</strong> ${restaurant.rNumber}</p>
                <c:if test="${restaurant.rStatus == 'T'}">
                    <p><strong>식당 예약 여부: 가능</strong></p>
                </c:if>
                <c:if test="${restaurant.rStatus == 'F'}">
                    <p><strong>식당 예약 여부: 불가능</strong></p>
                </c:if>
                <c:if test="${restaurant.wStatus == 'T'}">
                    <p><strong>식당 웨이팅 여부: 가능</strong></p>
                </c:if>
                <c:if test="${restaurant.wStatus == 'F'}">
                    <p><strong>식당 웨이팅 여부: 불가능</strong></p>
                </c:if>
            </div>      
        </div>
        <div class="footer">
            <p>Copyright © 2024 TableJava. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
