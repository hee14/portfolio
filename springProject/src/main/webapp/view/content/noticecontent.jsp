<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<br><br><br>
	<div class="row">
		<div class="col-xs-2 col-md-2"></div>
		<div class="col-xs-8 col-md-8">
			<h2 class="text-center">공지 사항</h2>
			<p>&nbsp;</p>
			<div class="table table-responsive">
				<table class="table">
					<tr>
						<th class="success">글번호</th>
						<td>${notice.notice_id }</td>
						<th class="success">조회수</th>
						<td>${notice.readcount }</td>
					</tr>


					<tr>
						<th class="success">작성자</th>
						<td>운영자</td>
						<th class="success">작성일</th>
						<td>${notice.reg_date }</td>
					</tr>

					<tr>
						<th class="success">이메일</th>
						<td colspan="3">admin@goog.goog</td>
					</tr>

					<tr>
						<th class="success">제목</th>
						<td colspan="3">${notice.title }</td>
					</tr>

					<tr>
						<th class="success">글 내용</th>
						<td colspan="3">${notice.content }</td>
					</tr>

					<tr>
						<td colspan="4" class="text-center">
						<a href="noticeli"
							class="btn btn-success" >돌아 가기</a>
							<c:if test="${name=='admin' }">
							<a href="${pageContext.request.contextPath }/ms/notice" class="btn btn-danger">관리자 페이지로 이동</a>
							</c:if>
							</td>
					</tr>



				</table>
			</div>

		</div>
	</div>




</body>
</html>