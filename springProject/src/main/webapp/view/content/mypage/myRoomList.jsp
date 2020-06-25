<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content = "ie-edge">
<meta name = "format-detection" content = "telephone-no">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/myRoomList.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/myRoomList_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/myRoomList_moblie.css" media="all and (max-width:760px)">
<title>속닥속닥 :: 나의 관심사</title>
</head>
<body>

	<div class = "myRoomList_wrap">
		<h2>내 관심모임</h2>
		
		<c:forEach var = "myjoinRoom" items = "${myinfo }">
		<div class = "infoone" style = "border-bottom:1px solid #d2d2d2; margin-top: 15px;">
		<a href = "${pageContext.request.contextPath}/room/roomcontent?num=${myjoinRoom.classnum}" style = "display:block;">
			<span class = "info-group">
				<span class="memberLike"><img src = "${pageContext.request.contextPath}/images/${myjoinRoom.interestPng}" style = "width:30px; height:30px; margin-right:5px; vertical-align: text-top;"></span>
				<span class="memberLike">${myjoinRoom.meet_title }</span>
			</span>
			<span class= "letgo" style = "float:right; padding: 8px 0px 8px 0px;">
			<c:if test="${myjoinRoom.status==1 }">
			모임장
			</c:if>
			<c:if test="${myjoinRoom.status==2 }">
			운영진
			</c:if>
			<c:if test="${myjoinRoom.status==3 }">
			회원
			</c:if>
			<i class="xi-angle-right-min" style = "font-size:0.9rem;"></i></span>
		</a>
		</div>
		</c:forEach>
		
	</div>

</body>
</html>