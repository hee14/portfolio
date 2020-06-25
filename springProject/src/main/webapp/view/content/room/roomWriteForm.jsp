<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/roomWriteForm.css">

<script language="javascript">
function goPopup(){
	var pop = window.open("<%= request.getContextPath() %>/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.roomform.userAddr.value = roadFullAddr;		
}
</script>
<script>


		var like_sub = new Array();
		var likesub = document.getElementById("like_sub");
		
		<c:forEach var='li' items='${li }' varStatus='index'>
		like_sub[${index.index}] = new Array(<c:if test="${index.index==0}">"<c:out value='소분류'/>"</c:if><c:forEach var='lli' items='${lli }'><c:if test="${lli.interNum==index.index}">"<c:out value='${lli.intersubName}'/>",</c:if></c:forEach>);
		</c:forEach>
 		
		
		function list(e) {
			var sel=document.roomform.like_subck
				   
		   /* 옵션메뉴삭제 */
		       for (i=sel.length-1; i>=0; i--){
		         sel.options[i] = null
		         }
		       /* 옵션박스추가 */
		       for (i=0; i < like_sub[e].length;i++){     
		           sel.options[i] = new Option(like_sub[e][i], i+1);
		         }      
		       

	}
	
	function likesu(asd) {
		var likesub = document.getElementById("like_sub");
		likesub.value = asd.value;
		alert(asd.value);
		alert(likesub.value+"likesub vlaue")
	}
</script>
</head>
<body>

	<form action="roomWritePro" method="post" enctype="multipart/form-data" name="roomform">
		<input type="hidden" name="host" value="${member.name }"> <input
			type="hidden" name="email" value="${member.email}"> <input
			type="hidden" name="num" value="${rm.num}"> <input
			type="hidden" name="like_sub" id="like_sub" value="1">
		<table class="table4_9">
			<tr>
				<td><select name="like_ca" onchange=list(this.selectedIndex)
					style="size: 5; font-size: 1rem">
						<option>카테고리</option>
						<c:forEach var="li" items="${li }" varStatus="index">
							<option value="${index.index+1}" id="">${li.interestName }</option>
						</c:forEach>

				</select> <select id="small" name="like_subck" onchange=likesu(this)
					style="size: 5; font-size: 1rem">
						<option>소분류</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="file" name="uploadfile"></td>
			</tr>
			<tr>
				<td><input type="text" name="meet_title"
					placeholder="모임 이름을 작성해주세요"></td>

			</tr>

			<tr>
				<td><textarea rows="3" cols="30" name="content"
						placeholder="어떤 모임인지 설명해주세요"></textarea></td>
			</tr>

			<tr>
				<td>정원 <input class="underline" type="number" name="membercnt"
					max="100" min="2" value="2">
				</td>
			</tr>

			<tr>
				<td>위치
					<button type="button" id = "findAddr" class="btn btn-warning" onclick="goPopup()">주소검색</button>
					<!-- <input type="text" name="location" style="float: right;"> -->
					<input type="text" id="userAddr" name="location" placeholder="주소를 검색하세요." class="form-control" readonly="true"/>
				</td>
			</tr>


			<tr>
				<td colspan=3 align="center" style="border: 0; text-align: center;" ><input
					type="submit" value="모임등록" style="color: white" class="myButton">
					<input type="reset" value="다시작성" style="color: white"
					class="myButton"> <input type="button" value="목록보기 " style="color: white"
					onclick="javascript:window.location='<%=request.getContextPath()%>/content/main'" class="myButton">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>