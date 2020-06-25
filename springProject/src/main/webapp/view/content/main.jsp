<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie-edge">
	<meta name="format-detection" content="telephone-no">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/main_tablet.css" media="all and (max-width:1420px)">
	<link rel= "stylesheet" href="${pageContext.request.contextPath}/css/main_mobile.css" media="all and (max-width:760px)">
	<!-- slider -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<title>속닥속닥</title>
	<style>                                                                                     
	  /* Make the image fully responsive */
	  .carousel-inner img {
	      max-width: 100%;
	  }
	</style>
</head>
<body>
	
<div class="main_container">
	<div id="demo" class="carousel slide" data-ride="carousel">
		
	  	<!-- Indicators -->
		<ul class="carousel-indicators">
		   <li data-target="#demo" data-slide-to="0" class="active"></li>
		   <li data-target="#demo" data-slide-to="1"></li>
		   <li data-target="#demo" data-slide-to="2"></li>
		</ul>
	  
	  	<!-- The slideshow -->
	  	<div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="main-img" src="${pageContext.request.contextPath}/images/event1.png" width="2000px" height="400px">
		    </div>
		    
		    <!-- 배너이미지를 보여줌 -->
	    	<c:forEach var="banner" items="${bannerlist}">
	     		<div class="carousel-item">
			      <img class="main-img" src="${pageContext.request.contextPath}/uploadFile/${banner.bannerImg}" alt="Chicago" width="2000px" height="400px">
			    </div>
	    	</c:forEach>
	    	
	  </div>
	  
	  <!-- 이전 버튼 -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <!-- 다음 버튼 -->
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	  
	</div>
	
	<!-- Page Content -->
	<div class="container1">
	 
		<c:forEach var="cateli" items="${cateli}">
			<a style="text-decoration: none;" class="btnmain" href="main?pageNum=${num}&categorie=${cateli.interestNum}">${cateli.interestName}</a>
		</c:forEach> 
	 
		<div class="row">  			
			<c:forEach var="articleli" items="${articleli}">
    			<div class="col-lg-4 col-sm-6 mb-4 mli">
	      			<div class="card h-100">
	      				<a style="text-decoration: none;" href="<%=request.getContextPath()%>/room/roomcontent?num=${articleli.num}">
		        			<img class="card-img-top" src="<%=request.getContextPath()%>/uploadFile/${articleli.photo}" alt="모임 이미지" width="700" height="400">
		        			<div class="card-body">
					        	<h4 class="card-title">${articleli.meet_title}</h4>
					        	<p class="card-text">
					        		<p>장소    : ${articleli.location }</p>
									<p>모임장 : ${articleli.host }</p>
					          	</p>
					        </div>
	        			</a>
	      			</div>
	    		</div>
	   		</c:forEach> 
		</div>
	 
		<!-- 모바일용 리스트 -->
		<c:forEach var="articleli" items="${articleli}">  
			<div class="sli">
				<a style="text-decoration: none;" href="<%=request.getContextPath()%>/room/roomcontent?num=${articleli.num}">
		  			<div class="w3-cell">
		    			<img src="<%= request.getContextPath()%>/uploadFile/${articleli.photo}" style="width:70px; height:70px;">
		  			</div>
		  			<div class="w3-cell w3-container" style="padding: 10px 10px 10px 10px!important;">
		  				<i class="material-icons" style="font-size:12px">location_on</i>
		   				<script>
						    var Sample = "${articleli.location }"
						    var result = Sample.split(" ");
						    '<p>' + document.write(result[1]); + '</p>'
						</script>
						<br>
						<h6> ${articleli.meet_title }</h6>
		  			</div>
		  		</a>
			</div>
		</c:forEach>   
	
		<!-- Pagination -->
		<c:if test="${categorie == null}">
	  		<ul class="pagination justify-content-center">
			  	<c:if test="${startPage > bottomLine}">
			    	<li class="page-item">
			      		<a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/main?pageNum=${startPage - bottomLine}" aria-label="Previous">
			            	<span aria-hidden="true">&laquo;</span>
			            	<span class="sr-only">Previous</span>
			      		</a>
					</li>
				</c:if> 
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item"><a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/content/main?pageNum=${i}" style="color: grey">${i}</a></li>
				</c:forEach>
				
				<c:if test="${endPage < pageCount}">
			    	<li class="page-item">
						<a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/main?pageNum=${startPage + bottomLine}" aria-label="Next">
			            	<span aria-hidden="true">&raquo;</span>
			            	<span class="sr-only">Next</span>
			      		</a>
			    	</li> 
				</c:if>
			</ul>
		</c:if>
		
		<c:if test="${categorie != null}">
			<ul class="pagination justify-content-center">
				<c:if test="${startPage > bottomLine}">
		    		<li class="page-item">
						<a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/main?pageNum=${startPage - bottomLine}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>
		   		</c:if>
		   		
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item"><a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/content/main?pageNum=${i}&categorie=${categorie}" style="color: grey">${i}</a></li>
				</c:forEach>
			
				<c:if test="${endPage < pageCount}">
					<li class="page-item">
						<a style="text-decoration: none;" class="page-link" href="${pageContext.request.contextPath}/main?pageNum=${startPage + bottomLine}" aria-label="Next">
		            		<span aria-hidden="true">&raquo;</span>
		            		<span class="sr-only">Next</span>
		      			</a>
		    		</li> 
		   		</c:if>
		 	</ul>
		</c:if>
				
	</div>	<!-- container1 -->
	
</div>

</body>
</html>