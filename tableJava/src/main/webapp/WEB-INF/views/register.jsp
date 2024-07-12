<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Restaurant Registration</title>
    <link rel="stylesheet" href="css/register.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var msg = "${msg}";

        if(msg != null && msg != ""){
            alert(msg);
        }

        const hypenNum = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`);
        }

        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }

        if(document.getElementById("rStatus").checked){
            document.getElementById("rStatus_hidden").disabled = true;
        }

        if(document.getElementById("wStatus").checked){
            document.getElementById("wStatus_hidden").disabled = true;
        }
    </script>
</head>
<body>
	<img class="logo" src="image/logo.png">
    <div class="container">
        <h1>식당 등록하기</h1>
        <form action="register" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="uId" value="${userId }">
            <div class="form-group">
                <label for="rId">사업자 번호 : </label>
                <input type="text" oninput="hypenNum(this)" id="rId" name="rId" maxlength="12" placeholder="012-34-56789 숫자만 입력" required>
            </div>
            <div class="form-group">
                <label for="rName">식당 이름 : </label>
                <input type="text" id="rName" name="rName" maxlength="25" required>
            </div>
            <div class="form-group">
                <label for="rHead">총 수용 인원 : </label>
                <input type="text" id="rHead" pattern="^[0-9]+$" name="rHead" maxlength="3" placeholder="숫자만 입력" required>
            </div>
            <div class="form-group">
                <label for="rCity">도시 : </label>
                <input type="text" id="rCity" name="rCity" maxlength="5" placeholder="시 제외 도시 명만 입력. 예) 천안, 아산" required>
            </div>
            <div class="form-group">
                <label for="rAddress">상세 주소:</label>
                <input type="text" id="rAddress" maxlength="100" name="rAddress" required>
            </div>
            <div class="form-group">
                <label for="rNumber">식당 전화번호:</label>
                <input type="text" oninput="hypenTel(this)" id="rNumber" maxlength="13" placeholder="010-123-456" name="rNumber" required>
            </div>
            <div class="inline-group">
                <label for="rStatus">예약 여부 : </label>
                <input type="checkbox" id="rStatus" name="rStatus" value="T">
                <label for="wStatus">웨이팅 여부 : </label>
                <input type="checkbox" id="wStatus" name="wStatus" value="T">
            </div>
            <div class="form-group">
                <label for="rPhoto">식당 사진 : </label>
                <input type="file" id="rPhoto" name="rPhoto" accept="image/*" required>
            </div>
            <div class="form-group">
                <button type="submit" id="registerBtn">가게 등록</button>
            </div>
        </form>
    </div>
</body>
</html>
