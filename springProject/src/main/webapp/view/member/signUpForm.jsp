<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="#">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content = "ie-edge">
<meta name = "format-detection" content = "telephone-no">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/signUpForm.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/signUpForm_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/signUpForm_moblie.css" media="all and (max-width:760px)">
<title>속닥속닥 :: 회원가입</title>
</head>
<body>

<script language="javascript">
function goPopup(){
	var pop = window.open("<%= request.getContextPath() %>/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.member.userAddr.value = roadFullAddr;		
}
</script>
<script type="text/javascript">

	// 공백체크
	var empJ = /\s/g;
	// 닉네임 정규식 (한글 영문소~대문자 숫자 입력만 가능)
	var nameJ = /^[가-힣a-z0-9]*$/;
	//이메일 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	// 생일
	var birthJ = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	// 주소
	var address = $('#userAddr');
	
	
	$(document).ready(function() {
		var overlap = 0;
		var overlap2 = 0;
		var address = $('#userAddr');
		
		//닉네임 중복확인
		$("#username").blur(function() {
			if($('#username').val()==''){
				$('#name_check').text('닉네임를 입력하세요.');
				$('#name_check').css('color', 'red');
			} else if(nameJ.test($('#username').val())!=true){
				$('#name_check').text('한글, 영문 소문자, 숫자만 사용 가능합니다.');
				$('#name_check').css('color', 'red');
			} else if($('#username').val()!=''){
				var name = $('#username').val();
				$.ajax({
					async: false,
					type : 'POST',
					dataType : "json",
					data : {name : name},
					url : '${pageContext.request.contextPath}/confirmName',
					 error:function(err){
						  alert("서비스가 원활하지 못합니다.  잠시후 다시 시도해주세요");
	                      console.log(err.status+" "+ err.statusText);
	                 },
					success : function(data) {
						console.log(data);
						overlap = data;
						if(data > 0){
						$('#name_check').text('중복된 닉네임입니다.');
						$('#name_check').css('color', 'red');
						$("#usercheck").attr("disabled", true);
			} else {
				if(nameJ.test(name)){
					$('#name_check').text('사용가능한 닉네임입니다.');
					$('#name_check').css('color', 'blue');
					$("#usercheck").attr("disabled", false); // (disabled : false == 활성화)
			} else if(name == ''){
				$('#name_check').text('닉네임를 입력해주세요.');
				$('#name_check').css('color', 'red');
				$("#usercheck").attr("disabled", true);
			} else{
				$('#name_check').text("닉네임은 한글, 소문자와 숫자만 가능합니다.");
				$('#name_check').css('color', 'red');
				$("#usercheck").attr("disabled", true);
			}
		}
		}
		});//ajax///
		}//else if
		});//blur
		
///////////////////////////////////////////////////////////////////////////////////////////
		$("#email").blur(function() {
			if($('#email').val()==''){
				$('#email_check').text('이메일을 입력하세요.');
				$('#email_check').css('color', 'red');
			} else if(mailJ.test($('#email').val())!=true){
				$('#email_check').text('이메일 형식을 지켜주세요.');
				$('#email_check').css('color', 'red');
			} else if($('#email').val()!=''){
				var email = $('#email').val();
				$.ajax({
					async: false,
					type : 'POST',
					dataType : "json",
					data : {email : email},
					url : '${pageContext.request.contextPath}/ConfirmEmail',
					 error:function(err) {
						  alert("서비스가 원활하지 못합니다.  잠시후 다시 시도해주세요");
	                      console.log(err.status+" "+ err.statusText);
	                 },
					success : function(data) {
						console.log(data);
						overlap2 = data;
						if(data > 0){
						$('#email_check').text('중복된 이메일입니다.');
						$('#email_check').css('color', 'red');
						$("#usercheck").attr("disabled", true);
			} else {
				if(mailJ.test(email)){
					$('#email_check').text('사용가능한 이메일입니다.');
					$('#email_check').css('color', 'blue');
					$("#usercheck").attr("disabled", false); // (disabled : false == 활성화)
			} else if(email == ''){
				$('#email_check').text('이메일을 입력해주세요.');
				$('#email_check').css('color', 'red');
				$("#usercheck").attr("disabled", true);
			} else{
				$('#email_check').text("이메일형식을 지켜주세요.");
				$('#email_check').css('color', 'red');
				$("#usercheck").attr("disabled", true);
			}
		}
		}
		});//ajax///
		}//else if
		});//blur
		
///////////////////////////////////////////////////////////////////////////////////////////
			$('form').on('submit', function() {
				var inval_Arr = new Array(7).fill(false);
				alert("정규식체크2");
				
				//성별 확인
				if(member.gender[0].checked==false&&member.gender[1].checked==false){
					inval_Arr[0] = false;
					alert('성별을 확인하세요.');
					return false;
				} else{
					inval_Arr[0] = true;
				}
				
				// 닉네임 정규식 및 확인
				if (nameJ.test($('#username').val()) && $('#username').val().length > 0 && overlap < 0) {
					inval_Arr[1] = true;
				} else {
					inval_Arr[1] = false;
					alert('닉네임을 확인하세요.');
					return false;
				}
				
				// 이메일 정규식
				if (mailJ.test($('#email').val()) && overlap2 < 0) {
					console.log(mailJ.test($('#email').val()));
					inval_Arr[2] = true;
				} else {
					inval_Arr[2] = false;
					alert('이메일을 확인하세요.');
					return false;
				}
				
				// 비밀번호가 같은 경우 && 비밀번호 정규식
				if (pwJ.test($('#password').val()) && ($('#password').val() == ($('#password2').val()))) {
					inval_Arr[3] = true;
				} else {
					inval_Arr[3] = false;
					alert('비밀번호를 확인하세요.');
					return false;
				}
				
				// 휴대전화번호 정규식
				if (phoneJ.test($('#phone-number').val()) && $('#phone-number').val().length > 9) {
					console.log(phoneJ.test($('#phone-number').val()));
					inval_Arr[4] = true;
				} else {
					inval_Arr[4] = false;
					alert('휴대전화번호를 확인하세요.');
					return false;
				}
				
				// 생년월일 정규식
				if (birthJ.test($('#birthday').val())) {
					console.log(birthJ + "생일");
					inval_Arr[5] = true;
				} else {
					inval_Arr[5] = false;
					alert('생년월일을 확인하세요.');
					return false;
				}
				
				// 주소 입력확인
				if(address.val() == ''){
					inval_Arr[6] = false;
					alert('주소를 확인하세요.');
					return false;
				}else
					inval_Arr[6] = true;
				
				//전체 유효성 검사
				var validAll = true;
					for(var i = 0; i < inval_Arr.length; i++) {
						if(inval_Arr[i] == false){
						validAll = false;
						}
					}
					if(validAll == true){ // 유효성 모두 통과
						alert('속닥속닥의 가족이 되어주셔서 감사합니다.');
						alert('관심사를 선택해주세요.');
					} else{
						alert('정보를 다시 확인하세요.');
					}
				});
		
///////////////////////////////////////////////////////////////////////////////////
			// 패스워드 체크
			$('#password').blur(function() {
				if (pwJ.test($('#password').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
					$('#pw_check').css('color', 'red');
				}
			});
			
			// 패스워드 일치 확인
			$('#password2').blur(function() {
				if ($('#password2').val() != $('#password').val()) {
					$('#pw_check').text('비밀번호가 일치하지 않습니다.');
					$('#pw_check').css('color', 'red');
				} else {
					$('#pw_check').text('비밀번호가 일치합니다.');
					$('#pw_check').css('color', 'blue');
				}
			});
			
			/* // 이메일
			$("#email").blur(function() {
				if (mailJ.test($(this).val())) {
					$("#email_check").text('이메일을 입력해주세요.');
					$('#email_check').css('color', 'red');
				} else {
					$('#email_check').text('이메일 양식을 확인해주세요.');
					$('#email_check').css('color', 'red');
				}
			}); */
			
			// 휴대전화
			$('#phone-number').blur(function(){
				if(phoneJ.test($(this).val()) && $(this).val().length > 9){
					console.log(($(this).val()));
					$("#phone_check").text('OK');
					$('#phone_check').css('color', 'blue');
				} else {
					$('#phone_check').text('휴대폰번호를 확인해주세요.');
				$('#phone_check').css('color', 'red');
				}
			});
			
			// 생일
			$('#birthday').blur(function() {
				if(birthJ.test($(this).val()) && $(this).val().length > 7) {
					console.log(($(this).val()));
					$("#birth_check").text('OK');
					$('#birth_check').css('color', 'blue');
				} else {
					$('#birth_check').text('생년월일을 확인해주세요.');
					$('#birth_check').css('color', 'red');
				}
			});
		
 			// 주소
 			$('#findAddr').click(function() {
 				$('#userAddr').focusin(function() {
 					if($('#userAddr').val().length > 0) {
 						$("#userAddr_check").text('OK');
 						$('#userAddr_check').css('color', 'blue');
 					} else {
 						$("#userAddr_check").text('주소를 입력하세요.');
 						$('#userAddr_check').css('color', 'red');
 					}
 				});
 			}); 
});
</script>
<!-- 파일이미지 실시간 로드 -->
<script> 
	$(function() {
	    $("#imgInp").on('change', function(){
	        readURL(this);
	    });
	});

	function readURL(input) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	
	    reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }
	
	      reader.readAsDataURL(input.files[0]);
	    }
	}
</script>




<div class = "signup_wrap">
	<form name="member" id="usercheck" role = "form" method="post" action = "${pageContext.request.contextPath}/member/signUpPro" enctype = "multipart/form-data">
		<h2 class = "login_tit">회원가입</h2>
			<div class = "info-group">
				<div><label for = "gender">성별</label></div>
				<div style = "font-size:16px; color: #474f55;">
					<input type="radio" id= "gender" name="gender" value="남" style = "margin-left: 10px; margin-right:10px;">남
					<input type="radio" id= "gender" name="gender" value="여" style = "margin-left: 10px; margin-right:10px;">여
				</div>
			</div>
			<div class = "row">
				<div class = "info-group col">
					<div><label for = "imgInp">프로필 이미지</label></div>
					<div><input type="file" id="imgInp" name = "profileImg2"></div>
				</div>
				<div class = "info-group col">
					<div><img id="blah" src="" style = "width:200px;"></div>
				</div>
			</div>
			<div class = "info-group">
				<div><label for = "name">닉네임</label></div>
				<div><input type="text" name="name" id="username" placeholder="10자이하" maxlength="10" class="form-control"></div>
				<div class="eheck_font" id="name_check"></div>
			</div>
			<div class = "info-group">
				<div><label for = "email">이메일</label></div>
				<div><input type="text" name="email" id="email" class="form-control input" placeholder="예) yourEmail@gmail.com"></div>
				<div class="eheck_font" id="email_check"></div>
			</div>
			<div class = "row">
				<div class = "info-group col">
					<div><label for = "password">비밀번호</label></div>
					<div><input type="password" id="password" name="password" placeholder="8자 이상" class="form-control form-with-form input"></div>
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class = "info-group col">
					<div><label for = "password2">비밀번호 확인</label></div>
					<div><input type="password" id="password2" name="password2" placeholder="비밀번호 확인" class="form-control form-with-form"></div>
					<div class="eheck_font" id="pw_check2"></div>
				</div>
			</div>
			<div class = "row">
				<div class= "info-group col2">
					<div><label for = phone-number>휴대전화번호</label></div>
					<div><input type="text" id="phone-number" name="phone" placeholder="예) 01012345678" class="form-control input"></div>
					<div class="eheck_font" id="phone_check"></div>
				</div>
			</div>
			<div class = "row">
				<div class= "info-group col2">
					<div><label for = "birthday">생일</label></div>
					<div><input type="text" id="birthday" name="birthday" placeholder= "예) 19940101" maxlength="8" class="form-control input"></div>
					<div class="eheck_font" id="birth_check"></div>
				</div>
			</div>
			<div class = "row">
				<div class= "info-group col3">
					<div><label for = "userAddr">내 지역</label></div>
					<div><button type="button" id = "findAddr" class="btn btn-warning" onclick="goPopup()">주소검색</button></div>
				</div>
				<div class= "info-group col4">
					<div><label for = "userAddr">&nbsp;</label></div>
					<div><input type="text" id="userAddr" name="address" placeholder="주소를 검색하세요." class="form-control" readonly="true"/></div>
					<div class="eheck_font" id="userAddr_check"></div>
				</div>
			</div>
			
			<div class = "rulebox mt5">
				<strong>첫째,</strong>
				모든 참가자는 안전하게 행사에 참가할 권리가 있습니다.
				<br>
				<strong>둘째,</strong>
				의사소통에 있어서 예의 바르고 건설적인 태도를 늘 보여주세요.
				<br>
				<strong>셋째,</strong>
				상대방을 불편하게 한다면 그것은 이미 농담이 아닙니다.
				<br>
				<strong>넷째,</strong>
				모임 및 클래스 개설자와 참가자 모두에게 도움 될 수 있도록 서로 협업합시다.
				<br>
			</div>
			<input type="submit" value="회원가입" class="btn">
			<!-- disabled="disabled" -->
	</form>
</div>

</body>
</html>