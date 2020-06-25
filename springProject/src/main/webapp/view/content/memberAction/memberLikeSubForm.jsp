<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel = "stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<title>속닥속닥 :: 오프라인 모임 플랫폼</title>
</head>
<script type="text/javascript">
function check(){
	
	  var chk_obj = document.getElementsByName("likes");
	    var chk_leng = chk_obj.length;
	    var checked = 0;
	    for (i=0; i < chk_leng; i++) {
	        if (chk_obj[i].checked == true) {
	            checked += 1;
	        }
	    }
	    if (checked < 1 ) {
	        alert("항목을  선택해주세요");
	        return false;
	    }

}
</script>
<body>

         <div class = "likeWrap">
            <form name = "like" id = "like" method = "post" action = "memberLikeSubPro" onsubmit="return check()">
               <h2 class = "like_tit">관심사</h2>
<!--                <p class ="memo">최대 <script>document.write(maxChecked);</script> 까지만 선택할 수 있습니다.</p> -->
               <div class = "likelike">
                  <c:forEach var = "checktit" items = "${checkList }" varStatus="status">
                  <div><h3>${checktit}</h3></div>
                  <c:forEach var = "list" items = "${li }">
                  <c:forEach var = "interestList" items="${list }" varStatus="index">
                  <%-- <c:out value="${checktit}" /> --%>
                  <c:if test = "${checktit  == interestList.interestName}">
                     <div class = "likelist">
                        <div class = "interestList">
                           <input type="checkbox" id="likes${status.count}" name = "likes"  value = "${interestList.intersubName}" onclick=check${status.count}(this) >
                           <label for="like">${interestList.intersubName}</label>
                        </div>
                     </div>
                  </c:if>
                  </c:forEach>
                  </c:forEach>
                  <script>
                     var maxChecked${status.count} = 3;   //선택가능 갯수
                     var totalChecked${status.count} = 0; // 설정 끝
                  
                     function check${status.count}(e){
                     var as = document.getElementById("likes"+${status.count});
                        if (e.checked)
                             totalChecked${status.count} += 1;
                         else
                             totalChecked${status.count} -= 1;
                     
                         if (totalChecked${status.count} > maxChecked${status.count}) {
                             alert("최대 3개 까지만 가능합니다.");
                             e.checked = false;
                            totalChecked${status.count} -= 1;
                         }
                     }
                  </script>
                  </c:forEach>
               </div>
            
               <div class = "likeCon">
               <input type="submit" value="선택완료" class="btn">
               </div>
      </form>
   </div>
</body> 
</html>