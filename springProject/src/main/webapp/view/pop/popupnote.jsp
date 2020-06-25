<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>속닥속닥 :: 메시지함</title>
</head>
<style>
.table td { padding:0.65rem; }
</style>
<body>
 
  <div style = "background:#2e2e30; padding: 2px; color:white; text-align:center;"><h4 style = "margin-top: .5rem;"><i class="far fa-envelope" style = "margin-right:10px;"></i>내 쪽지함</h4></div>
  <div class="container mt-3">
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" style = "padding-left:20px;">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#menu1" style = "color: #06296b; padding:.5rem 2rem;">받은쪽지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2" style = "color: #06296b; padding:.5rem 2rem;">보낸쪽지</a>
    </li>
    <!-- <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu3" style = "color: #06296b; padding:.5rem 2rem;">쪽지쓰기</a>
    </li> -->
  </ul>
  
  

	  <!-- Tab panes -->
	  <div class="tab-content">
	  
	  	<!-- Tab 1_ 받은쪽지  -->
	    <div id="menu1" class="container tab-pane active"><br>
	      <div class="container" style = "padding:0px; font-size:14px;">
	        <c:forEach var = "myNoteReceiveList" items = "${myNoteReceiveList }" varStatus = "status">
	  		<table class="table table-hover" style = "border-bottom:1px solid #dee2e6;">
			    <tbody>
			    <c:if test = "${myNoteReceiveList.status == 0}">
			      <tr data-toggle="collapse" data-target="#notesend${status.index }" onclick="updateStatus('${myNoteReceiveList.noteid}')">
			      <td style = "vertical-align:inherit;"><i class="far fa-check-circle"></i></td>
			    </c:if>
			    <c:if test = "${myNoteReceiveList.status == 1}">
			      <tr data-toggle="collapse" data-target="#notesend${status.index }">
			      <td style = "vertical-align:inherit;color: green;"><i class="far fa-check-circle"></i></td>
			    </c:if>
			        <td>${myNoteReceiveList.notesender}</td>
			        <td style = "text-align:right;"><fmt:formatDate value="${myNoteReceiveList.send_date}" pattern="yyyy-MM-dd HH:mm:SS" /></td>
			        <c:if test = "${myNoteReceiveList.status == 0}">
			        	<td>읽지않음</td>
			        </c:if>
			        <c:if test = "${myNoteReceiveList.status == 1}">
			        	<td>읽음</td>
			        </c:if>
			        <c:if test = "${myNoteReceiveList.rethat == 1}">
			        	<td>답장보냄</td>
			        </c:if>
			        <c:if test = "${myNoteReceiveList.rethat == 0}">
			        	<td>답장안함</td>
			        </c:if>
			      </tr>
			      <caption id = "notesend${status.index}" class = "collapse">${myNoteReceiveList.content}
				  <c:if test = "${myNoteReceiveList.rethat == 0 }">
				  <form method="post" id = "notewrite" name="notewrite" style = "margin-top:8px;">
					 <input type="hidden" name="notereceiver" value="${myNoteReceiveList.notesender}">
					 <input type="hidden" name="noteid" value="${myNoteReceiveList.noteid}">
					 <div class="row">
					 	<div class="col">
					     	<textarea name="content" rows="5" cols="40" class="form-control"></textarea> 
					    </div>
					 </div>
					 <input type="button" value = "답장보내기" class="btn btn-primary mt-3" style = "float:right;" onclick="clickEvent(); return false;">
			  	  </form>
			  	  </c:if>
			  	  </caption>
			    </tbody>
			  </table>
			  </c:forEach>
			</div>
		</div>
    
    
    	<!-- Tab 2_ 보낸쪽지  -->
	    <div id="menu2" class="container tab-pane fade"><br>
	    	<div class="container" style = "padding:0px; font-size:14px;">     
	    	<c:forEach var = "myNoteSendList" items = "${myNoteSendList }" varStatus = "status">
	  		<table class="table table-hover" style = "border-bottom:1px solid #dee2e6;">
			   <tbody>
			      <tr data-toggle="collapse" data-target="#notesend${status.index }">
			      	<td style = "vertical-align:inherit;"><i class="far fa-check-circle"></i></td>
			        <td>${myNoteSendList.notereceiver}</td>
			        <td style = "text-align:right;"><fmt:formatDate value="${myNoteSendList.send_date}" pattern="yyyy-MM-dd HH:mm:SS" /></td>
			        <c:if test = "${myNoteSendList.status == 0}">
			        	<td>읽지않음</td>
			        </c:if>
			        <c:if test = "${myNoteSendList.status == 1}">
			        	<td>읽음</td>
			        </c:if>
			      </tr>
			      <caption id = "notesend${status.index}" class = "collapse">${myNoteSendList.content}</caption>
			    </tbody>
			  </table>
			  </c:forEach>
			</div>
	    </div>
	  </div>
</div>
  
  
  <script>
	function updateStatus(num) {
		var _noteid = num;
		console.log(_noteid);
		$.ajax({
			  async: false,
			  type: 'POST',
			  dataType: 'text',
			  data : {noteid : _noteid},
			  url: '${pageContext.request.contextPath}/mypage/popupnoteRead',
			  success : function(data) {
				console.log(data);
			    if(data == "OK") {
			    	 alert("쪽지를 확인하였습니다.");
			    	 location.reload();
			     }
			  },
			  error : function(xhr, status) {
	                alert(xhr + " : " + status);
	          }
		});
	}
	</script>
	
	<script>
	function clickEvent() {
		var formData = $("#notewrite").serialize();
		$.ajax({
			  cache : false,
			  url: '${pageContext.request.contextPath}/mypage/popupnoteWrite2',
			  type: 'post',
			  data: formData,
			  success : function(data) {
			    // 성공 시 동작
			     if(data == "OK") {
			    	 alert("쪽지를 보냈습니다.");
			    	 location.reload();
			     }
			  },
			  error : function(xhr, status) {
	                alert(xhr + " : " + status);
	          }
		});
	}
</script>
  
</body>
</html>