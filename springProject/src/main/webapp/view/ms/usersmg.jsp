<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bar {
	border: hidden;
}

.red {
	background: red;
}

.center {
	text-align: center;
	width: 80%;
	margin: auto;
}

.center.tc {
	display: inline-block;
}

table.type02 {
	border-collapse: separate;
	text-align: center;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 20px 10px;
}

table.type02 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
}

table.type02 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
<script type="text/javascript">
function fn_replyDelete(memno){
    if (!confirm("삭제하시겠습니까?")) {
        return;
    }
    $.ajax({
    	aync : false,
        url: "http://localhost:8080/SpringProject33/memberDeleteAjax",
        type: 'POST',
        data: {memno : memno},
        success: function(result){
            if (result=="OK") {
//	                $("#replyItem"+reno).remove();
                alert("삭제되었습니다.");
                location.reload();
            } else{
                alert("댓글이 있어서 삭제할 수 있습니다.");
            }
        }
    });
}

</script>
</head>
<body>

	<div id="alluser" class="manage" style="display: none">
		<table class="type02" style="border-collapse: collapse;">
			<tr>
				<th><input type="checkbox" id="sportAll"></th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>휴대폰</th>
				<th>생일</th>
				<th>이메일</th>
				<th>가입일</th>

				<th>관리</th>
			</tr>
			<c:forEach var="member" items="${member }">
				<tr>
					<td><input type="checkbox" name="member"
						value="${member.memid }"></td>
					<td>${member.memid}</td>
					<c:if test="${member.memid ==4  }">
						<td style="color: red;">${member.name }</td>
					</c:if>
					<c:if test="${member.memid !=4  }">
						<td>${member.name }</td>
					</c:if>
					<td>${member.email }</td>
					<td>${member.phone }</td>
					<td>${member.birthday }</td>
					<td>${member.email }</td>
					<td>${member.address }</td>
					<td><button onclick="fn_replyDelete(${member.memid })">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>