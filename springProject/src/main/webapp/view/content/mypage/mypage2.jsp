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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/mypage2.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/mypage2_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/mypage2_moblie.css" media="all and (max-width:760px)">
<title>속닥속닥 :: 마이페이지</title>
</head>
<body>
<script>
        function popup(){
            var url = "${pageContext.request.contextPath}/mypage/popupnote";
            var name = "popup note";
            var option = "width = 460, height = 730, top = 10, left = 200, location = no"
            window.open(url, name, option);
        }
</script>



	<div class = "signup_wrap"> 
		<h2>마이페이지</h2>
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
			<span class = "info-group" style = "float:left;">
				<span><img src = "${pageContext.request.contextPath}/uploadFile/${setmember.profileImg}"></span>
			</span>
			<span class = "row">
				<span class = "info-group cols" style = "margin-bottom:0.3rem!important;">
					<span class = "myname">${setmember.name}</span>
					<span class = "mybir">${setmember.birthday }</span>
				</span>
				<span class= "letgo2" style = "float:right; padding: 0px 0px 0px 115px;">${setAddress }</span>
				<span class = "info-group">
					 <span class = "myintro" style = "margin-bottom:20px;">안녕하세요. 잘부탁드립니다.</span>   
					 <span style = "display: none; padding:7px; border: 1px solid #d2d2d2; border-radius:7px; margin:0px 37px 0px 50px;"><a href = "#" style = "display:block;"><i class  ="xi-mail-o" style = "font-size:23px; vertical-align: bottom"></i>모임초대</a></span>
                  	 <span class = "notenotenote" style = "padding:7px; border: 1px solid #d2d2d2; border-radius:7px; margin:0px 20px 0px 26px;"><a href = "javascript:popup()" style = "display:block;"><i class  ="xi-message-o" style = "font-size:23px; vertical-align: bottom"></i>1:1 메시지함</a></span>
				</span>
			</span>
		</div>
		
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<a href = "${pageContext.request.contextPath}/memberAction/memberLikeForm" style = "display:block">
			<c:if test = "${memberLikecheck < 0}">
			<span class = "info-group">
				<span class="memberLikeName">관심사를 설정해주세요.</span>
			</span>
			<span class= "letgo" style = "float:right; padding: 20px 0px 8px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
			</c:if>
			<c:if test = "${memberLikecheck > 0}">
			<span class = "info-group">
				<c:forEach var = "inter" items = "${setMemInter }">
					<span class="memberLikeName"><img src = "${pageContext.request.contextPath}/images/${inter.interestPng}" style = "width:30px; height:30px; margin-right:5px;"></span>
				</c:forEach>
			</span>
			<span class= "letgo" style = "float:right; padding: 20px 0px 8px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
			</c:if>
		</a>
		</div>
		
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<a href = "${pageContext.request.contextPath}/mypage/myRoomList" style = "display:block">
			<span class = "info-group">
				<span class="memberLike">내 관심모임</span>
			</span>
			<span class= "letgo" style = "float:right; padding: 20px 0px 8px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
		</a>
		</div>
		
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<a href = "${pageContext.request.contextPath}/mypage/mypage">
			<span class = "info-group">
			<%-- <c:forEach var = "interest" items = "${li }"> --%>
				<span class="memberLike">일정 한눈에 보기</span>
			<%-- </c:forEach> --%>
			</span>
			<span class= "letgo" style = "float:right; padding: 20px 0px 8px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
		</a>
		</div>
		
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<a href = "${pageContext.request.contextPath }/map/mapView">
			<span class = "info-group">
				<span class="memberLike">일정 모임 한눈에 보기</span>
			</span>
			<span class= "letgo" style = "float:right; padding: 20px 0px 8px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
		</a>
		</div>
		
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<a href = "${pageContext.request.contextPath}/content/noticeli">
			<span class = "info-group">
			<%-- <c:forEach var = "interest" items = "${li }"> --%>
				<span class="memberLike">공지 사항</span>
			<%-- </c:forEach> --%>
			</span>
			<span class= "letgo" style = "float:right; padding: 20px 0px 8px 0px;"><i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
		</a>
		</div>
		
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
		<form name = "userdel" id = "userdel" method = "post" action = "${pageContext.request.contextPath}/#/#">
			<span class = "info-group">
				<input type ="submit" class = "btn" value = "탈퇴하기" style = "width:469px;">
			</span>
		</form>
		</div>
		
</div>
</body>
</html>