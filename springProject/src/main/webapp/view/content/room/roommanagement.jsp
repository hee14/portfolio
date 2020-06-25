<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div style="display: inline;">
			<form action="getout">
				<table style="margin: auto;">
					<c:forEach var="li" items="${memberList }">
						<tr>
							<td><input type="hidden" name="email" value="${li.email }">
							<input type="checkbox" name="num" value="${li.classnum}">${li.name}
							</td>
							<td>${li.gender }</td>
							<td>${li.birthday }</td>
							<td><c:if test="${li.status==1 }">모임장</c:if> 
							<c:if test="${li.status==2 }">운영진</c:if> 
							<c:if test="${li.status==3 }">회원</c:if></td>
						</tr>
					</c:forEach>
					<tr>
						<td><input type="submit" value="강퇴"></td>
						<td><input type="submit" value="진급"></td>
						<td><input type="submit" value="강등"></td>
					</tr>
				</table>

			</form>
		</div>
	</div>
</body>
</html>