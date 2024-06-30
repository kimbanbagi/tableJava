<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 리뷰 화면</title>
    <link rel="stylesheet" href="css/review.css">
    <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {

            $(".menu").click(function(event) {
                event.stopPropagation();

                const $submenu = $(this).find(".sub");


                if ($submenu.is(":visible")) {
                    $submenu.slideUp(300);
                } else {

                    $(".sub").not($submenu).slideUp(300);


                    $submenu.slideDown(300);
                }
            });

            $(document).click(function(event) {

                if (!$(event.target).closest('.menu').length && !$(event.target).closest('.sub').length) {
                    $(".sub").slideUp(300);
                }
            });
            $(".sub").hide();

            // Star rating functionality
            $(".star").on('mouseover', function() {
                $(this).prevAll().addBack().addClass("hover");
            }).on('mouseout', function() {
                $(this).siblings().addBack().removeClass("hover");
            }).on('click', function() {
                $(this).siblings().removeClass("selected");
                $(this).prevAll().addBack().addClass("selected");
            });


            // Slide show functionality
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let slides = $(".mySlides");
                slides.hide();
                slideIndex++;
                if (slideIndex > slides.length) {slideIndex = 1}
                slides.eq(slideIndex-1).show();
                setTimeout(showSlides, 3000); // Change image every 3 seconds
            }

        });

    </script>

</head>
<body>
<div class="nav">
    <img src="image/logo1.png" alt="로고이미지">
    <div class="buttons-container">
        <form method="POST" action="userMain">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit">메인 화면</button>
        </form>
        <form method="POST" action="UserBookList">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit" name="action" value="bookList">예약 / 웨이팅</button>
        </form>
        <form method="post" action="">
            <input type="hidden" name="userId" value="${userId }">
            <button type="submit">알림</button>
        </form>
        <button onclick="location.reload()">마이 페이지</button>
    </div>
    <div class="menu">
        <span>☰</span>
        <ul class="sub">
            <li><a href="#">홈</a></li>
            <li><a href="#">리뷰 작성</a></li>
            <li><a href="#">환경설정</a></li>
            <li><button type="submit">로그아웃</button></li>
        </ul>
    </div>
</div>
<div class="container">
    <form action="review" method="post">
        <input type="hidden" name="uId" value="${userId}">
        <input type="hidden" name="rId" value="${restaurantId}">
        <input type="hidden" name="rName" value="${restaurantName}">
        <input type="hidden"  value="${restaurantDate}">
        <input type="hidden" value="${restaurantTime}">
        <div class="restaurant-info">
            <h2>식당 이름: <span id="restaurant-name">${restaurantName}</span></h2>
            <p>날짜: <span id="restaurant-location">${restaurantDate}</span></p>
            <p>시간: <span id="restaurant-phone">${restaurantTime}</span></p>
        </div>
        <div class="review-section">
            <h3>리뷰 작성</h3>
            <textarea id="review-content" name="review" rows="10" placeholder="여기에 리뷰를 작성하세요"></textarea>
            <div class="rating">
                <span class="rating-title">평점:</span>
                <span class="star" data-value="1">★</span>
                <span class="star" data-value="2">★</span>
                <span class="star" data-value="3">★</span>
                <span class="star" data-value="4">★</span>
                <span class="star" data-value="5">★</span>
            </div>
            <button type="submit"  id="submit-review" >리뷰 제출</button>
        </div>
    </form>
</div>
<div class="recommended-restaurants">
    <h2>추천 식당</h2>
    <div class="slideshow-container">
        <div class="mySlides">
            <img src="image/dog.jpg">
        </div>
        <div class="mySlides">
            <img src="image/food.png">
        </div>
        <div class="mySlides">
            <img src="image/hotdog.jpg" >
        </div>
        <div class="mySlides">
            <img src="image/steak.jpg" >
        </div>
        <div class="mySlides">
            <img src="image/wine1.jpg">
        </div>
        <div class="mySlides">
            <img src="image/wine2.jpg" >
        </div>
    </div>
</div>
<h2>지역별 식당</h2>
<div class="local-restaurants">
    <div class="restaurant-slider">
        <div class="restaurant-item">
            <img src="image/dog.jpg" alt="Local Restaurant 1">
            <p>Local Restaurant 1</p>
        </div>
        <div class="restaurant-item">
            <img src="image/food.png" alt="Local Restaurant 2">
            <p>Local Restaurant 2</p>
        </div>
        <div class="restaurant-item">
            <img src="image/hotdog.jpg" alt="Local Restaurant 3">
            <p>Local Restaurant 3</p>
        </div>
        <!-- Add more restaurant items as needed -->
    </div>
</div>

<div class="side-banner">
    <h3>최근 본 식당</h3>
    <a href="https://example.com" target="_blank">
        <img src="image/store.jpg" alt="광고 이미지 1">
    </a>
    <a href="https://example.com" target="_blank">
        <img src="image/green.jpg" alt="광고 이미지 2">
    </a>
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
            <div>대표 이메일 humanec@naver.com | 고객센터 1566-9564 | 사업자등록번호 667-81-02135 | <a href="#"><span><u>사업자정보확인</u></span></a> </div>
            <div>대표이사 박춘보 | 개인정보 보호 책임자 차수 호스팅 제공자 휴먼교육센터</div>
            <div>Copyright &copy; HUMAN Cultureworks All Right Reserved. </div>
        </div>
    </div>
</footer>
</body>
</html>
