<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
 
  <!-- <div style = "background:#2e2e30; padding: 2px; color:white; text-align:center;"><h4 style = "margin-top: .5rem;"><i class="far fa-envelope" style = "margin-right:10px;"></i>쪽지보내기</h4></div> -->
  <div class="container mt-3">
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" style = "padding-left:20px;">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#menu3" style = "color: #06296b; padding:.5rem 2rem;">쪽지보내기</a>
    </li>
  </ul>
  
	  <!-- Tab panes -->
	  <div class="tab-content">
    
	    <!-- Tab 3_ 쪽지보내기 -->
	    <div id="menu3" class="container tab-pane fade active show"><br>
	       <form method="post" id = "notewrite" name="notewrite">
	       		<input type="hidden" name="notereceiver" value="${noteRecieverMemid}">
			    <div class="row">
			      <div class="col">
			      	<textarea name="content" rows="13" cols="40" class="form-control"></textarea> 
			      </div>
			    </div>
			    <input type="button" value = "쪽지보내기" class="btn btn-primary mt-3" style = "float:right;" onclick="clickEvent(); return false;">
		  </form>
	    </div>
	  </div>
</div>


<script>
	function clickEvent() {
		var formData = $("#notewrite").serialize();
		$.ajax({
			  cache : false,
			  url: '${pageContext.request.contextPath}/mypage/popupnoteWrite',
			  type: 'post',
			  data: formData,
			  success : function(data) {
			    // 성공 시 동작
			     if(data == "OK") {
			    	 alert("쪽지를 보냈습니다.");
			    	 opener.document.location.reload();
					 close();
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