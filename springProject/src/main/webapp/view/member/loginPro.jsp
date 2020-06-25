<%@page import="model.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.LogonDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>

	<c:if test="${check==1}">
	<meta http-equiv = "Refresh" content = "0;url=<%=request.getContextPath() %>/content/main">
	</c:if>

	<c:if test="${check==0}">
		<script>
			alert("비밀번호가 맞지않습니다.");
			history.go(-1);
		</script>
	</c:if>

	<c:if test="${check == -1}">
		<script>
			alert("이메일이 존재하지 않습니다.");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>