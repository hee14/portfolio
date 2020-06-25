<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>게시글 보기</title>

<style>
	table {
	  border-collapse: collapse;
	  /* width: 90%; */
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
		
   			<tr>
	      		<td align="left">
	      			<!-- 프로필사진 -->
	      			<span style = "float:left; width:60px;">
	      				<img src = "${pageContext.request.contextPath}/uploadFile/${setmember.profileImg}" style="width:50px; height:50px; border-radius: 100%;">
	      			</span>
	      			<span style = "float:left;">
	      				<!-- 이름 -->
	      				<span>
      						<b>${article.name}</b><br/>
      					</span>
      					<!-- 게시날짜 -->
      					<span>
      						<div style="color:grey; font-size: 0.7rem">${article.reg_date}</div>
      					</span>
      				</span>
      			</td>
      		</tr>
      		<%-- 
      		<tr>
      			<td align="center">조회수</td><td align="left">${article.readcount}</td>  
      		</tr> --%>
      		
      		<tr>
      			<td align="left">
      			
      				<b>${article.subject}</b>
      				<br/><br/>
      				
      				<pre>${article.content}</pre>
      			
      			
      				<br/><br/><br/><br/><br/>
      				
      				
      				<span style="color:grey; font-size: 0.7rem;">
	      			<div style = "float:left;">♥ 좋아요&nbsp</div> <div id='${article.articlenum}likeCnt' style = "float:left;">${article.like1}</div> 
	      			<div style = "float:left;">&nbsp &nbsp<img src="<%=request.getContextPath()%>/images/readcount.png" style="width:20px;"/> 조회수&nbsp</div> <div style = "float:left;">${article.readcount}</div> <br/>
      			</span>
      			
      			</td>
      			
			</tr>  
   
   			<tr>
			
				<td align="center">
					<span>
						<a href='javascript: like_func(${article.articlenum});'> 
						
							<c:if test="${checknum==0 }">
								<img src='<%=request.getContextPath()%>/images/dislike.png' id='${article.articlenum}like_img' style="width: 20px; height: 20px; float:left;">
							</c:if> 
							<c:if test="${checknum==1 }">
								<img src='<%=request.getContextPath()%>/images/like.png' id='${article.articlenum}like_img' style="width: 20px; height: 20px; float:left;">
							</c:if>
						</a> 
													
						<div style = "float:left;"> &nbsp좋아요&nbsp</div>
						
					</span>
				</td>
				
			</tr>
   
   			
   			
   			<tr>
				<td>
				
					<br/>
					<div>
						<span style = "float:left; width:60px;">
		      				<img src = "${pageContext.request.contextPath}/uploadFile/${setmember1.profileImg}" style="width:50px; height:50px; border-radius: 100%;">
		      			</span>
						<form action="<%= request.getContextPath()%>/board/commentWrite" method="post">
							<input type="hidden"  name="articlenum" value="${article.articlenum }">
							<input type="hidden"  name="num" value="${article.num }">
							<input type="hidden"  name="ref" value="${article.ref }">
							<input type="hidden"  name="re_step" value="${article.re_step }">
							<input type="hidden"  name="re_level" value="${article.re_level }">
							<input type="hidden"  name="name" value="${name}"> <!-- name이랑 email도 hidden으로 넘기기 -->
							<input type="hidden"  name="email" value="${setmember1.email}">
							<input type="hidden"  name="subject" value=" ">
							<input type="hidden"  name="passwd" value=" ">
					
							<textarea name="content" rows="4" cols="19"  onblur="checkField(this)" onfocus="clearField(this)" style="font-size: 0.8em; float: left">댓글 달기...	</textarea>
							 &nbsp&nbsp<input type="submit" value="확인"/>
						</form>
					</div>
					
					<br/><br/><br/>
					
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
	      						<div style="color:grey; font-size: 0.7em">${commentList.reg_date }</div>
	      					</span>
	      				</span>
	      				
	      				<br/>
	      				<!-- 댓글 내용 -->
	      				<span style="font-size: 0.8em">
	      					<br/>
	      					&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp ${commentList.content }
	      					<br/>
	      				</span>
	      				
	      				<br/>
	      				
      				</c:forEach>
					
				</td>
			</tr>
			
   
  			<tr>
  			<td><a href="javascript:history.go(-1)">뒤로가기</a>
  			</td>
  			</tr>
		</table>
		
		<br/><br/>
	</div>


<script>

function like_func(articlenum) {
	var frm_read = $('#frm_read');
	var email = $('#email', frm_read).val();
	
	$.ajax({
		url: "${pageContext.request.contextPath}/board/content/like"
		, type: "GET"
		, cache: false
		, dataType: "json"
		, data: {
			articlenum: articlenum
		}, // BoardController로 보내준다
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
			
			$('#' + articlenum + 'like_img').attr('src', like_img);
			$('#' + articlenum + 'likeCnt').html(data.likeCnt);
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