<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 업로드</title>

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
		<p align="center"><b>사진 업로드</b></p>
		
		<form method="post" name="photoUploadForm" action="${pageContext.request.contextPath}/photo/photoUpload" enctype="multipart/form-data">
	
			<input type="hidden" name="photonum" value="${photo.photonum }">
			<input type="hidden" name="num" value="${photo.num }">
			<input type="hidden" name="ref" value="${photo.ref }">
			<input type="hidden" name="re_step" value="${photo.re_step }">
			<input type="hidden" name="re_level" value="${photo.re_level }">
			<input type="hidden" name="name" value="${name}">
			<input type="hidden" name="email" value="${photo.email }">
			
			<table align="center">
  
  				<tr>   
  					<td align="center">내용</td>
    				<td align="left">
    					<textarea name="content" rows="13" cols="40"></textarea> 
    				</td>
   				</tr>
 
   				<tr>     
   					<td align="center">사진</td> 
     				<td align="left"> 
     					<input type="file" multiple="multiple" size="40" maxlength="30" name="uploadfile" > 
     				</td> 
				</tr> 

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
</body>
</html>