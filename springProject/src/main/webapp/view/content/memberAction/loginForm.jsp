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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/loginForm.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/loginForm_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/loginForm_moblie.css" media="all and (max-width:760px)">
<title>속닥속닥 :: 로그인</title>
</head>
<body>
<script>
function checkIt() {
	if(!document.myform.email.value) { 
		alert("이메일을 입력하세요.");
		document.myform.email.focus();
		return false;			
	}
	if(!document.myform.password.value) { 
		alert("비밀번호를 입력하세요");
		document.myform.password.focus();
		return false;			
	}

}
</script>

<div class = "login_wrap">
	<form name = "myform" action="${pageContext.request.contextPath}/member/loginPro" method="post" onSubmit="return checkIt()">
		<h2 class = "login_tit">로그인</h2>
			<div class = "input-info">
				<div class = "info-group">
					<div><label for = "inputEmail">이메일</label></div>
					<div>
						<input type = "text" id = "inputEmail" placeholder="예) yourEmail@gmail.com" name = "email" class = "inputlogin" aria-required="true" aria-invalid="false">
					</div>
				</div>
				<div class = "info-group">
					<label for = "inputPassword">비밀번호</label>
					<input type = "password" id = "inputPassword" name = "password" class = "inputlogin" aria-required="true" aria-invalid="false">
				</div>
			</div>
			<div class = "loginConnec">
				<div class = "loginConnec_info">
					<div class = "autologin">
						<input type = "checkbox" id = "autoCheck" class = "auto-check">
						<label for = "autoCheck" class = "auto-check-label">자동 로그인</label>
					</div>
					<div class = "findinfo">
						<div class = "findinfo-list">
							<div class = "findinfo-list-li"><u>아이디 찾기</u></div>
							<span class = "line" style = "color:#ced3d6">│</span>
							<div class = "findinfo-list-li"><u>비밀번호 재설정</u></div>
						</div>
					</div>
				</div>
			</div>
			<input type = "submit" value = "로그인" class = "btn btn-login">
			<div class = "singuplink">SOGDAG 계정이 없으시다면, 지금 바로 <a href = "${pageContext.request.contextPath}/member/signUpForm"><u style = "color: #fd8533!important">회원가입</u></a></div>
	</form>
</div>
	

</body>
</html>