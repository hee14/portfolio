<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/roomchat.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/roomchat_tablet.css"
	media="all and (max-width:1420px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/roomchat_mobile.css"
	media="all and (max-width:760px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/roomchat_mobile2.css"
	media="all and (max-width:580px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/roomchat_mobile3.css"
	media="all and (max-width:450px)">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>

<title>Insert title here</title>


<style>
table {
	border-collapse: collapse;
	width: 80%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}

.roombtn {
	display: block;
	text-align: center;
	vertical-align: middle;
	user-select: none;
	border: 1px solid #c2c2c2;
	padding: 0.4rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 3px;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	width: 100%;
	font-weight: 400;
	margin-top: 0.75rem !important;
	margin-bottom: 0.75rem !important;
}

::-webkit-scrollbar {
	display: none;
}
 
.mo_wn{
width: initial;
}
@media (min-width: 601px){}
.mo_wn {
    width: 24.99999%;
}

/* .w3-border-grey, .w3-hover-border-grey:hover, .w3-border-gray, .w3-hover-border-gray:hover {
    border-color: #348ed9!important;
    color: #348ed9!important;
} */
.w3-bottombar {
    border-bottom: 1.5px solid !important;
}
.w3-container{
	padding-left: 7%; 
	padding-right: 7%; 
	z-index: 99999;
}
.photo_td {
	padding: 17px;
	text-align: center;
	border-bottom: none;
}
.photo_tr{
	padding: 8px;
	text-align: center;
	border-bottom: none;
}

.modal {
	position: absolute;
	top: 900px;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.modal_overlay {
	background-color: rgba(0, 0, 0, 0.0);
	width: 100%;
	height: 100%;
	position: absolute;
}

.modal_content {
	background-color: white;
	padding: 10px;
	position: fixed;
	top: 0px;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
	margin: auto;
	position: relative;
	width: 20%;
	vertical-align: middle;
}

.modal_content>button {
	border: none;
}

.hidden {
	display: none;
}

@media ( max-width : 750px) {
	.modal_content {
		background-color: white;
		padding: 10px;
		position: fixed;
		top: 0px;
		border-radius: 10px;
		box-shadow: 0 10px 20px rgba(0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
		margin: auto;
		position: relative;
		width: 60%;
		vertical-align: middle;
	}
}

@media ( max-width : 500px) {
	.modal_content {
		background-color: white;
		padding: 10px;
		position: fixed;
		top: 0px;
		border-radius: 10px;
		box-shadow: 0 10px 20px rgba(0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
		margin: auto;
		position: relative;
		width: 80%;
		vertical-align: middle;
	}
}
</style>



</head>
<body>

	<br />
	<br />


	<div class="w3-container roomcon" style="padding-left: 15%; padding-right: 15%; z-index: 99999">
		<div class="w3-row rororo" style = "margin-left:35px;">
			<a href="javascript:void(0)" onclick="openCity(event, 'info');" class="mobilelink">
				<div
					class="mobilea w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding"
					style="text-align: center">정보</div>
			</a> <a href="javascript:void(0)" onclick="articleClick(${check});" class="mobilelink">
				<div
					class="mobilea w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding"
					style="text-align: center">게시판</div>
			</a> <a href="javascript:void(0)" onclick="photoClick(${check})" class="mobilelink">
				<div
					class="mobilea w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding"
					style="text-align: center">사진첩</div>
			</a> <a href="javascript:void(0)" onclick="chatClick(${check});" class="mobilelink">
				<div
					class="mobilea w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding"
					style="text-align: center">채팅</div>
			</a>
		</div>


		<!-- 모임정보 -->
		<div id="info" class="w3-container city infoinfos" style="display: none; padding-left:11%;">
			<h1></h1>
			<div style="display: inline;">
				<img src="<%= request.getContextPath()%>/uploadFile/${room.photo}"
					style="width: 100%; margin-bottom: 20px;">
				<h4 style="margin-bottom: 30px; text-align: center;">
					<img src="${pageContext.request.contextPath}/images/${roomCateImg}"
						style="width: 40px; height: 40px;">&nbsp; ${room.meet_title }
				</h4>
				<p style="margin-bottom: 18px; font-size: 18px; text-align: center;">${room.content }</p>
				<c:if test="${jangCheck == 1}">
					<a href="roombook?num=${room.num }"
						style="display: block; text-decoration: none; color: #a9afb3;">
						<div>
							<div style="display: inline;">
								<div
									style="font-size: 15px; padding: 5px; border-top: 1px solid #bac1c5; border-bottom: 1px solid #bac1c5;">
									<img
										src="${pageContext.request.contextPath}/images/appointment.png"
										style="width: 50px; height: 50px;"> <span
										style="margin-left: 10px;">정모 만들기</span> <span class="letgo"
										style="float: right; padding: 15px 0px 15px 0px;"><i
										class="xi-angle-right-min" style="font-size: 0.9rem;"></i></span>
								</div>
							</div>
						</div>
					</a>
					<%-- 										<c:forEach var="book" items="${li }" varStatus="index"> --%>
					<!-- 											<div -->
					<!-- 												style="height: 70px; font-size: 15px; padding: 10px; border-top: 1px solid #bac1c5; border-bottom: 1px solid #bac1c5;"> -->
					<%-- 												<c:if test="${bookmemcheck.get(index.index)==0 }"> --%>
					<!-- 													<button -->
					<!-- 														style="float: right; margin: 10px 0 0 10px; background-color: #65FF5E" -->
					<%-- 														onclick="insertbook(${book.book_id},${room.num })">일정 --%>
					<!-- 														참가</button> -->
					<%-- 												</c:if> --%>
					<%-- 												<c:if test="${bookmemcheck.get(index.index)!=0 }"> --%>
					<!-- 													<button -->
					<!-- 														style="float: right; margin: 10px 0 0 10px; background-color: #FF7E7E" -->
					<%-- 														onclick="deletebook(${book.book_id},${room.num })">일정 --%>
					<!-- 														취소</button> -->
					<%-- 												</c:if> --%>
					<%-- 												<span style="margin-left: 10px;">${book.meet_subtitle }</span> <span --%>
					<!-- 													class="letgo" style="float: right; margin: auto"> 정원 -->
					<%-- 													&nbsp;&nbsp;&nbsp; ${bookmemli.get(index.index) } --%>
					<%-- 													/${book.membercnt } <br /> 참가비 ${book.fee }원 --%>
					<!-- 												</span> -->
					<!-- 												<button onclick="managiment('memmodal')">참가회원</button> -->
					<!-- 												<div class="modal hidden" id="memmodal"> -->
					<!-- 														<div class="modal_overlay"> -->
					<!-- 															<div class="modal_content"> -->
					<!-- 															<h1>test test test</h1> -->
					<!-- 															</div> -->
					<!-- 														</div> -->
					<!-- 													</div> -->
					<!-- 											</div> -->
					<%-- 										</c:forEach> --%>
				</c:if>

				<c:if test="${bookCheck == 0}">
				<c:if test="${jangCheck == 0}">
					<a href="#"
						style="display: block; text-decoration: none; color: #a9afb3;">
						<div>
							<div style="display: inline;">
								<div
									style="font-size: 15px; padding: 5px; border-top: 1px solid #bac1c5; border-bottom: 1px solid #bac1c5;">
									<img
										src="${pageContext.request.contextPath}/images/appointment.png"
										style="width: 50px; height: 50px;"> <span
										style="margin-left: 10px;">현재 정모가 없습니다.</span> <span
										class="letgo"
										style="float: right; padding: 15px 0px 15px 0px;"><i
										class="xi-angle-right-min" style="font-size: 0.9rem;"></i></span>
								</div>
							</div>
						</div>

					</a>
					</c:if>
				</c:if>
				<c:if test="${bookCheck > 0}">
					<c:forEach var="book" items="${li }" varStatus="index">
					<c:if test="${now<=book.meet_date_start }"> 
						<div
							style="height: 70px; font-size: 15px; padding: 10px; border-top: 1px solid #bac1c5; border-bottom: 1px solid #bac1c5;">
							<c:if test="${bookmemcheck.get(index.index)==0 }">
								<button
									style="float: right; margin: 10px 0 0 10px; background-color: #65FF5E"
									onclick="insertbook(${book.book_id},${room.num })">일정
									참가</button>
							</c:if>
							<c:if test="${bookmemcheck.get(index.index)!=0 }">
								<button
									style="float: right; margin: 10px 0 0 10px; background-color: #FF7E7E"
									onclick="deletebook(${book.book_id},${room.num })">일정
									취소</button>
							</c:if>
							<span style="margin-left: 10px;">${book.meet_subtitle }</span> <span
								class="letgo" style="float: right; margin: auto"> 정원
								&nbsp;&nbsp;&nbsp; ${bookmemli.get(index.index) }
								/${book.membercnt } <br /> 참가비 ${book.fee }원
							</span>
							<button onclick="managiment('memmodal${index.index}')">참가회원</button>
							<div class="modal hidden" id="memmodal${index.index}">
								<div class="modal_overlay">
									<div class="modal_content">
										<c:forEach var="bookmember" items="${bookmemberlist }">
											<c:if test="${bookmember.book_id==book.book_id }">
												<a href=""
													style="display: block; text-decoration: none; color: black;">
													<div style="border-bottom: 1px solid #bac1c5;">
														<div style="display: inline;">
															<div style="margin-top: 5px; margin-bottom: 5px;"
																class="cssjolist">
																<img
																	src="${pageContext.request.contextPath}/images/profilll.jpg"
									style="width: 40px; height: 40px; border-radius: 100%;">

																<span
																	style="font-size: 15px;  color: black">${bookmember.name}</span>
															</div>
														</div>
													</div>
												</a>
											</c:if>
										</c:forEach>
										<button onclick="hide('memmodal${index.index}')">돌아가기</button>

									</div>
								</div>

							</div>
						</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
			<div>
				<div style="display: inline;">
					<div
						style="font-size: 15px; padding: 5px; border-bottom: 2px solid #bac1c5;">
						모임 멤버 현재 ${nowcnt} 명/최대 ${joinMemberCnt }명

						<c:if test="${jangCheck == 1}">

							<button onclick="managiment('modal')">회원 관리</button>
						</c:if>
						<script>
							function managiment(e) {
								
								var modal = document.getElementById("modal");
// 								var memmodal = document.getElementById("memmodal");
								var memmodalcl = document.getElementsByClassName("modal");
								
								if(e!="modal"){
								for(var i=0;i<memmodalcl.length;i++){
									if(memmodalcl[i].id==e){
									memmodalcl[i].classList.remove("hidden");}
								}}
								
								if(e=="modal"){
								modal.classList.remove("hidden");
								}
								
							}
							function hide(e) {
								var modal = document.getElementById("modal");
// 								var memmodal = document.getElementById("memmodal")
								var memmodalcl = document.getElementsByClassName("modal");
								
								if(e!="modal"){
								for(var i=0;i<memmodalcl.length;i++){
									if(memmodalcl[i].id==e){
									memmodalcl[i].classList.add("hidden");}
								}}
								if(e=="modal"){
								modal.classList.add("hidden");
								}

							}
							</script>
						<div class="modal hidden" id="modal">
							<div class="modal_overlay">
								<div class="modal_content">
									<c:forEach var="joinMember" items="${memberList }">

										<div style="border-bottom: 1px solid #bac1c5;">
											<div style="display: inline;">
												<div style="margin-top: 5px; margin-bottom: 5px;"
													class="csslist">
													<c:if test="${jangCheck == 1}">
														<c:if test="${joinMember.status !=1 }">
															<input type="checkbox"
																value="${joinMember.name}:${joinMember.classnum}"
																name="memcheck">
														</c:if>
													</c:if>
													<c:if test="${jangCheck != 1}">
														<c:if test="${joinMember.status ==3 }">
															<input type="checkbox"
																value="${joinMember.name}:${joinMember.classnum}"
																name="memcheck">
														</c:if>
													</c:if>
													<img
														src="${pageContext.request.contextPath}/uploadFile/${joinMember.profileimg}"
														style="width: 40px; height: 40px; border-radius: 100%;">

													<c:if test="${name==joinMember.name }">
														<span
															style="font-size: 15px; font-weight: bold; color: green">${joinMember.name}</span>
													</c:if>
													<c:if test="${name!=joinMember.name }">
														<span style="font-size: 15px;">${joinMember.name}</span>
													</c:if>
													<c:if test="${joinMember.status == 1}">
														<span
															style="float: right; font-size: 15px; padding: 9px; color: red;">모임장</span>
													</c:if>
													<c:if test="${joinMember.status == 2}">
														<span
															style="float: right; font-size: 15px; padding: 9px; color: blue;"
															class="cssstatu">운영진</span>
													</c:if>

													<c:if test="${joinMember.status == 3}">
														<span
															style="float: right; font-size: 15px; padding: 9px; color: black;"
															class="cssstatu">일반회원</span>
													</c:if>
												</div>
											</div>
										</div>
									</c:forEach>
									<button onclick="kick()">추방</button>
									<c:if test="${jangCheck == 1}">
										<button onclick="stat(2)">진급</button>
										<button onclick="stat(3)">강등</button>
									</c:if>
									<button onclick="hide('modal')">돌아가기</button>
								</div>
								<script type="text/javascript">
									
									function kick(){
										if(confirm("정말 추방 하시겠습니까??")==true){
										var checklist = new Array();
										var array = document.getElementsByName("memcheck");
										var csslist = document.getElementsByClassName("csslist");
										var cssjolist = document.getElementsByClassName("cssjolist");
										for(var i=0;i<array.length;i++){
											if(array[i].checked==true){
												checklist.push(array[i].value);
											}
										}			
										var data = {
												"kicklist" : checklist
										}
										 $.ajax({
								               url: "${pageContext.request.contextPath}/room/memberkick",
								               type: "POST",
								               data: data,
								               success: function(){
								            	   
								            	   var array = document.getElementsByName("memcheck");
								            	   for(var i=0;i<array.length;i++){
														if(array[i].checked==true){
															csslist[i].style.display = "none";
															cssjolist[i].style.display = "none";
														}
													}
								                 
								               },
								               error: function(){
								                   alert("serialize err");
								               }
								           });
										}else{
											return;
										}

									}
									
									function stat(e){
										var checklist = new Array();
										var cssstatu = document.getElementsByClassName("cssstatu");
										
										var array = document.getElementsByName("memcheck");
										for(var i=0;i<array.length;i++){
											if(array[i].checked==true){
												checklist.push(array[i].value);
											}
										}
										var data = {
												"statlist" : checklist,
												"statu" : e
										}
										 $.ajax({
								               url: "${pageContext.request.contextPath}/room/memberstat",
								               type: "POST",
								               data: data,
								               success: function(){
								            	   var array = document.getElementsByName("memcheck");
								            	   for(var i=0;i<array.length;i++){
														
														if(array[i].checked==true){
															if(e==2){
															cssstatu[i].style.color = "blue";
															cssstatu[i].innerHTML = "운영진";
															}else if(e==3){
																cssstatu[i].style.color = "black";
																cssstatu[i].innerHTML = "일반회원";
															}
// 															cssjolist[i].style.display = "none";
														}
													}
								                 
								               },
								               error: function(){
								                   alert("serialize err");
								               }
								           });
									}
									
									</script>
							</div>
						</div>
					</div>

				</div>
			</div>
			<c:forEach var="joinMember" items="${memberList }">
				<a
					href="${pageContext.request.contextPath}/memberAction/memberInfo?memid=${joinMember.memid}"
					style="display: block; text-decoration: none; color: black;">
					<div style="border-bottom: 1px solid #bac1c5;">
						<div style="display: inline;">
							<div style="margin-top: 5px; margin-bottom: 5px;"
								class="cssjolist">
								<img
									src="${pageContext.request.contextPath}/uploadFile/${joinMember.profileimg}"
									style="width: 40px; height: 40px; border-radius: 100%;">

								<c:if test="${name==joinMember.name }">
									<span style="font-size: 15px; font-weight: bold; color: green">${joinMember.name}</span>
								</c:if>
								<c:if test="${name!=joinMember.name }">
									<span style="font-size: 15px;">${joinMember.name}</span>
								</c:if>
								<c:if test="${joinMember.status == 1}">
									<span
										style="float: right; font-size: 15px; padding: 9px; color: red;">모임장</span>
								</c:if>
								<c:if test="${joinMember.status == 2}">
									<span
										style="float: right; font-size: 15px; padding: 9px; color: blue;">운영진</span>
								</c:if>

								<c:if test="${joinMember.status == 3}">
									<span
										style="float: right; font-size: 15px; padding: 9px; color: black;">일반회원</span>
								</c:if>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
			<form action="regist" method="post"
				onsubmit="return submitCheck(${room.num },${check });">
				<input type="hidden" name="num" value="${room.num }"> <input
					type="hidden" name="like_ca" value="${room.like_ca }"> <input
					type="hidden" name="membercnt" value="${room.membercnt }">
				<input type="hidden" name="meet_title" value="${room.meet_title }">
				<input type="hidden" name="check" value="${check }">
				<c:if test="${check==0 }">
					<input type="submit" value="가입하기" class="roombtn">
				</c:if>
				<c:if test="${check!=0 }">
					<input type="submit" value="탈퇴하기" class="roombtn">
				</c:if>
				<br />
			</form>
			<a href="javascript:history.go(-1)">뒤로가기</a>
		</div>
	</div>

	<!-- 게시판 -->
	<div id="board" class="w3-container city" style="display: none">
		<br />
		<div class="w3-container">
			<span class="w3-center w3-large"></span>
			<p class="w3-right w3-padding-right-large">	
				<c:if test="${check!=0 }"> <!-- check!=0: 가입된 회원. check==0: 가입하지 않은 회원 -->
					<a href="${pageContext.request.contextPath}/board/write?num=${room.num }"> <!-- 모임원이라면 글쓰기 버튼 보여줌 -->
						<img src='<%=request.getContextPath()%>/images/plus.png' style="width: 20px; height: 20px">
					</a>
				</c:if>	
			</p>
			<br>
			<!-- 게시물 수(count)가 0인 경우-->
			<c:if test="${count==0 }">
				<table align="center" style="font-size: 15px;">
					<tr>
						<td>게시판에 저장된 글이 없습니다.</td>
					</tr>
				</table>
			</c:if>

			<c:if test="${count!=0 }">
				<table align="center" style="font-size: 17px;">
					<c:forEach var="article" items="${articleli}" varStatus="status">
						<tr style="cursor: hand"  onClick="location.href='${pageContext.request.contextPath}/board/content?articlenum=${article.articlenum}'">
							<td align="center">
								<span> 
									<span> 
										<span style="float: left;"> 
											<img src="${pageContext.request.contextPath}/uploadFile/${article.profileImg }" style="width: 45px; height: 45px; border-radius: 100%;">
										</span>
										<span style="font-size: 0.7rem"> 
											<span> 
												<span style="margin-left: 8px;">${article.name}</span>
												<br/> 
												<span style="margin-left: 8px;">
													<fmt:formatDate value="${article.reg_date}" pattern="yyyy-MM-dd HH:mm" />
												</span>
											</span> 
											
											<span style="float: right"> 
												<img src='<%=request.getContextPath()%>/images/like.png' id='${article.articlenum}like_img' style="width: 16px; height: 16px">
												&nbsp <span style="margin-right: 3px;">${article.like1}</span> 
												&nbsp <img src='<%=request.getContextPath()%>/images/comment.png' style="width: 18px; height: 18px">
												&nbsp ${commentCountList.get(status.index)}
												&nbsp <img src='<%=request.getContextPath()%>/images/readcount.png' style="width: 20px; height: 20px">
												&nbsp ${article.readcount}
											</span>
										</span>
									</span>
									<br/><br/>
									<strong>${article.subject}</strong>
									<br/>
									${article.content}
								</span>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<p align="center">
					<c:if test="${startPage > bottomLine}">
						<a href="${pageContext.request.contextPath}/room/roomcontent?num=${room.num }&pageNum=${startPage - bottomLine}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="${pageContext.request.contextPath}/room/roomcontent?num=${room.num }&pageNum=${i}" onClick="openCity(event, 'board');">[${i}]</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="${pageContext.request.contextPath}/room/roomcontent?num=${room.num }&pageNum=${startPage + bottomLine}">[다음]</a>
					</c:if>
				</p>
			</c:if>
		</div> <!-- .w3-container -->
	</div> <!-- #board -->

	<!-- 사진첩 -->
	<div id="photo" class="w3-container city" style="display: none">
			<br/>
			
			<!-- 사진 추가하기 버튼 -->
			<span style="float:right;">
			<c:if test="${check!=0 }">
				<a href='<%=request.getContextPath()%>/photo/photoUpload?num=${room.num }'>
					<img src='<%=request.getContextPath()%>/images/plus.png' style="width: 20px; height: 20px">
				</a>
				</c:if>
			</span>
			
			<br/>
			
			<c:if test="${photoCount==0 }">
				<table align="center">
					<tr>
						<td>저장된 사진이 없습니다.</td>
					</tr>
				</table>
			</c:if>
			
			<c:if test="${photoCount!=0 }">
			<div align="center">
				<table align="center">
				<tr class="photo_tr">
					<c:forEach var="li" items="${photoList}" varStatus="status">
							<tr>
										<td class="photo_td" onClick="photoClick(${check}, ${photo.photonum});">
										<a href="${pageContext.request.contextPath}/photo/photoContent?photonum=${li.photonum}">
											<img src="${pageContext.request.contextPath}/uploadFile/${li.filename}" style="width:150px; height:150px;">
										</a>
									</td>
								
							</tr>
					</c:forEach>
				
				</table>
				
				<%-- <c:if test="${startPage > bottomLine}">
					<a href="${pageContext.request.contextPath}/room/roomcontent?num=${room.num }&pageNum=${startPage - bottomLine}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a
						href="${pageContext.request.contextPath}/room/roomcontent?num=${room.num }&pageNum=${i}"
						onClick="openCity(event, 'board');">[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a
						href="${pageContext.request.contextPath}/room/roomcontent?num=${room.num }&pageNum=${startPage + bottomLine}">[다음]</a>
				</c:if> --%>
				
			</div>
			</c:if>	
						
								
		</div>


	<!-- 채팅 -->
	<div id="chat" class="w3-container city" style="display: none">
		<c:if test="${check==1}">
		</c:if>
		<c:set var="profile" value='<%=session.getAttribute("login")%>' />


		<div class="roomchat_wrap">
			<div
				class="col-12 row justify-content-center align-items-center my-4 chatTitle" style=" display: flex; padding-left:38px;">
				<div class="col-8 chatTitlename" style="float: left; text-align: center;">${room.meet_title }
					채팅방</div>
			</div>

			<!-- 채팅내용 -->
			<div class="col-12 chatchat">
				<div class="col-11 chatchatA" id="chatArea">
					<div id="chatMessageArea"
						style="margin-top: 10px; margin-left: 10px;"></div>
				</div>
			</div>

			<!-- 채팅입력창 -->
			<div class="col-12" style="margin-top: 10px;">
				<div class="col-12 chatinput" style="float: left">
					<textarea class="form-control"
						style="border: 1px solid #dddddd; height: 65px; float: left; width: 80%"
						placeholder="Enter ..." id="message"></textarea>

					<button type="button" id="sendBtn"
						style="float: right; width: 18%; height: 65px; text-align: center; background-color: #ffd400; border-radius: 5px; border: 0; outline: 0;">
						<img alt=""
							src="${pageContext.request.contextPath}/images/paper-plane-solid.svg"
							style="width: 85%;">
					</button>
				</div>
			</div>
		</div>

		<input type="text" id="nickname" value="${name}" style="display: none">
		<input type="button" id="enterBtn" value="입장" style="display: none">
		<input type="button" id="exitBtn" value="나가기" style="display: none">

		<script type="text/javascript">
					connect();
			
					$(document).on("scrollstart",function(){
				      });
					function connect() {
						/* sock = new SockJS('/contextPath/chat'); */
						sock = new SockJS("http://211.63.89.82:8080/project3/chat");
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
				                                   "<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#fef01b; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>${msli.message_content.trim()}</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >${msli.message_sendTime}</span></div></div><div class='col-2' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid'  src='${pageContext.request.contextPath}/uploadFile/${msli.message_profileImg}' style = 'width:50px; height:50px; border-radius:100%;'><div style='font-size:9px; clear:both;'>${name}</div></div></div>")
				            }else{ 
				            $("#chatMessageArea")
				                  .append(
				                        "<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='${pageContext.request.contextPath}/uploadFile/${msli.message_profileImg}' style = 'width:50px; height:50px; border-radius:100%;'><div style='font-size:9px; clear:both;'>${msli.message_sender}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ffffff; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>${msli.message_content.trim()}</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >${msli.message_sendTime}</span></div></div></div>"       
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
			                           + t + "</span></div></div><div class='col-2' style = 'float:right; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid'  src='${pageContext.request.contextPath}/uploadFile/"+msg.message_profileImg+"' style = 'width:50px; height:50px; border-radius:100%;'><div style='font-size:9px; clear:both;'>${name}</div></div></div>")
			            }else{
			            $("#chatMessageArea")
			                  .append(
			                        "<div class='col-12 row' style = 'height : auto; margin-top : 5px; margin-bottom : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='${pageContext.request.contextPath}/uploadFile/"+msg.message_profileImg+"' style = 'width:50px; height:50px; border-radius:100%;'><div style='font-size:9px; clear:both;'>"+msg.message_sender+"</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ffffff; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"
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
	</div>

	</div>




	<script>
	
	<c:if test="${name!=null}">
	<c:if test="${check!=0 }">
	function insertbook(bookid,roomnum ){
		
		$.ajax({
			  url:"${pageContext.request.contextPath}/room/insertbook"
		  , async : false
		  , type : "GET"
		  , data : { class_id : roomnum, book_id : bookid, name : '${name}'}
		  , success: function (result) {
				if(result=="ok"){
					alert("신청 완료");
					location.reload();
				}else{
					alert("신청 마감");
				}
			  }
		  });
		
		
	} 
	
	function deletebook(bookid,roomnum ){
		
		$.ajax({
			  url:"${pageContext.request.contextPath}/room/deletebook"
		  , async : false
		  , type : "GET"
		  , data : { class_id : roomnum, book_id : bookid, name : '${name}'}
		  , success: function (result) {
				if(result=="ok"){
					alert("취소 완료");
					location.reload();
				}
			  }
		  });
		
		
	}
	</c:if>
	</c:if>
	
		
		
	function submitCheck(num, check) {
		
	  var ck;
	
	  if(check==0){
	  $.ajax({
		  url:"${pageContext.request.contextPath}/room/checkmem"
	  , async : false
	  , type : "GET"
	  , data : { num : num}
		 
	  , success: function (result) {
		  alert(result+"결과값이 뭐죠 ?");
			if(result=="max") {
				   alert("회원이 가득 찼습니다. 모임장에게 문의하세요");
				   ck = false;
			   return false;

			 }else{
					ck = true;
			  return true;

			}
		  }
	  });
	  
	  return ck;
	  }else{
	  return true;
	  }
	}
	
		function check() {
			alert("가입이 완료되었습니다.");
		}
		
		var ch = <c:out value="${boardCheck}"/>; /* pageNum */
		var chch = <c:out value="${chch}"/>; /* 고정값 0 */
		
  		$(window).load(function() {
	         if(ch == chch) {
	            openCity(event, 'info');
	         } else if(ch != chch) {
	            openCity(event, 'board');
	         }
	      });
	
		function openCity(evt, cityName) {
			  var i, x, tablinks;
			  x = document.getElementsByClassName("city");
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablink");
			  for (i = 0; i < x.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" w3-border-gray", "");
			  }
			  document.getElementById(cityName).style.display = "block";
			  evt.currentTarget.className += " w3-border-gray";
			  var chatAreaHeight = $("#chatArea").height();
			  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			  	$("#chatArea").scrollTop(maxScroll);
		}
		
		
		function like_func(articlenum) {
			console.log(articlenum);
			var frm_read = $('#frm_read');
			var email = $('#email', frm_read).val();
			$.ajax({
				url: "${pageContext.request.contextPath}/room/roomcontent/like"
				, type: "GET"
				, cache: false
				, dataType: "json"
				, data: {
					articlenum: articlenum
				}, // RoomController로 보내준다
				success: function (data) { // RoomController로부터 데이터를 받는다 
					var msg = '';
					var like_img = '';
					msg += data.msg;
					alert(msg);
					console.log("data.likeCheck:::" + data.likeCheck);
					if (data.likeCheck == 0) { //좋아요 누른지 여부가 0 == 좋아요 누르지 않았다.
						like_img = '<%=request.getContextPath()%>/images/dislike.png';
					}
					else { //좋아요 눌렀으면 like.png이미지
						like_img = '<%=request.getContextPath()%>/images/like.png';
					}
					console.log("like_img::" + like_img);
					$('#' + articlenum + 'like_img').attr('src', like_img);
					/* $('#'+articlenum+'like_img', frm_read).attr('src', like_img); */
					$('#' + articlenum + 'likeCnt').html(data.likeCnt);
					$('#likeCheck').html(data.likeCheck);
				}
				, error: function (request, status, error) {
					alert("에러 !! code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		}
		
		
		
function articleClick(check) {
			
			if(check == 0){	//미가입 회원
				alert("모임가입을 해주세요.");
			}
			if(check != 0){ //가입 회원

				openCity(event, 'board')
			} 
		}
		function photoClick(check) {
			
			if(check == 0){	//미가입 회원
				alert("모임가입을 해주세요.");
			}
			if(check != 0){ //가입 회원

				openCity(event, 'photo');
			} 
		}
		function chatClick(check) {
			
			if(check == 0){	//미가입 회원
				alert("모임가입을 해주세요.");
			}
			if(check != 0){ //가입 회원
				openCity(event, 'chat');
			} 
		}
	</script>
</body>
</html>