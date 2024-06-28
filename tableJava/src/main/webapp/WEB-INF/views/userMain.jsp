<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 메인 화면</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f3274f01f7f59a2883492e9cd1c8599"></script>
</head>
<body>
	<div class="navbar">
		<button onclick="location.reload()">메인 화면</button>
		<form method="post" action="userBookListPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit">예약/웨이팅</button>
		</form>
		<form method="post" action="userNotificationPage">
        	<input type="hidden" name="userId" value="${userId }">
        	<button type="submit">알림</button>
        </form>
		<form method="post" action="userMyPage">
			<input type="hidden" name="userId" value="${userId }">
			<button type="submit" >마이 페이지</button>
		</form>
	</div>
	<div></div>
	<div class="search-section">
		<div class="search-div">
			<form method="post" action="search" class="search-form">
				<label>검색할 이름:</label> <input type="text" id="keywords"
					name="keywords" placeholder="식당 이름을 입력하세요" required> <input
					type="hidden" name="userId" value="${userId }"> <input
					type="submit" value="검색" class="search-button">
			</form>
		</div>
	</div>
	<div class="map-section">
		<div id="map" style="width: 500px; height: 400px;"></div>
	</div>
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
    
    	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
    	navigator.geolocation.getCurrentPosition(function(position) {
        
        	var lat = position.coords.latitude, // 위도
            	lon = position.coords.longitude; // 경도
        
        	var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            	message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        	// 마커와 인포윈도우를 표시합니다
        	displayMarker(locPosition, message);
            
      	});
    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        	message = 'geolocation을 사용할수 없어요..'
        
    	displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

    	// 마커를 생성합니다
    	var marker = new kakao.maps.Marker({  
        	map: map, 
        	position: locPosition
    	}); 
    
    	var iwContent = message, // 인포윈도우에 표시할 내용
        	iwRemoveable = true;

    	// 인포윈도우를 생성합니다
    	var infowindow = new kakao.maps.InfoWindow({
        	content : iwContent,
        	removable : iwRemoveable
    	});
    
    	// 인포윈도우를 마커위에 표시합니다 
    	infowindow.open(map, marker);
    
    	// 지도 중심좌표를 접속위치로 변경합니다
    	map.setCenter(locPosition);      
	}    
    </script>
	<div class="list-section">
		<ul id="restaurant-list">사용자 위치 기반 주위 식당 리스트
		</ul>
	</div>
</body>
</html>
