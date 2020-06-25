<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content = "ie-edge">
<meta name = "format-detection" content = "telephone-no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/mypage2.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/mypage2_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/mypage2_moblie.css" media="all and (max-width:760px)">
<title>속닥속닥 :: 일정 모임 한눈에 보기</title>
</head>
<body>
<style>
.memberLike { margin-top:20px; }
</style>
			
<div class = "signup_wrap">
		<h2>일정 모임 한눈에 보기</h2>
		
		<c:forEach var = "MemjoinClass" items = "${MemjoinClass }" varStatus="status">
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<span data-toggle="collapse" data-target="#notesend${status.index }" id ="map-view${status.index}" style = "display:block">
			<span class = "info-group">
				<span class="memberLike"><img src = "${pageContext.request.contextPath}/images/${MemjoinClass.interestPng }" style = "width:40px; height:40px; margin-right:8px;"></span>
				<span class="memberLike">${MemjoinClass.meet_subtitle }</span>
			</span>
			<span class= "letgo" style = "float:right; padding: 32px 0px 17px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
		</span>
		<div id = "notesend${status.index }" >
			<div id="map${status.index }" style="width:100%; height:345px; margin:20px auto;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af84c07520b3df7162c7ee43532542d0&libraries=services"></script>
			<script>
			var coords;
		
			var mapContainer = document.getElementById('map${status.index}'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.502, 127.026581), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map${status.index} = new kakao.maps.Map(mapContainer, mapOption); 
						
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
 			
			var address = '${MemjoinClass.meet_location}';
			
								
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			       
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map${status.index},
			            position: coords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:1px;font-size:12px;">${MemjoinClass.meet_subtitle}</div>'
			        });
			        infowindow.open(map${status.index}, marker);
					
			
			        map${status.index}.relayout();
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map${status.index}.setCenter(coords);
			        var latlng = map${status.index}.getCenter();
			    } 
			});
			
		</script>
		</div>
		</div>
		</c:forEach>	
</div>


</body>
</html>