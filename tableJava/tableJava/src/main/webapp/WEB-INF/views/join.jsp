<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/join.css">
<script src="jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/join.css">
<script>

	var msg = "${msg}";

	if(msg != null && msg != ""){
		alert(msg);
	}

//아이디 중복 체크 메소드
function checkId() {
    var userId = document.getElementById("userId").value;
    if (userId.trim() === "") {
        alert("아이디를 입력해주세요.");
        return;
    }
	$.ajax({
		type: "POST",
		url: "idCheck",
		data: { uId: userId },
		success: function(response) {
			$('#idCheckResult').text(response);
		},
		error: function() {
			alert("중복 확인에 실패했습니다. 다시 시도해주세요.");
		}
	});
}

function validateForm() {
    var userId = document.getElementById("userId").value;
    var userPw = document.getElementsByName("userPW")[0].value;
    var userEmail = document.getElementsByName("userEmail")[0].value;
    var userName = document.getElementsByName("userName")[0].value;
    var userNumber = document.getElementsByName("userNumber")[0].value;

    if (userId.trim() === "") {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if (userPw.trim() === "") {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
    if (userEmail.trim() === "") {
        alert("이메일을 입력해주세요.");
        return false;
    }
    if (userName.trim() === "") {
        alert("이름을 입력해주세요.");
        return false;
    }
    if (userNumber.trim() === "") {
        alert("번호를 입력해주세요.");
        return false;
    }

    return true;
}
</script>
</head>
<body>
<div class="logo_image">
	<img src="image/logo.png">
</div>

<div class="container">
	<form action="join" method="post" onsubmit="return validateForm()">
		ID:<br>
		<input type="text" name="uId" id = "userId">
		 <button type="button" onclick="checkId()">중복확인</button>
		<%
            String status = (String) request.getAttribute("status");
            if (status != null && !status.isEmpty()) {
        %>
            <%= status %>
        <% } %>
	
		<span id="idCheckResult"></span><br>
		PW:<br>
		<input type="text" name="pwd"><br>
		EMAIL:<br>
		<input type="text" name="email"><br>
		이름:<br>
		<input type="text" name="uName"><br>
		번호:<br>
		<input type="text" name="uNumber"><br>
		<div class ="select">
			<input type="radio" id="customer" name="uRole" value="customer" checked>
			<label for="customer">손님</label>
			<input type="radio" id="owner" name="uRole" value="owner">
			<label for="owner">사장님</label>
		</div>
		<div class="join_button">
			<button type="submit">회원가입</button>
		</div>
	</form>
</div>
</body>
</html>