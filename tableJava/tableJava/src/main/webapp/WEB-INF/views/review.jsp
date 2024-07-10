<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 리뷰 화면</title>
    <link rel="stylesheet" href="css/review.css">
    <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script>
        $(document).ready(function () {

            $(".menu").click(function (event) {
                event.stopPropagation();

                const $submenu = $(this).find(".sub");


                if ($submenu.is(":visible")) {
                    $submenu.slideUp(300);
                } else {

                    $(".sub").not($submenu).slideUp(300);


                    $submenu.slideDown(300);
                }
            });

            $(document).click(function (event) {

                if (!$(event.target).closest('.menu').length && !$(event.target).closest('.sub').length) {
                    $(".sub").slideUp(300);
                }
            });
            $(".sub").hide();


            //  별점
            const ratingStars = [...document.getElementsByClassName("rating__star")];
            const ratingResult = document.getElementById("rating__result");
            const starResult = document.getElementById("star");

            printRatingResult(ratingResult,0);

            function executeRating(stars, result) {
                const starClassActive = "rating__star fas fa-star";
                const starClassUnactive = "rating__star far fa-star";
                const starsLength = stars.length;
                let i;
                stars.map((star) => {
                    star.onclick = () => {
                        i = stars.indexOf(star);

                        if (star.className.indexOf(starClassUnactive) !== -1) {
                            printRatingResult(result, i + 1);
                            for (i; i >= 0; --i) stars[i].className = starClassActive;
                        } else {
                            printRatingResult(result, i);
                            for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
                        }
                    };
                });
            }

            function printRatingResult(result, num) {
                result.textContent = num+`/5`;
                starResult.value = num;
            }

            executeRating(ratingStars, ratingResult);

        });

    </script>

</head>
<body>
<div class="nav">
    <img src="image/logo1.png" alt="로고이미지">
    <div class="buttons-container">
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
            <button type="submit">알림</button>
        </form>
        <form method="post" action="userMyPage">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit">마이 페이지</button>
        </form>
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
    <form action="review" method="post">
        <input type="hidden" name="uId" value="${userId}">
        <input type="hidden" name="rId" value="${restaurantId}">
        <div class="restaurant-info">
            <h2>식당 이름: <span id="restaurant-name">${restaurantName}</span></h2>
            <p>날짜: <span id="restaurant-location">${restaurantDate}</span></p>
            <p>시간: <span id="restaurant-phone">${restaurantTime}</span></p>
        </div>
        <div class="review-section">
            <h3>리뷰 작성</h3>
            <textarea id="review-content" name="review" rows="10" placeholder="여기에 리뷰를 작성하세요"></textarea>
            <div class="rating">
                <span id="rating__result"></span>
                <i class="rating__star far fa-star"></i>
                <i class="rating__star far fa-star"></i>
                <i class="rating__star far fa-star"></i>
                <i class="rating__star far fa-star"></i>
                <i class="rating__star far fa-star"></i>
            </div>
            <input type="hidden" name="star" id="star">
            <button type="submit" id="submit-review">리뷰 제출</button>
        </div>
    </form>
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
