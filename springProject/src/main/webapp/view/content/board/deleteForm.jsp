<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<html>
<head>
<title>글 삭제</title>

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
		<p align="center"><b>글 삭제</b></p>

		<form method="POST" name="delForm" action="<%=request.getContextPath() %>/board/deletePro">
			
			<input type="hidden" name="articlenum"  value="${articlenum}">
			<input type="hidden" name="num"  value="<%=request.getParameter("num")%>">
			
			<table align="center">
			
				<tr>
					<td align="center"><b>비밀번호를 입력해 주세요.</b></td>
				</tr>
			
				<tr>
					<td align="center">비밀번호 : <input type="password" name="passwd" size="8" maxlength="12"></td>
				</tr>
				
				<tr>
					<td align="center">
						<input type="submit" value="글 삭제하기"> 
						<!-- <input type="button" value="글 목록" onclick="document.location.href='list'"> -->
					</td>
				</tr>
				
			</table>		
			
		</form>	
	</div>

<br/><br/>
	
</body>
</html>
				
				