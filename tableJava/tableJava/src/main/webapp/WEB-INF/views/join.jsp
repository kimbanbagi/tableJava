<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/join.css">
    <script src="jquery-1.11.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="css/join.css">
    <script>
        $(document).ready(function () {

            // 회원 가입 실패 에러 메세지 띄우는 팝업
            var msg = "${msgFailed}";
            if (msg != null && msg != "") {
                swal("오류", msg, "error");
            }

        });

		// 전화번호 입력시 자동으로 "-" 생성
        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }

        //아이디 중복 체크
        function checkId() {
            const korCheck = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
            var userId = document.getElementById("userId").value;

            if(korCheck.test(userId)){
                $('#idCheckResult').text("한/영 키 전환이 필요합니다.")
            }else {
                $.ajax({
                    type: "POST",
                    url: "idCheck",
                    data: {uId: userId},
                    success: function (response) {
                        $('#idCheckResult').text(response);
                    },
                    error: function () {
                        swal("중복 확인에 실패했습니다.", "다시 시도해주세요.", "warning");
                    }
                });
            }
        }
    </script>
</head>
<body>
<div class="logo_image">
    <img src="image/logo.png">
</div>

<div class="container">
    <form action="join" method="post" onsubmit="return validatePassword() && confirmPassword() && checkId()">
        <label style="font-weight: bold; font-size: 18px;">아이디 </label>
        <input type="text" name="uId" id="userId" placeholder="15자 이내의 숫자와 영문 대소문자의 조합" maxlength="15" pattern="^[a-zA-Z0-9]+$" required>
        <p id="idCheckResult"></p>
        <button type="button" onclick="checkId()" style="font-weight: bold; font-size: 18px;">중복확인</button>
        <%
            String status = (String) request.getAttribute("status");
            if (status != null && !status.isEmpty()) {
        %>
        <%=status %>
        <% } %>
        <label style="font-weight: bold; font-size: 18px;">비밀번호</label>
        <input type="password" name="uPwd" placeholder="6-16자 사이 영문 대소문자, 숫자, 특수문자 1개 씩 포함" id="uPwd"
               pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,16}$"
               onfocusout="validatePassword()" required>
        <p id="validateMsg"></p>
        <script>
            // 비밀번호 유효성 검사
            function validatePassword() {

                var passwordInput = document.getElementById("uPwd");
                var password = passwordInput.value;
                var validateMsg = document.getElementById("validateMsg");

                const checkPassword = document.getElementById("pwdCheck");

                validateMsg.textContent = '';

                const minLength = 6;
                const maxLength = 16;
                const korCheck = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
                const specialCharsRegex = /[!"#$%&'()*+,-./:;<=>?@[]^_{|}~]/;

                if (passwordInput.validity.valid) {
                    validateMsg.textContent = "사용할 수 있는 비밀번호 입니다";
                    checkPassword.disabled = false;
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
                    checkPassword.disabled = true;
                    return false;
                }
            }
        </script>
        <label style="font-weight: bold; font-size: 18px;">비밀번호 확인</label>
        <input type="password" id="pwdCheck" onfocusout="confirmPassword()" disabled required>
        <p id="confirmMsg"></p>
        <script>
                // 비밀번호 확인 체크
                function confirmPassword(){
                    const typedPassword = document.getElementById("uPwd").value;
                    const checkPassword = document.getElementById("pwdCheck").value;
                    const confirmMsg = document.getElementById("confirmMsg");

                    confirmMsg.textContent = "";

                    if(typedPassword === checkPassword){
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
		<label style="font-weight: bold; font-size: 18px;">이메일</label>
        <input type="email" name="uEmail" placeholder="human@gmail.com" required><br>
        <label style="font-weight: bold; font-size: 18px;">이름</label>
        <input type="text" name="uName" maxlength="15" placeholder="성함" required><br>
        <label style="font-weight: bold; font-size: 18px;">전화번호</label>
        <input type="text" name="uNumber" oninput="hypenTel(this)" placeholder="010-123-4567" maxlength="13"
               required><br>
        <div class="select">
            <input type="radio" id="customer" name="uRole" value="customer" checked required>
            <label for="customer">손님</label>
            <input type="radio" id="owner" name="uRole" value="owner" required>
            <label for="owner">사장님</label>
        </div>
        <div class="join_button">
            <button type="submit" style="font-size: 17px; font-weight: bold;">회원가입</button>
        </div>
    </form>
</div>
</body>
</html>