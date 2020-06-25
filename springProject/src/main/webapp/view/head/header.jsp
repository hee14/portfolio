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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/style_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/style_moblie.css" media="all and (max-width:760px)">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/fullcalendar.print.min.css" media="print"/>
<script src="${pageContext.request.contextPath }/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.bpopup.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath }/js/ko.js"></script>

<title>속닥속닥 :: 오프라인 모임 플랫폼</title>
</head>
<body>

	<div class = "contain">
		<div class = "header">
			<h1><a href = "${pageContext.request.contextPath}/content/main?pageNum=1"><img src = "${pageContext.request.contextPath}/images/logo2.png" alt = "속닥속닥"></a></h1>
			<nav>
				<ul style = "right:100px;">
					<li style = "right:60px;">
						<div class="search">
							<div class="search-box">
								<form name="searchform" action="${pageContext.request.contextPath}/content/search?pageNum=1">
									<div class="search-area">
										<input class="input-searchbox" id="txtSearchKeyword" type="text" name="keyword" placeholder ="검색">
										<button type="submit" class="btn-search" id="btnSearchKeyword"><i class="fa fa-search" style="font-size: 19px;"></i></button>
									</div>
								</form>
							</div>
						</div>
					</li>
				 </ul>
				 <ul class = "menu">
					<c:if test='${name == null || name.equals("") }'>
					<li><a href = "${pageContext.request.contextPath}/memberAction/loginForm" class = "aaa"><i class = "xi-user"></i><span>Sign In</span></a></li>
					</c:if>
					<c:if test="${name == 'admin' }">
						<li><a href = "#"><i class="xi-profile"></i><span>${name}님</span></a>
						<ul class = "sub-menu" style = "background-color: white;">
							<li><a href = "${pageContext.request.contextPath}/member/logoutPro">로그아웃</a></li>
							<li><a href = "${pageContext.request.contextPath}/ms/adminmain">관리자 모드</a></li>
						</ul>
						</li>
					</c:if>
					<c:if test="${name != 'admin' }">
					<c:if test="${name != null }">
					<li><a href = "#"><i class="xi-profile" style = "display:inline-block"></i><span style = "margin-bottom:0px;">${name}님</span></a>
						<ul class = "sub-menu" style = "background-color: white;">
							<li><a href = "${pageContext.request.contextPath}/member/logoutPro">로그아웃</a></li>
							<li><a href = "${pageContext.request.contextPath}/mypage/mypage2">마이페이지</a></li>
							<li><a href = "${pageContext.request.contextPath}/room/roomWriteForm">모임 등록</a></li>
						</ul>
					</li>
					</c:if>
					</c:if>
				</ul>
			</nav>	
				<!-- 모바일용 드롭다운 -->
				<!-- 로그인 -->
				<c:if test='${name == null || name.equals("") }'>
				<div class="total">
					<div class="search" style = "padding:9px 20px 0px 20px!important; height: 50px; float:left;">
							<div class="search-box" style = "width:200px; height: 40px;">
								<form name="searchform" action="${pageContext.request.contextPath}/content/search?pageNum=1">
									<div class="search-area" style = "width: 200px;">
										<input class="input-searchbox" id="txtSearchKeyword" type="text" name="keyword" placeholder ="검색" style = "width:120px;">
										<button type="submit" class="btn-search" id="btnSearchKeyword" style = "top:-4px;"><i class="fa fa-search" style="font-size: 20px;"></i></button>
									</div>
								</form>
							</div>
					 </div>
					<a href = "${pageContext.request.contextPath}/memberAction/loginForm" class = "aaa">
					<i class='fas fa-user' style='font-size:30px; margin-top: 14px; margin-right: 15px;'></i>
					</a>
				</div>
				</c:if>
				
				<!-- 관리자모드 -->
				<c:if test="${name == 'admin' }">
				<button class="w3-button w3-white w3-large total" style="font-size: 35px!important;" onclick="w3_open()">&#9776;</button>
				<div class="w3-sidebar w3-bar-block w3-dark-grey w3-animate-right total" style="display:none" id="mySidebar">
	  				<button class="w3-bar-item w3-button w3-large" onclick="w3_close()">&times;</button>
	  				 <a href = "#" class="w3-bar-item w3-button w3-large"><i class="xi-profile"></i>${name}님</a>
	 				 <a href="${pageContext.request.contextPath}/member/logoutPro" class="w3-bar-item w3-button">로그아웃</a>
	 				 <a href="${pageContext.request.contextPath}/ms/adminmain" class="w3-bar-item w3-button">관리자 모드</a>
				</div>
			    </c:if>
			    
			    
			    <!-- 회원로그인 -->
			    <c:if test="${name != 'admin' }">
					<c:if test="${name != null }">
					<div class="total">
					   <div class="search" style = "padding:9px 70px 0px 20px!important; height: 50px; float:left;">
							<div class="search-box" style = "width:200px; height: 40px;">
								<form name="searchform" action="${pageContext.request.contextPath}/content/search?pageNum=1">
									<div class="search-area" style = "width: 200px;">
										<input class="input-searchbox" id="txtSearchKeyword" type="text" name="keyword" placeholder ="검색" style = "width:120px;">
										<button type="submit" class="btn-search" id="btnSearchKeyword" style = "top:-4px;"><i class="fa fa-search" style="font-size: 20px;"></i></button>
									</div>
								</form>
							</div>
						</div>
						<button class="w3-button w3-white w3-large total" style="font-size: 25px!important;" onclick="w3_open()">&#9776;</button>
						<div class="w3-sidebar w3-bar-block w3-dark-grey w3-animate-right total" style="display:none" id="mySidebar">
		  				<button class="w3-bar-item w3-button w3-large" onclick="w3_close()">&times;</button>
		  				 <a href = "#" class="w3-bar-item w3-button w3-large"><i class="xi-profile"></i>${name}님</a>
		 				 <a href="${pageContext.request.contextPath}/member/logoutPro" class="w3-bar-item w3-button">로그아웃</a>
		 				 <a href="${pageContext.request.contextPath}/mypage/mypage2" class="w3-bar-item w3-button">마이페이지</a>
		  				 <a href="${pageContext.request.contextPath}/room/roomWriteForm" class="w3-bar-item w3-button">모임 등록</a>
						</div>
					</div>
				    </c:if>
			    </c:if>
		</div> <!-- header_END -->
	</div> <!-- contain_END -->
	

<script>
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
</body>
</html>