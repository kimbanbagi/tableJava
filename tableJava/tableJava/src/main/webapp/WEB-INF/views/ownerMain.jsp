<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Information</title>
    <link rel="stylesheet" href="css/ownerMain.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
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

            $('.dark-mode-btn').click(function () {
                $('body').toggleClass('dark-mode');

                // 테마 상태 저장
                if ($('body').hasClass('dark-mode')) {
                    localStorage.setItem('theme', 'dark-mode');
                } else {
                    localStorage.setItem('theme', '');
                }

                // 테마 적용 (선택사항)
                const theme = localStorage.getItem('theme');
                if (theme) {
                    $('#dark-mode-style').attr('href', theme === 'dark-mode' ? 'css/dark-mode.css' : '');
                }
            });

            // 페이지 로드 시 테마 복원
            const theme = localStorage.getItem('theme');
            if (theme) {
                $('body').addClass(theme);
                $('#dark-mode-style').attr('href', theme === 'dark-mode' ? 'css/dark-mode.css' : '');
            }
        });

        // 구글 차트 라이브러리 로드 및 초기화
        google.charts.load('current', {'packages':['corechart', 'bar']});

        // 페이지 로드 후 실행할 함수
        document.addEventListener('DOMContentLoaded', function() {
            // 차트 그리기 함수 호출
            drawCharts();
        });

        // 차트 그리기 함수
        async function drawCharts() {
            await new Promise((resolve, reject) => {
                google.charts.setOnLoadCallback(resolve);
            });

            // 테스트용 데이터 (실제 데이터를 사용할 경우 서버 측에서 제공해야 함)
            var stats = {
                rCancelFromUser: ${stats.rCancelFromUser},
                rCancelFromOwner: ${stats.rCancelFromOwner},
                rEndSuccess: ${stats.rEndSuccess},
                oneStar: ${stats.oneStar},
                twoStar: ${stats.twoStar},
                threeStar: ${stats.threeStar},
                fourStar: ${stats.fourStar},
                fiveStar: ${stats.fiveStar}
            };

            // 데이터 준비
            var pieData = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['사용자가 취소한 예약', stats.rCancelFromUser],
                ['사장님이 취소한 예약', stats.rCancelFromOwner],
                ['예약 종료', stats.rEndSuccess]
            ]);

            var barData = google.visualization.arrayToDataTable([
                ['', 'Review', { role: 'style' }],
                ['1 점', stats.oneStar, 'color: red'],
                ['2 점', stats.twoStar, 'red'],
                ['3 점', stats.threeStar, 'red'],
                ['4 점', stats.fourStar, 'red'],
                ['5 점', stats.fiveStar, 'red']
            ]);

            // 옵션 설정
            var pieOptions = {
                title: ''
            };

            var barOptions = {
                chart: {
                    title: ''
                },
                hAxis: {
                    title: ''
                },
                vAxis: {
                    title: ''
                },
                bars: 'horizontal'
            };

            // 차트 그리기
            var pieChart = new google.visualization.PieChart(document.getElementById('piechart'));
            var barChart = new google.charts.Bar(document.getElementById('chart_div'));

            pieChart.draw(pieData, pieOptions);
            barChart.draw(barData, google.charts.Bar.convertOptions(barOptions));
        }
    </script>
</head>
<body>
<div class="nav">
    <img src="image/logo1.png" alt="로고이미지" class="navbar_logo">
    <div class="buttons-container navbar_links">
        <form method="POST" action="ownerMainPage">
            <input type="hidden" name="userId" value="${userId }">
            <input type="hidden" name="restaurantId" value="${restaurantId }">
            <button type="submit">메인</button>
        </form>
        <form method="POST" action="ownerBookListPage">
            <input type="hidden" name="userId" value="${userId }">
            <input type="hidden" name="restaurantId" value="${restaurantId }">
            <button type="submit">예약/웨이팅</button>
        </form>
        <form method="post" action="ownerNotificationPage">
            <input type="hidden" name="userId" value="${userId }">
            <input type="hidden" name="restaurantId" value="${restaurantId }">
            <button type="submit">알림</button>
        </form>
        <form method="POST" action="ownerMyPage">
            <input type="hidden" name="userId" value="${userId }">
            <input type="hidden" name="restaurantId" value="${restaurantId }">
            <button type="submit">마이 페이지</button>
        </form>
    </div>
    <div class="menu">
        <span>☰</span>
        <ul class="sub">
            <li>
                <button class="dark-mode-btn">다크 모드</button>
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

<div class="content">
    <div class="container">
        <div class="header">
            내 식당 정보
        </div>
        <div class="info">
            <div class="info-sub">
                <img src="${restaurant.fileName}" alt="식당 사진">
                <p><strong>식당 이름: </strong> ${restaurant.rName}</p>
                <p><strong>사업자 번호: </strong> ${restaurant.rId}</p>
                <p><strong>수용 가능 인원: </strong> ${restaurant.rHead} 명</p>
                <p><strong>도시 : </strong> ${restaurant.rCity}</p>
                <p><strong>식당 상세주소 : </strong> ${restaurant.rAddress}</p>
                <p><strong>식당 번호 : </strong> ${restaurant.rNumber}</p>
                <c:if test="${restaurant.rStatus == 'T'}">
                    <p><strong>식당 예약 여부 : </strong> 가능</p>
                </c:if>
                <c:if test="${restaurant.rStatus == 'F'}">
                    <p><strong>식당 예약 여부 : </strong> 불가능</p>
                </c:if>
                <c:if test="${restaurant.wStatus == 'T'}">
                    <p><strong>식당 웨이팅 여부:</strong> 가능</p>
                </c:if>
                <c:if test="${restaurant.wStatus == 'F'}">
                    <p><strong>식당 웨이팅 여부:</strong> 불가능</p>
                </c:if>
            </div>

            <div class="statsDiv">
                <div class="statsLabel" id="statsLabel"></div>
                <div id="piechart"></div>
                <div class="reviewLabel" id="reviewLabel"></div>
                <div id="chart_div"></div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <p>Copyright © 2024 TableJava. All rights reserved.</p>
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

<script>
    var date = new Date();
    var month = date.getMonth() + 1;
    var firstDay = new Date(date.getFullYear(), date.getMonth() + 1, 1).getDate();
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();

    document.getElementById("statsLabel").innerHTML = month + '월 ' + firstDay + '일 ~ ' + lastDay + '일 예약 통계';
    document.getElementById("reviewLabel").innerHTML = "리뷰 별점 분포도";
</script>
</body>
</html>