<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/roombook.css">
</head>
<body>
<script language="javascript">
function goPopup(){
	var pop = window.open("<%= request.getContextPath() %>/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.roombook.userAddr.value = roadFullAddr;		
}

function check() {
	var stdate = document.getElementById("meet_date_start");
	var enddate = document.getElementById("meet_date_end");
	if(stdate.value>enddate.value){
		alert("약속 일정이 잘못 되었습니다.")
		return false; 
	}
	

	
}
</script>
<form name = "roombook" action="roombookPro" method="post" enctype="multipart/form-data" onsubmit="return check();"
		>
		<input type="hidden" name="host" value="${member.name }"> <input
			type="hidden" name="num" value="${num}"> <input
			type="hidden" name="like_sub" id="like_sub">
		<table class="table4_9">
		<tr>
		<td>
		<select style="size: 10; font-size:1rem">
			<option>관리하는 모임 없음</option>
			<c:forEach var="mynum" items="${mynum }">
				<c:if test="${mynum.status==1 ||mynum.status==2  }">
						<option>${mynum.meet_title }</option>					
				</c:if>
			</c:forEach>
		</select>
		</td>
		</tr>
			<tr>
				<td><input type="text" name="meet_subtitle"
				placeholder="일정 제목을 입력해주세요" >
				</td>
			</tr>
			<tr>
				<td>멤버 수  <input class="underline" type="number" name="membercnt" max="100"
					min="2" placeholder="2">
				</td>
			</tr>

			<tr>
				<td>시작 날짜 <input type="date" name="meet_date_start" id="meet_date_start"> ~ 마감 날짜 : <input type="date" name="meet_date_end" id="meet_date_end">
				</td>
			</tr>
			<tr>
				<td>시작 시간 <input type="time" name="meet_time_start" > ~ 종료 시간 : <input type="time" name="meet_time_end" >
				</td>
			</tr>
			<tr>
				<td>
				<button type="button" id = "findAddr" class="btn btn-warning" onclick="goPopup()">주소검색</button>
				<!-- <input type="text" name="meet_location" placeholder="모임 위치를 입력해주세요" > -->
				<input type="text" id="userAddr" name="meet_location" placeholder="모임 위치를 검색해주세요." class="form-control" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td>정모 비용  <input class="underline" type="text" name="fee" size="5" >
				</td>
			</tr>

			<tr>
				<td colspan=3 align="center" style="border: 0;"><input
					type="submit" value="일정 등록" style="color: white" class="myButton"> <input
					type="reset" value="다시작성" style="color: white" class="myButton"> <input
					type="button" value="목록보기 " style="color: white"
					onclick="javascript:window.location='<%=request.getContextPath()%>/content/main'"
					class="myButton"></td>
			</tr>
		</table>




	</form>
</body>
</html>