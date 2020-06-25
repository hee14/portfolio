<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 보기</title>
<style>
	table {
	  border-collapse: collapse;
	  width: 400px;
	}
	
	th, td {
	  padding: 8px;
	  border-bottom: 1px solid #ddd;
	}
	
	
</style>

</head>
<body>

<div class="w3-container">
		<br><br>
	
		<table align="center">
		
      		<%-- <tr>
      			<td align="center">조회수</td><td align="left">${article.readcount}</td>  
      		</tr> --%>
      		
      		<tr>
	      		<td align="left">
	      			<!-- 프로필사진 -->
	      			<span style = "float:left; width:70px;">
	      				<img src = "${pageContext.request.contextPath}/uploadFile/${setmember.profileImg}" style="width:50px; height:50px; border-radius: 100%;">
	      			</span>
	      			<span style = "float:left;">
	      				<!-- 이름 -->
	      				<span>
      						<b>${setmember.name}</b><br/>
      					</span>
      					<!-- 게시날짜 -->
      					<span>
      						<div style="color:grey; font-size: 0.7rem">${photo.reg_date}</div>
      					</span>
      				</span>
      			</td>
      		</tr>
      		   
      		<tr>
	     			<td align="center">
	     				<br/>
	     				<c:forEach var="photos" items="${photos}" varStatus="status">
	      					<img src="<%=request.getContextPath()%>/uploadFile/${photos.filename}" style="width:300px"> <br/><br/>
	      				</c:forEach>
	      			</td>
			</tr>  
			
			<tr>
      			<td align="left"><pre>${photo.content}</pre>
      			
      			<br/><br/>
      			
      			<span style="color:grey; font-size: 0.7rem;">
	      			<div style = "float:left;">♥ 좋아요&nbsp</div> <div id='${photo.photonum}likeCnt' style = "float:left;">${photo.like1}</div> 
	      			<div style = "float:left;">&nbsp &nbsp<img src="<%=request.getContextPath()%>/images/readcount.png" style="width:20px;"/> 조회수&nbsp</div> <div style = "float:left;">${photo.readcount}</div> <br/>
      			</span>
      			</td>
			</tr>  
			
			<tr>
			
				<td align="center">
					<span>
					
						<div>
							<a href='javascript: like_func(${photo.photonum});'> 
								<c:if test="${checknum==0 }">
									<img src='<%=request.getContextPath()%>/images/dislike.png' id='${photo.photonum}like_img' style="width: 20px; height: 20px; float:left;">
								</c:if>
								<c:if test="${checknum==1 }">
									<img src='<%=request.getContextPath()%>/images/like.png' id='${photo.photonum}like_img' style="width: 20px; height: 20px; float:left;">
								</c:if>
							</a> 
						</div>
						
						<div style = "float:left;"> &nbsp좋아요&nbsp</div>
					</span>
				</td>
				
			</tr>
			
			<tr>
				<td>
				
					<br/>
					
					<span style = "float:left; width:70px;">
	      				<img src = "${pageContext.request.contextPath}/uploadFile/${setmember1.profileImg}" style="width:50px; height:50px; border-radius: 100%;">
	      			</span>
	      			
					<form action="<%= request.getContextPath()%>/photo/photoContent/write">
						<input type="hidden" name="photonum" value="${photo.photonum }">
						<input type="hidden" name="num" value="${photo.num }">
						<input type="hidden" name="ref" value="${photo.ref }">
						<input type="hidden" name="re_step" value="${photo.re_step }">
						<input type="hidden" name="re_level" value="${photo.re_level }">
						<input type="hidden" name="name" value="${name}">
						<input type="hidden" name="email" value="${setmember1.email}">
									
						<textarea name="content" rows="6.5" cols="30"  onblur="checkField(this)" onfocus="clearField(this)">댓글 달기...	</textarea>
						&nbsp &nbsp<input type="submit" value="확인"/>
					</form>
					
					<br/>
					
					<c:forEach var="commentList" items="${commentList}" varStatus="status">
	      			
		      			<!-- 프로필사진 -->
		      			<span style = "float:left; width:70px;">
		      				<img src = "${pageContext.request.contextPath}/uploadFile/${commentMember.get(status.index).profileImg}" style="width:50px; height:50px; border-radius: 100%;">
		      			</span>
		      			
		      			<span style = "float:left;">
		      				<!-- 이름 -->
		      				<span>
	      						<b>${commentMember.get(status.index).name}</b><br/>
	      					</span>
	      					<!-- 게시날짜 -->
	      					<span>
	      						<div style="color:grey; font-size: 0.7rem">${commentList.reg_date }</div>
	      					</span>
	      				</span>
	      				
	      				<br/>
	      				
	      				<!-- 댓글 내용 -->
	      				<span>
	      					<br/>
	      					&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp ${commentList.content }
	      					<br/>
	      				</span>
	      				
	      				<br/>
	      				
      				</c:forEach>
					
				</td>
			</tr>
			
			
   <%-- 
			<tr>      
				<td colspan="2" class="w3-center">
					<input type="button" value="글수정" onclick="document.location.href='updateForm?articlenum=${article.articlenum}'">&nbsp;&nbsp;&nbsp;&nbsp;
  					<input type="button" value="글삭제" onclick="document.location.href='deleteForm?articlenum=${article.articlenum}&num=${article.num }'">&nbsp;&nbsp;&nbsp;&nbsp;
  					<input type="button" value="답글쓰기" onclick="document.location.href='write?articlenum=${article.articlenum}&ref=${article.ref}&re_level=${article.re_level}&re_step=${article.re_step}&num=${article.num }'">&nbsp;&nbsp;&nbsp;&nbsp;
  					<input type="button" value="글목록" onclick="document.location.href='list'">
  				</td>
  			</tr> --%>
  			<tr>
  			<td>
  			<a href="javascript:history.go(-1)">뒤로가기</a>
  			</td>
  			</tr>
  			
		</table>
		
		<br/><br/>
</div>



<script>

function like_func(photonum) {
	console.log("photonum="+photonum);
	var frm_read = $('#frm_read');
	var email = $('#email', frm_read).val();
	
	$.ajax({
		url: "${pageContext.request.contextPath}/photo/photoContent/like"
		, type: "GET"
		, cache: false
		, dataType: "json"
		, data: {
			photonum: photonum
		}, // RoomController로 보내준다
		success: function (data) { // RoomController로부터 데이터를 받는다 
			var msg = '';
			var like_img = '';
			msg += data.msg;
			alert(msg);
			
			if (data.likeCheck == 0) { //좋아요 누른지 여부가 0 == 좋아요 누르지 않았다.
				like_img = '<%=request.getContextPath()%>/images/dislike.png';
			}
			else { //좋아요 눌렀으면 like.png이미지
				like_img = '<%=request.getContextPath()%>/images/like.png';
			}
			
			$('#' + photonum + 'like_img').attr('src', like_img);
			$('#' + photonum + 'likeCnt').html(data.likeCnt);
			$('#likeCheck').html(data.likeCheck);
		}
		, error: function (request, status, error) {
			alert("에러 !! code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}


function clearField(field){
    if (field.value == field.defaultValue) {
      field.value = '';
    }
  }
  function checkField(field){
    if (field.value == '') {
      field.value = field.defaultValue;
    }
  }











</script>

	
</body>
</html>