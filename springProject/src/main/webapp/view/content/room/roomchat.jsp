<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>

<!-- <link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap-reboot.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap.css"> -->
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" type="text/css"
	href="../../../resources/css/page.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- <script type="text/javascript"
	src="../../../resources/js/jquery-3.2.1.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script> -->
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/roomchat.css">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/roomchat_tablet.css" media="all and (max-width:1420px)">
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/roomchat_mobile.css" media="all and (max-width:760px)">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/sockjs.min.js"></script> --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<style>
::-webkit-scrollbar {

display:none;

} 
</style>
</head>

<body>

<c:if test="${check==1}">
</c:if>
	<c:set var="profile" value='<%=session.getAttribute("login")%>' />


<div class="roomchat_wrap">
	<div class="col-12 row justify-content-center align-items-center my-4">
		<div class="col-8" style="float: left; text-align: center;">${room.meet_title } 채팅방</div>
	</div>

	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"  id="chatArea">

			<div id="chatMessageArea"
				style="margin-top: 10px; margin-left: 10px;"></div>




		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 10px; ;">
		<div class="col-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #dddddd; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id="message"></textarea>
			
			
		<button type="button" id="sendBtn" style="float: right; width: 18%; height: 65px; 
		text-align: center; background-color: #ffd400; border-radius: 5px; border: 0; outline: 0;" >
          <img alt="" src="${pageContext.request.contextPath}/images/paper-plane-solid.svg" style="width: 85%;">
        </button> 
			
		</div>
		

	</div>
</div>
 
	<input type="text" id="nickname" value="${name}"
		style="display: none">
	<input type="button" id="enterBtn" value="입장" style="display: none">
	<input type="button" id="exitBtn" value="나가기" style="display: none">
	
	<script type="text/javascript">
		connect();

		$(document).on("scrollstart",function(){
	      });
		function connect() {
			/* sock = new SockJS('/contextPath/chat'); */
			sock = new SockJS("http://211.63.89.83:8080/SpringProject33/chat");
			/* sock = new SockJS("<c:url value="/chat/"/>"); */
			sock.onopen = function() {
				console.log('open');
			};
			sock.onmessage = function(evt) {
				var data = evt.data;
				console.log(data)
				var obj = JSON.parse(data)
				console.log(obj)
				appendMessage(obj);
			};
			sock.onclose = function() {
				appendMessage("연결을 끊었습니다.");
				console.log('close');
			};
			
			
			<c:forEach var="msli" items="${msli}"> 
			
            if("${name}" == "${msli.message_sender}" ){
               $("#chatMessageArea")
                             .append( 
                            		 "<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#fef01b; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>${msli.message_content.trim()}</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >${msli.message_sendTime}</span></div></div><div class='col-2' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid'  src='${pageContext.request.contextPath}/uploadFile/${msli.message_profileImg}' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${name}</div></div></div>")
				}else{ 
            $("#chatMessageArea")
                  .append(
                		  "<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='${pageContext.request.contextPath}/uploadFile/${msli.message_profileImg}' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${msli.message_sender}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ffffff; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>${msli.message_content.trim()}</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >${msli.message_sendTime}</span></div></div></div>"       
                  )
                 
         }
		</c:forEach>
		  var chatAreaHeight = $("#chatArea").height();
		  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);
		}

		function send() {
			var msg = $("#message").val();
			if (msg != "") {
				message = {};
				message.message_content = $("#message").val()
				message.message_sender ='${name}'
				message.message_profileImg = '${profileImg}'
				message.message_sendTime= getTimeStamp()
				message.class_id ='${room.num}'
			}

			sock.send(JSON.stringify(message));
			$("#message").val("");
		}

		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}

		function appendMessage(msg) {

			if (msg.message_content == '') {
				return false;
			}
				var t = getTimeStamp();
				if(msg.message_sender == "${name}" ){
					$("#chatMessageArea")
					.append(
							"<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#fef01b; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"
									+ msg.message_content
									+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"
									+ t + "</span></div></div><div class='col-2' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid'  src='${pageContext.request.contextPath}/uploadFile/"+msg.message_profileImg+"' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${name}</div></div></div>")
				}else{
				$("#chatMessageArea")
						.append(
								"<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='${pageContext.request.contextPath}/uploadFile/"+msg.message_profileImg+"' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>"+msg.message_sender+"</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ffffff; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"
										+ msg.message_content
										+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"
										+ t + "</span></div></div></div>")
 				}
				var chatAreaHeight = $("#chatArea").height();
				var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
				$("#chatArea").scrollTop(maxScroll);
				
			
		}
		$(document).ready(function() {
			$('#message').keypress(function(event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stopPropagation();
			});

			$('#sendBtn').click(function() {
				send();
			});/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
		});
	</script>

</body>
</html>
