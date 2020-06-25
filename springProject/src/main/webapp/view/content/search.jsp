<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie-edge">
<meta name="format-detection" content="telephone-no">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
<%-- <link rel= "stylesheet" href="${pageContext.request.contextPath}/css/search_tablet.css" media="all and (max-width:1420px)"> --%>
<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/search_mobile.css" media="all and (max-width:760px)">

<title>속닥속닥 :: 모임검색</title>
</head>
<body>

<div class="search_wrap">
 <!-- 모바일용 리스트 -->
 	
	
	<!-- 추천 -->
	<div class = "infoone" style = "border-bottom:1px solid #d2d2d2;">
	
			<c:if test = "${memberLikecheck < 0}">
			<div class="ghli">
			맞춤추천
			</div>
			<a href = "${pageContext.request.contextPath}/memberAction/memberLikeForm">
				<span >관심사를 설정해주세요</span>
				<span style = "float:right; padding: 5px 10px 5px 0px;"><i class="xi-angle-right-min" style = "font-size:1rem;"></i></span>
			</a>
			
			</c:if>
			
			<c:if test = "${memberLikecheck > 0}">
			
			  <c:forEach var="cateli" items="${cateli}" >
				<c:forEach var = "inter" items = "${setMemInter }">
				<c:if test = "${inter.interestName == cateli.interestName}">
				<td>
				<div class="ghli">
 				 ${cateli.interestName} 맞춤추천
 				<a class="plus" href="<%=request.getContextPath()%>/content/main?pageNum=1&categorie=${cateli.interestNum}">더보기  </a>
 				</div>
 				</td> 
			 	<c:forEach var="articleli" items="${articleli}" >
			 	
			 	<c:if test = "${cateli.interestNum == articleli.like_ca}" >
			 	
					<div class="sli">
					 <a style="text-decoration: none;" href="<%=request.getContextPath()%>/room/roomcontent?num=${articleli.num}">
					  <div class="w3-cell" ">
					    <img src="<%= request.getContextPath()%>/uploadFile/${articleli.photo}" style="width:70px; height:70px;">
					  </div>
					  <div class="w3-cell w3-container" style="padding: 0px 10px 0px 10px!important;">
					  <i class="material-icons" style="font-size:12px">location_on</i>
					   <script>
					    var Sample = "${articleli.location }"
					    var result = Sample.split(" ");
					    '<p>'+document.write(result[1]);+'</p>'
						</script>
						<br>
						<h6> ${articleli.meet_title }</h6>
					  </div>
					  </a>
					</div>
					
					
			    </c:if>
			    
			   </c:forEach>	
			   </c:if>
			   </c:forEach>
			   </c:forEach>
 			</c:if>
 				
 				
 				
 </div>
 
 
 
 
 <div class="sliList">
 		<%-- <c:set var = "searchListCheck" value = "${searchListCheck }"/>
 		<c:out value="${searchListCheck }" /> --%>
 		<div class="ghli">검색결과</div>
 		<c:if test="${searchListCheck == 0}">
		   	검색한 모임이 존재하지 않습니다.
		</c:if>
		   
		 <c:if test="${searchListCheck > 0}">
		 
			<c:forEach var="searchList" items="${searchList}">
			
			 <div class="sli">
			 <a style="text-decoration: none;" href="<%=request.getContextPath()%>/room/roomcontent?num=${searchList.num}">
			  <div class="w3-cell">
			    <img src="<%= request.getContextPath()%>/uploadFile/${searchList.photo}" style="width:70px; height:70px;">
			  </div>
			  <div class="w3-cell w3-container" style="padding: 0px 10px 0px 10px!important;">
			  <i class="material-icons" style="font-size:12px">location_on</i>
			   <script>
			    var Sample = "${searchList.location }"
			    var result = Sample.split(" ");
			    '<p>'+document.write(result[1]);+'</p>'
				</script>
				<br>
				<h6> ${searchList.meet_title }</h6>
			  </div>
			  </a>
			  </div>
			</c:forEach>
		 </c:if>
	</div>
	<!-- /.row --> 
  <!-- Pagination -->
  <c:if test="${searchListCheck != 0}">
 <ul style="text-align: center;">
  
 <c:if test="${startPage > bottomLine}">
    <li class="page-item" style="display: inline-block;">
      <a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/content/search?keyword=${keyword}&pageNum=${startPage - bottomLine}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
      </a>
    </li>
   </c:if> 

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
	<li class="page-item" style="display: inline-block; text-align: center;"><a style="text-decoration: none; " class="page-link" href="${pageContext.request.contextPath}/content/search?keyword=${keyword}&pageNum=${i}" style="color: grey">${i}</a></li>
   </c:forEach>
	
 
	
  <c:if test="${endPage < pageCount}">
    <li class="page-item" style="display: inline-block;">
      <a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/content/search?keyword=${keyword}&pageNum=${startPage + bottomLine}" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
      </a>
    </li> 
   </c:if>
    
 </ul>
 </c:if>
	</div>		 
	
</body>
</html>