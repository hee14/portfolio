<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content = "ie-edge">
<meta name = "format-detection" content = "telephone-no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/memberInfoForm.css">
<title>속닥속닥 :: 회원정보</title>
</head>
<body>
<script>
        function popup(memid){
        	if('${name}'=='${memberInfo.name}'){
        		alert("혼자속삭이지마세요");
        		return
        	}
            var url = "${pageContext.request.contextPath}/mypage/popupnoteWrite?memid="+memid;
            var name = "popup notewrite";
            var option = "width = 460, height = 535, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function nopopup() {
        	alert("로그인을 해주세요.");
        }
</script>
 
<div class = "signup_wrap">
      <h2>회원정보</h2>
      
      <div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
         <span class = "info-group" style = "float:left;">
            <span><img src = "${pageContext.request.contextPath}/uploadFile/${memberInfo.profileImg}"></span>
         </span>
         <span class = "row" style = "margin-bottom: 6px;">
            <span class = "info-group cols">  
               <span class = "myname">${memberInfo.name}</span>
               <span class = "mybir">${memberInfo.birthday }</span>
            </span>
            
            <span class= "letgo" style = "float:right; padding: 0px 0px 0px 86px;"><i class = "xi-maker"></i>${memberAddress}</span>
         </span>
         <span class = "info-group">
               <span class = "myintro" style="border-top: 2px solid #d2d2d2;padding: 0px 47px 0px 71px;">
                  <span style = "margin-top:12px;">
                  
<!--                   모임초대 -->
<%--                   <c:if test = "${sessionCheck == 0 }"> --%>
<!--                   <span style = "padding:7px; border: 1px solid #d2d2d2; border-radius:7px; margin:0px 40px 0px 35px;"><a href = "javascript:nopopup()" style = "display:block;"><i class  ="xi-mail-o" style = "font-size:23px; vertical-align: bottom"></i>모임초대</a></span> -->
<%--                   </c:if> --%>
<%--                   <c:if test = "${sessionCheck == 1 }"> --%>
<!--                   <span style = "padding:7px; border: 1px solid #d2d2d2; border-radius:7px; margin:0px 40px 0px 35px;"><a href = "#" style = "display:block;"><i class  ="xi-mail-o" style = "font-size:23px; vertical-align: bottom"></i>모임초대</a></span> -->
<%--                   </c:if> --%>
                  
                  <!-- 1:1 쪽지 -->
                  <c:if test = "${sessionCheck == 0 }">
                  <span style = "padding:7px; border: 1px solid #d2d2d2; border-radius:7px; margin:0px 56px 0px 0px;"><a href = "javascript:nopopup()" style = "display:block;"><i class  ="xi-message-o" style = "font-size:23px; vertical-align: bottom"></i>1:1 메시지</a></span>
                  </c:if>
                  <c:if test = "${sessionCheck == 1 }">
                  <span style = "padding:7px; border: 1px solid #d2d2d2; border-radius:7px; margin:0px 56px 0px 0px;"><a href = "javascript:popup(${memid})" style = "display:block;"><i class  ="xi-message-o" style = "font-size:23px; vertical-align: bottom"></i>1:1 메시지</a></span>
                  </c:if>
                  </span>
               </span>
         </span>
      </div>
      
      <div class="w3-container" style="padding:0px!important; font-size:15px; z-index: 99999">
         <div class="w3-row">
            <a href="javascript:void(0)" onclick="openCity(event, 'joinClass');" class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding" id = "some" style="text-align: center; width:33.3%;">
               가입한 모임
            </a> 
            <a href="javascript:void(0)" onclick="openCity(event, 'board');" class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding" style="text-align: center; width:33.3%;">
               작성한 글
            </a>
            <a href="javascript:void(0)" onclick="openCity(event, 'comment');" class="w3-quarter tablink w3-bottombar w3-hover-light-grey w3-padding" style="text-align: center; width:33.3%;">
               작성한 댓글
            </a>
         </div>
      </div>
      
      <div id=joinClass class="w3-container city" style="display: none; padding:0px;">
         <c:if test ="${memberJoinClassCnt > 0}">
             <c:forEach var = "memberJoinClass" items = "${memberJoinClass}">
                  <div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
                     <a href = "${pageContext.request.contextPath}/room/roomcontent?num=${memberJoinClass.classnum}" style = "display:block;">
                        <span class = "info-group">
                           <span class="memberLike"><img src = "${pageContext.request.contextPath}/images/${memberJoinClass.interestPng}" style = "width:35px; height:35px;"></span>
                        </span>
                        <span class = "info-group">
                           <span class="memberLike" style = "font-size:17px; margin-left: 7px;">${memberJoinClass.meet_title}</span>
                        </span>
                     </a>
                  </div>
            </c:forEach>
         </c:if>
         <c:if test ="${memberJoinClassCnt < 1}">
                  <div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
                     <a href = "#">
                        <span class = "info-group">
                           <span class="memberLike">가입한 모임이 없습니다.</span>
                        </span>
                     </a>
                  </div>
         </c:if>
      </div>
      
      <div id=board class="w3-container city" style="display: none; padding:0px;">
      <c:if test ="${memberBoardCnt > 0}">
         <c:forEach var = "memberBoardList" items = "${memberBoard}">
               <div class = "infoone" style = "border-bottom:1px solid #d2d2d2; font-size:17px;">
                  <a href = "${pageContext.request.contextPath}/board/content?articlenum=${memberBoardList.articlenum}" style = "display:block;">
                     <span class = "info-group">
                        <span class="memberLike" style="font-size: 16px;">${memberBoardList.subject }</span><br/>
                        <span class="memberLike" style="font-size: 16px; margin-top: 0px;"><fmt:formatDate value="${memberBoardList.reg_date}" pattern="yyyy-MM-dd HH:mm" /></span>
                     </span>
                  </a>
               </div>
         </c:forEach>
      </c:if>
      <c:if test ="${memberBoardCnt == 0}">
               <div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
                     <span class = "info-group">
                        <span class="memberLike">작성한 글이 없습니다.</span>
                     </span>
               </div>
      </c:if>   
      </div>
      
      <div id=comment class="w3-container city" style="display: none; padding:0px;">
         <c:if test ="${memberCommentCnt > 0}">
            <c:forEach var = "memberComment" items = "${memberComment}">
                  <div class = "infoone" style = "border-bottom:1px solid #d2d2d2; font-size:17px;">
                     <a href = "${pageContext.request.contextPath}/board/content?articlenum=${memberComment.articlenum}" style = "display:block;">
                        <span class = "info-group">
                           <span class="memberLike" style="font-size: 16px;">${memberComment.subject }</span><br/>
                           <span class="memberLike" style="font-size: 16px; margin-top: 0px;"><fmt:formatDate value="${memberComment.reg_date}" pattern="yyyy-MM-dd HH:mm" /></span>
                        </span>
                     </a>
                  </div>
            </c:forEach>
         </c:if>
         <c:if test ="${memberCommentCnt == 0}">
                  <div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
                        <span class = "info-group">
                           <span class="memberLike">작성한 댓글이 없습니다.</span>
                        </span>
                  </div>
         </c:if>
         
      </div>
</div>


<script>

   $(document).ready(function() {
      $('#some').trigger('click');
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
   }
</script>


</body>
</html>