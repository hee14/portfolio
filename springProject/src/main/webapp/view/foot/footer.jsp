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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel = "stylesheet" href="<%= request.getContextPath() %>/css/footer.css">
<title>Insert title here</title>
</head>
<body>

	<div class = "foot_container">
		<div id = "footer-wrap">
			<ul class = "footer-cont">
				<li class = "contlogo"><img src = "<%=request.getContextPath() %>/images/logo2.png" alt = "속닥속닥"></li>
				<span class = "social_item">
					<a href = "#"><li class = "twitter"><i class="fa fa-twitter" aria-hidden="true" style="line-height:1.4"></i></li></a>
					<a href = "#"><li class = "facebook"><i class="fa fa-facebook-official" aria-hidden="true" style="line-height:1.4"></i></li></a>
				</span>
			</ul>
			<div class = "footcont">
				<span>이용약관 </span><span>&nbsp;·&nbsp;</span>
				<span>개인정보처리 방침 </span><span>&nbsp;·&nbsp;</span>
				<span>커뮤니티 운영원칙 </span><span>&nbsp;·&nbsp;</span>
				<span><a href="${pageContext.request.contextPath}/content/noticeli">공지사항</a> </span><span>&nbsp;·&nbsp;</span>
				<span><a href='#' onclick="goDown()" type="application/vnd.android.package-archive">App 다운로드</a></span><span>&nbsp;·&nbsp;</span>
				<span>문의하기</span>					
			</div>
			<ul class = "companycard">
				<li class = "comcont">
         			 대표자: 이우빈 / 상호명: 속닥속닥(SOGDAG) / 사업자등록번호: 000-00-00000 / 주소: 서울특별시 강남구 테헤란로 98, 2동 2층 209호 / 이메일: jabaraba1030@gmail.com
         		</li>		
			</ul>
		</div>
	</div>
	
<script>
function goDown(){
	var pop = window.open("https://drive.google.com/file/d/1hamMgRneCFUdV8uu0_j3UkWoTdwVeH4X/view?usp=sharing","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
</script>
</body>
</html>