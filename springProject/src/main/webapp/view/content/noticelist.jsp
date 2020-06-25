<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>공지 사항</h2>
  <p>속닥속닥 공지</p>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>제 목</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="li" items="${noticeli}">
      <tr>
        <td><a href="${pageContext.request.contextPath}/content/notice?notice_id=${li.notice_id}">${li.title }</a></td>
        <td>${li.reg_date }</td>
        <td>${li.readcount }</td>
      </tr> 
      </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
