<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<table style="display: inline;">
			<tr>
				<td>카테고리</td>
				<td>모임명</td>
				<td>회원수</td>
				<td>지위</td>
				<td></td>
			</tr>

			<c:forEach var="li" items="${li }" varStatus="index">
				<tr>
					<td>${li.like_ca }</td>
					<td><a
						href="${pageContext.request.contextPath}/room/roomcontent?num=${li.classnum }">${li.meet_title }</a></td>
					<td>${nowcnt.get(index.index) }/${li.membercnt}</td>
					<td><c:if test="${li.status==1 }">
				모임장</td>
					<td>
					<form action="${pageContext.request.contextPath}/room/management">
					<input type="hidden" name="num" value="${li.classnum }">
					<input type="submit" value="관리 하기">
<!-- 					<button type="button" -->
<%-- 							onclick="location.href='${pageContext.request.contextPath}/room/management?num=${li.classnum}'">관리하기</button></td> --%>
					</form>
					</c:if>
					<c:if test="${li.status==2 }">
				운영진
				</c:if>
					<c:if test="${li.status==3 }">
				회원
				</c:if>
					</td>

				</tr>

			</c:forEach>
		</table>

		<p>



			<c:forEach var="li" items="${roaa }">

				<%-- 			</c:forEach> --%>


				<%-- 			<c:forEach var="roombook" items="${roombookli }">  --%>

				<c:forEach var="lli" items="${li }">
 					${lli.meet_subtitle }
 					</c:forEach>


</c:forEach>


				<script>
				
				$(document).ready(function() {
					 var date = new Date();
					    var d = date.getDate();
					    var m = date.getMonth();
					    var y = date.getFullYear();
					    alert(d+":"+m+":"+y);
// 					

							alert(new Date(2020,3,10,15,20));

				
						
						
					$('#calendar').fullCalendar({
						header: {
						    left: 'prev,next today',
						    center: 'title',
						    right: 'addEventButton,month,agendaWeek,agendaDay'
						  }, 
						  customButtons: {
						      addEventButton: {
						        text: '일정 등록',
						        click: function() {
						          var dateStr = prompt('Enter a date in YYYY-MM-DD format');
						          var date = new Date(dateStr + 'T00:00:00'); // will be in local time

						          if (!isNaN(date.valueOf())) { // valid?
						            calendar.addEvent({
						              title: 'dynamic event',
						              start: date,
						              allDay: true
						            });
						            alert('Great. Now, update your database...');
						          } else {
						            alert('Invalid date.');
						          }
						        }
						      }
						    },
						  
						  
						editable: true,
						navLinks: true,
						eventLimit: true,
						locale: "ko",
	                	
 
						events: [
							<c:forEach var="li" items="${roaa }">
							 <c:forEach var="lli" items="${li }">
	 								
	 				
				                {
				                	title : "${lli.meet_subtitle }"
				                    , start : "${lli.meet_date_start} ${lli.meet_time_start}",
				                    end : "${lli.meet_date_end} ${lli.meet_time_end}"
				                    
				                }, 
				                </c:forEach>
				                </c:forEach>
			                
					 	]
					
					});
					
					
				});
				
				
				function addscehdul() {
					 	var url = "${pageContext.request.contextPath}/room/roombook?num=13";
			            var name = "popup test";
			            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
			            window.open(url, name, option);
				}
				
			</script>


			
	</div>


	<button onclick="javascript:addscehdul()">일정 등록</button>
	<div id="calendar" style="max-width: 900px; margin: 0 auto;"></div>

</body>
</html>