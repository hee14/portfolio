<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="${pageContext.request.contextPath }/css/nprogress.css" rel="stylesheet">
	<!-- iCheck -->
	<link href="${pageContext.request.contextPath }/css/green.css" rel="stylesheet">
	<!-- bootstrap-progressbar -->
	<link href="${pageContext.request.contextPath }/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
	<!-- JQVMap -->
	<link href="${pageContext.request.contextPath }/css/jqvmap.min.css" rel="stylesheet" />
	<!-- bootstrap-daterangepicker -->
	<link href="${pageContext.request.contextPath }/css/daterangepicker.css" rel="stylesheet">
	<!-- Custom Theme Style -->
	<link href="${pageContext.request.contextPath }/css/custom.min.css" rel="stylesheet">
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section"><br/>
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a> 유저 관리</a>
									<ul class="nav child_menu">
										<li><a href="index.html">회원 관리</a></li>
										<li><a href="index.html">회원 메일 발송</a></li>
										<li><a href="index.html">회원 통계</a></li>
									</ul></li>
								<li><a>케시판 관리 </span></a>
									<ul class="nav child_menu">
										<li><a href="form.html">공지 사항</a></li>
										<li><a href="form_advanced.html">1 : 1 문의</a></li>
										<li><a href="form_validation.html">모임별 게시판</a></li>
										<li><a href="form_wizards.html">모임별 사진관</a></li>
									</ul></li>
								<li><a>모임 관리</span></a>
									<ul class="nav child_menu">
										<li><a href="general_elements.html">전체 모임</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath }/js/fastclick.js"></script>
	<!-- NProgress -->
	<script src="${pageContext.request.contextPath }/js/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="${pageContext.request.contextPath }/js/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="${pageContext.request.contextPath }/js/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script src="${pageContext.request.contextPath }/js/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath }/js/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="${pageContext.request.contextPath }/js/skycons.js"></script>
	<!-- Flot -->
	<script src="${pageContext.request.contextPath }/js/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.flot.time.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="${pageContext.request.contextPath }/js/jquery.flot.orderBars.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.flot.spline.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="${pageContext.request.contextPath }/js/date.js"></script>
	<!-- JQVMap -->
	<script src="${pageContext.request.contextPath }/js/jquery.vmap.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.vmap.world.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="${pageContext.request.contextPath }/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/daterangepicker.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath }/js/custom.min.js"></script>
</body>
</html>