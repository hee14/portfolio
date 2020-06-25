<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function openCity(evt, cityName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("manage");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}

		tablinks = document.getElementsByClassName("tablink");

		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" red", "");
		}

		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " red";
	}
	
	function check_all() {
	
		var mycheck = document.getElementsByName("sports");
		for(i=0; i < mycheck.length; i++) {
			mycheck[i].checked = true;
		}
	}
	function uncheck_all() {
		var mycheck = document.getElementsByName("sports");
		for(i=0; i <mycheck.length; i++) {
			mycheck[i].checked = false;
		}
	}
	
	function thischeck(){
		var allcheck = document.getElmentById("allcheck");
		allcheck.cheecked = false;
	}
	
</script>
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
</head>
<body>



	<h1 style="text-align: center;">관리자 페이지</h1>

	<div class="bar w3-black">
		<button class="bar tablink red" onclick="openCity(event,'book')">모임별
			일정 상황</button>
		<button class="bar tablink" onclick="openCity(event,'member')">모임별
			회원 상황</button>
		<button class="bar tablink" onclick="openCity(event,'allclass')">모든
			모임</button>
		<button class="bar tablink" onclick="openCity(event,'alluser')">모든
			유저</button>
			
			<button style="float: right;display: inline-block;">엑셀 다운</button>
	</div>

	<div id="book" class="manage">
	<table class="type02" style="border-collapse: collapse;">
			<tr>
				<th><input type="checkbox" id="allcheck" onclick="check_all()" value="전체선택"></th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>
					관리
				</th>
			</tr>
			<c:forEach var="classbook" items="${classbook }">
				<tr>
					<td><input type="checkbox" name="sports"></td>
					<td>${classbook.meet_subtitle  }</td>
					<td>${classbook.meet_subtitle  }</td>
					<td>${classbook.meet_subtitle }</td>
					<td>${classbook.meet_subtitle  }</td>
					<td>${classbook.meet_subtitle }</td>
					<td>${classbook.meet_subtitle  }</td>
					<td><button>삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="member" class="manage" style="display: none">
	<table class="type02" style="border-collapse: collapse;">
			<tr>
				<th><input type="checkbox" id="sportAll"></th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>
					관리
				</th>
			</tr>
			<c:forEach var="classjoin" items="${classjoin }">
				<tr>
					<td><input type="checkbox" name="sports" ></td>
					<td>${classjoin.name }</td>
					<td>${classjoin.meet_title }</td>
					<td>${classjoin.name }</td>
					<td>${classjoin.name }</td>
					<td>${classjoin.name }</td>
					<td>${classjoin.name }</td>
					<td><button>삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="allclass" class="manage" style="display: none">
	<table class="type02" style="border-collapse: collapse;">
			<tr>
				<th><input type="checkbox" id="sportAll"></th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>
					관리
				</th>
			</tr>
			<c:forEach var="hobbyclass" items="${hobbyclass }">
				<tr>
					<td><input type="checkbox" name="sports" ></td>
					<td>${hobbyclass.meet_title }</td>
					<td>${hobbyclass.meet_title }</td>
					<td>${hobbyclass.meet_title }</td>
					<td>${hobbyclass.meet_title }</td>
					<td>${hobbyclass.meet_title }</td>
					<td>${hobbyclass.meet_title }</td>
					<td><button>삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="alluser" class="manage" style="display: none">
		<table class="type02" style="border-collapse: collapse;">
			<tr>
				<th><input type="checkbox" id="sportAll"></th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>
					관리
				</th>
			</tr>
			<c:forEach var="member" items="${member }">
				<tr>
					<td><input type="checkbox" name="sports"></td>
					<td>${member.name }</td>
					<td>${member.name }</td>
					<td>${member.name }</td>
					<td>${member.name }</td>
					<td>${member.name }</td>
					<td>${member.name }</td>
					<td><button>삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>