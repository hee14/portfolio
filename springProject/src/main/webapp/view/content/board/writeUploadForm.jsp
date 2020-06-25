<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<html>
<head>
<title>게시판 글쓰기</title>

<style>
	table {
	  border-collapse: collapse;
	  /* width: 90%; */
	}
	
	th, td {
	  padding: 8px;
	  border-bottom: 1px solid #ddd;
	}
	
	tr:hover {background-color:#f5f5f5;}
</style>

</head>

<body>

	<div class="w3-container">
	
		<br><br>
		<p align="center"><b>글쓰기</b></p>

		<form method="post" name="writeform" action="${pageContext.request.contextPath}/board/write" >
	
			<input type="hidden"  name="articlenum" value="${article.articlenum }">
			<input type="hidden"  name="num" value="${article.num }">
			<input type="hidden"  name="ref" value="${article.ref }">
			<input type="hidden"  name="re_step" value="${article.re_step }">
			<input type="hidden"  name="re_level" value="${article.re_level }">
			<input type="hidden"  name="name" value="${name}"> <!-- name이랑 email도 hidden으로 넘기기 -->
			<input type="hidden"  name="email" value="${article.email }">
	
			<table align="center">
 
  				<tr>    
  					<td align="center">제 목</td>
  					<td align="left">
       					<c:if test="${article.articlenum==0}"> <!-- articlenum이 0이면 새글 -->
        					<input type="text" size="40" maxlength="50" name="subject">
        				</c:if>
       					<c:if test="${article.articlenum!=0}"> <!-- articlenum이 0이 아니면 답글 -->
        					<input type="text" size="40" maxlength="50" name="subject"  value="답글> ">
        				</c:if>
        			</td>  
    			</tr>
  
  				<tr>   
  					<td align="center">내 용</td>
    				<td align="left">
    					<textarea name="content" rows="13" cols="40"></textarea> 
    				</td>
   				</tr>
 
<!--   				<tr>     -->
<!--   					<td align="center">file</td> -->
<!--     				<td align="left"> -->
<!--     					<input type="file" size="40" maxlength="30" name="uploadfile" > -->
<!--     				</td> -->
<!-- 				</tr> -->

				<tr>    
					<td align="center">비밀번호</td>
					<td align="left">
						<input type="password" size="8" maxlength="12" name="passwd"> 
	 				</td>  
				</tr>
	
				<tr>      
 					<td colspan=2 align="center">   
 						<input type="submit" value="완료"> <input type="reset" value="다시 작성"> 
			<%-- <input type="button" value="목록보기" OnClick="window.location='${pageContext.request.contextPath}/board/list'"> --%>
					</td>
				</tr>

			</table> 

		</form>  

	</div> 
	<br/><br/>
</body>
</html> 
     
