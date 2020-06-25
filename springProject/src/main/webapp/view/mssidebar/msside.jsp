<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<style>
		body {
			font-family: "Lato", sans-serif;
		}
		/* Fixed sidenav, full height */
		
		.sidenav {
			height: 100%;
			width: 200px;
			position: fixed;
			z-index: 1;
			top: 0;
			left: 0;
			background-color: #111;
			overflow-x: hidden;
			padding-top: 20px;
		}
		/* Style the sidenav links and the dropdown button */
		
		.sidenav a,
		.dropdown-btn {
			padding: 6px 8px 6px 16px;
			text-decoration: none;
			font-size: 20px;
			color: #818181;
			display: block;
			border: none;
			background: none;
			width: 100%;
			text-align: left;
			cursor: pointer;
			outline: none;
		}
		/* On mouse-over */
		
		.sidenav a:hover,
		.dropdown-btn:hover {
			color: #f1f1f1;
		}
		/* Main content */
		
		.main {
			margin-left: 200px;
			/* Same as the width of the sidenav */
			font-size: 20px;
			/* Increased text to enable scrolling */
			padding: 0px 10px;
		}
		/* Add an active class to the active dropdown button */
		
		.active {
			background-color: green;
			color: white;
		}
		/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
		
		.dropdown-container {
			display: none;
			background-color: #262626;
			padding-left: 8px;
		}
		/* Optional: Style the caret down icon */
		
		.fa-caret-down {
			float: right;
			padding-right: 8px;
		}
		/* Some media queries for responsiveness */
		
		@media screen and (max-height: 450px) {
			.sidenav {
				padding-top: 15px;
			}
			.sidenav a {
				font-size: 18px;
			}
		}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<div class="sidenav"> <a href="" style="color: white"><h3>메인 화면 이동</h3></a>
		<button class="dropdown-btn"> 회원 관리 <i class="fa fa-caret-down"></i> </button>
		<div class="dropdown-container"> <a href="../ms/usersmg.jsp">회원 관리</a> <a href="#">회원 메일 발송</a> <a href="#">회원 통계</a> </div>
		<button class="dropdown-btn"> 게시판 관리 <i class="fa fa-caret-down"></i> </button>
		<div class="dropdown-container"> <a href="#">공지 사항</a> <a href="#">1 : 1 문의</a> <a href="#">모임별 게시판</a> <a href="#">모임별 사진관</a> </div>
		<button class="dropdown-btn"> 모임 관리 <i class="fa fa-caret-down"></i> </button>
		<div class="dropdown-container"> <a href="#">전체 모임</a> <a href="#">Link 2</a> <a href="#">Link 3</a> </div>
	</div>
	<br />
	<script>
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;
		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function () {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				}
				else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>
	<!-- sidebar menu -->
</body>

</html>