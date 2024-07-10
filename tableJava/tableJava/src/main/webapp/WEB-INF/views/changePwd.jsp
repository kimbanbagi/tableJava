<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="css/changePwd.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <div class="head">비밀번호 변경</div>
        <form action="/updatePwd" method="post" id="frm" onsubmit="return validatePassword() && confirmPassword()">
            <div class="pwd">
                <label for="currPwd">현재 비밀번호</label>
                <input type="password" id="currPwd" name="currPwd" required>
            </div>

            <div class="pwd">
                <label for="newPwd">새 비밀번호</label>
                <input type="password" name="newPwd" placeholder="6-16자 사이 영문 대소문자, 숫자, 특수문자 1개 씩 포함" id="newPwd"
                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,16}$"
                       onfocusout="validatePassword()" required>
                <p id="validateMsg"></p>
                <script>
                    // 비밀번호 유효성 검사
                    function validatePassword() {

                        var passwordInput = document.getElementById("newPwd");
                        var password = passwordInput.value;
                        var validateMsg = document.getElementById("validateMsg");

                        const cfmPwd = document.getElementById("cfmPwd");

                        validateMsg.textContent = '';

                        const minLength = 6;
                        const maxLength = 16;
                        const korCheck = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
                        const specialCharsRegex = /[!"#$%&'()*+,-./:;<=>?@[]^_{|}~]/;

                        if (passwordInput.validity.valid) {
                            validateMsg.textContent = "사용할 수 있는 비밀번호 입니다";
                            cfmPwd.disabled = false;
                            return true;
                        } else {
                            if(korCheck.test(password)){
                                validateMsg.textContent = "한/영키 전환이 필요합니다.";
                            } else if (password.length < minLength) {
                                validateMsg.textContent = "최소 6자 이상이어야 합니다.";
                            } else if (password.length > maxLength) {
                                validateMsg.textContent = "최대 16자 이하여야 합니다."
                            } else if (!/[a-z]/.test(password)) {
                                validateMsg.textContent = "최소 1개의 영어 소문자를 포함해야 합니다.";
                            } else if (!/[A-Z]/.test(password)) {
                                validateMsg.textContent = "최소 1개의 영어 대문자를 포함해야 합니다. ";
                            } else if (!/\d/.test(password)) {
                                validateMsg.textContent = "최소 1개의 숫자를 포함해야 합니다.";
                            } else if (!specialCharsRegex.test(password)) {
                                validateMsg.textContent = "최소 1개의 특수 문자를 포함해야 합니다.";
                            } else {
                                validateMsg.textContent = "비밀번호 조건에 맞지 않습니다.";
                            }
                            cfmPwd.disabled = true;
                            return false;
                        }
                    }
                </script>
            </div>

            <div class="pwd">
                <label for="cfmPwd">새 비밀번호 확인</label>
                <input type="password" id="cfmPwd" onfocusout="confirmPassword()" disabled required>
                <p id="confirmMsg"></p>
                <script>
                    // 비밀번호 확인 체크
                    function confirmPassword(){
                        const newPwd = document.getElementById("newPwd").value;
                        const cfmPwd = document.getElementById("cfmPwd").value;
                        const confirmMsg = document.getElementById("confirmMsg");

                        confirmMsg.textContent = "";

                        if(newPwd === cfmPwd){
                            confirmMsg.textContent = "비밀번호가 일치합니다.";
                            confirmMsg.setAttribute('style', 'color:green;');
                            return true;
                        }else {
                            confirmMsg.textContent = "비밀번호가 일치하지 않습니다.";
                            confirmMsg.setAttribute('style', 'color:red;');
                            return false;
                        }
                    }
                </script>
            </div>

            <input type="hidden" name="userId" value="${userId}">
            <button type="submit" class="submitBtn" id="submitBtn">비밀번호 변경하기</button>
        </form>

    </div>
    <div class="withdrawBtn">
        <button>회원 탈퇴&nbsp;&gt;</button>
    </div>
</div>
</body>
</html>