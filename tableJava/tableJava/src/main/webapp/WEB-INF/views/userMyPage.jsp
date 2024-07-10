<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 마이 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="css/userMyPage.css">
    <script>
        // 햄버거 메뉴
        $(document).ready(function () {
            // 변경 사항 저장 성공 메세지 띄우는 팝업
            var msg = "${msgSuccess}";
            if (msg != null && msg != "") {
                swal("성공", msg, "success");
            }

            // 변경 사항 저장 에러 메세지 띄우는 팝업
            var msg = "${msgFailed}";
            if (msg != null && msg != "") {
                swal("오류", msg, "error");
            }

            // 햄버거 메뉴
            let subToggle = true;

            $(".menu").click(function () {
                const $submenu = $(".sub");
                if (subToggle) {
                    $submenu.stop().slideDown(300);
                } else {
                    $submenu.stop().slideUp(300);
                }
                subToggle = !subToggle;
            });

        });

        // 전화번호 입력시 자동으로 "-" 생성
        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }
    </script>
</head>
<body>
<div class="nav">
    <img src="image/logo1.png" alt="로고이미지" class="navbar_logo">
    <div class="buttons-container navbar_links">
        <form method="POST" action="userMainPage">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit">메인 화면</button>
        </form>
        <form method="POST" action="userBookListPage">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit" name="action" value="bookList">예약 / 웨이팅</button>
        </form>
        <form method="post" action="userNotificationPage">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit" name="action" value="userNotification">알림</button>
        </form>
        <button onclick="location.reload()">마이 페이지</button>
    </div>
    <div class="menu">
        <span>☰</span>
        <ul class="sub">
            <li>
                <button>다크 모드</button>
            </li>
            <li>
                <form method="post" action="changePwdPage">
                    <input type="hidden" name="userId" value="${userId}">
                    <button type="submit">비밀번호 변경</button>
                </form>
            </li>
            <li>
                <form method="post" action="logout">
                    <button type="submit">로그아웃</button>
                </form>
            </li>
        </ul>
    </div>
</div>
<div class="container">
    <div class="profile">
        <div class="profile-pic">
            <img src="${user.fileName}" alt="User Profile Picture">
        </div>
        <div class="profile-info">
            <h2>ID : ${user.uId}</h2>
            <p>이름 : ${user.uName}</p>
        </div>
        <div class="editBtnDiv">
            <button type="submit" id="editBtn">프로필 수정</button>
        </div>

        <script>
            const editBtn = document.getElementById("editBtn");
            editBtn.addEventListener('click', openModal);

            function openModal() {
                const modal = document.getElementById("modalDiv");

                modal.style.display = 'block'
            }

        </script>

    </div>
    <div class="history-section">
        <div class="history-section-h1">
            내가 이용한 식당 리스트
        </div>
        <div class="history-list">
            <c:forEach items="${history }" var="history">
                <div class="history-item">
                    <div class="history-content">
                        날짜 : ${history.rDate }<br>
                        시간 : ${history.rTime }<br>
                        식당 이름 : ${history.rName }<br>
                    </div>
                    <div class="review">
                        <form action="reviewPage" method="post">
                            <input type="hidden" name="restaurantId" value="${history.rId}">
                            <input type="hidden" name="restaurantDate" value="${history.rDate}">
                            <input type="hidden" name="restaurantTime" value="${history.rTime}">
                            <input type="hidden" name="restaurantName" value="${history.rName}">
                            <input type="hidden" name="userId" value="${userId}">

                            <c:if test="${history.written == 'F'}">
                                <button type="submit">리뷰 쓰기</button>
                            </c:if>
                            <c:if test="${history.written == 'T'}">
                                <button disabled>리뷰 완료 </button>
                            </c:if>
                        </form>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
    <div class="modalDiv" id="modalDiv">
        <div class="modal">
            <form method="post" action="updateUserProfile" id="frm" enctype="multipart/form-data">
            <div class="modalPhoto">
                <img src="${user.fileName}" id="preview">
                <div class="modalProfile">
                    <div class="modalName">${user.uName}</div>
                    <div class="modalId">${user.uId}</div>
                </div>

                <div class="uploadBtnDiv">
                    <label for="uImage">
                        <div class="uploadBtn">프로필 사진 변경</div>
                    </label>
                </div>
                <input type="file" id="uImage" name="uImage" accept="image/*">

                <script>
                    const fileInput = document.getElementById("uImage");
                    const preview = document.getElementById("preview");

                    fileInput.addEventListener('change',()=>{
                        const reader = new FileReader();
                        reader.onload = ({target})=>{
                            preview.src = target.result;
                        };
                        reader.readAsDataURL(fileInput.files[0]);
                    })
                </script>

            </div>
                <div class="modalNumber">
                    <img src="image/iphone.png">
                    <div>${user.uNumber}</div>
                    <input type="text" id="newNumber" oninput="hypenTel(this)" name="uNumber" value="${user.uNumber}">
                    <button id="editNumberBtn" class="editBtn">수정</button>
                </div>

                <script>
                    // 프로필 수정 모달 - 수정 버튼 클릭 시 input 보이게 하는 메소드
                    const editNumberBtn = document.getElementById('editNumberBtn');
                    editNumberBtn.addEventListener('click', function (event) {
                        event.preventDefault();

                        const newNumber = document.getElementById("newNumber");

                        if (newNumber.style.visibility === 'hidden') {

                            newNumber.style.visibility = 'visible';
                            editNumberBtn.innerText = "취소";
                            editNumberBtn.style.backgroundColor = 'grey';

                        } else {

                            newNumber.style.visibility = 'hidden';
                            editNumberBtn.innerText = "수정";
                            editNumberBtn.style.backgroundColor = 'seagreen';

                        }
                    });


                </script>

                <div class="modalEmail">
                    <img src="image/mail.png">
                    <div>${user.uEmail}</div>
                    <input type="email" id="newEmail" name="uEmail" value="${user.uEmail}">
                    <button id="editEmailBtn" class="editBtn">수정</button>
                </div>

                <script>

                    // 프로필 수정 모달 - 수정 버튼 클릭 시 input 보이게 하는 메소드
                    const editEmailBtn = document.getElementById('editEmailBtn');
                    editEmailBtn.addEventListener('click', function (event) {
                        event.preventDefault();

                        const newEmail = document.getElementById("newEmail");

                        if (newEmail.style.visibility === 'hidden') {

                            newEmail.style.visibility = 'visible';
                            editEmailBtn.innerText = "취소";
                            editEmailBtn.style.backgroundColor = 'grey';

                        } else {

                            newEmail.style.visibility = 'hidden';
                            editEmailBtn.innerText = "수정";
                            editEmailBtn.style.backgroundColor = 'seagreen';

                        }
                    });
                </script>

                <div class="btnDiv">
                    <button id="closeBtn">닫기</button>
                    <input type="hidden" name="uId" value="${user.uId}">
                    <input type="hidden" name="userId" value="${userId}">
                    <button type="submit" id="editSaveBtn">변경 사항 저장</button>
                </div>
            </form>
        </div>

        <script>
            const modal = document.getElementById("modalDiv");

            const closeBtn = document.getElementById("closeBtn");
            closeBtn.addEventListener('click', function(event){
                event.preventDefault();

                modal.style.display = 'none';
            });

            const newNumberInput = document.getElementById("newNumber").value;
            const newEmailInput = document.getElementById("newEmail").value;

            const form = document.getElementById("frm");

            form.addEventListener('submit', function(event){
                event.preventDefault();

                swal({
                    title:'이 변경 사항이 맞습니까?',
                    text: "전화 번호 > " + newNumberInput +"\n 이메일 > " + newEmailInput,
                    icon:'warning',
                    dangerMode:true,
                    closeOnClickOutside: false,
                    buttons : true,
                }).then((result)=>{
                    if(result){
                        form.submit();
                        modal.style.display = 'none';

                    }else {

                    }
                })

            })
        </script>
    </div>

</div>
<footer class="footerContainer">
    <div class="workLinks">
        <ul>
            <li><a href="">회사소개</a>&emsp;|&nbsp;</li>
            <li><a href="">이용약관</a>&emsp;|&nbsp;</li>
            <li><a href="">개인정보처리방침</a>&emsp;|&nbsp;</li>
            <li><a href="">이메일무단수집거부</a>&emsp;|&nbsp;</li>
            <li><a href="">고정형 영상정보처리기긱 운영 및 관리방침</a>&emsp;|&nbsp;</li>
            <li><a href="">TABLE JAVA회원안내</a>&emsp;|&nbsp;</li>
            <li><a href="">배정기준</a>&emsp;|&nbsp;</li>
            <li><a href="">채용안내</a>&emsp;|&nbsp;</li>
            <li><a href="">광고/임대문의</a>&emsp;&nbsp;</li>
        </ul>
        <div class="footersen">
            <div>충청남도 천안시 동남구 대흥로 215 7층, 8층</div>
            <div>대표 이메일 humanec@naver.com | 고객센터 1566-9564 | 사업자등록번호 667-81-02135 | <a
                    href="#"><span><u>사업자정보확인</u></span></a></div>
            <div>대표이사 박춘보 | 개인정보 보호 책임자 차수 호스팅 제공자 휴먼교육센터</div>
            <div>Copyright &copy; HUMAN Cultureworks All Right Reserved.</div>
        </div>
    </div>
</footer>
</body>
</html>