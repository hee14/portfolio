<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<br>
<br>
<br>
</div>
	<div style="text-align: center; top:200px">
		

		
				<script>
				
				$(document).ready(function() {
					 var date = new Date();
					    var d = date.getDate();
					    var m = date.getMonth();
					    var y = date.getFullYear();

				
						
						
					$('#calendar').fullCalendar({
						header: {
						    left: 'prev,next today',
						    center: 'title',
						    right: 'addEventButton,month,agendaWeek,agendaDay'
						  }, 
// 						  customButtons: {
// 						      addEventButton: {
// 						        text: '일정 등록',
// 						        click: function() {
// 						          var dateStr = prompt('Enter a date in YYYY-MM-DD format');
// 						          var date = new Date(dateStr + 'T00:00:00'); // will be in local time

// 						          if (!isNaN(date.valueOf())) { // valid?
// 						            calendar.addEvent({
// 						              title: 'dynamic event',
// 						              start: date,
// 						              allDay: true
// 						            });
// 						            alert('Great. Now, update your database...');
// 						          } else {
// 						            alert('Invalid date.');
// 						          }
// 						        }
// 						      }
// 						    },
						  
						editable: false,
						navLinks: true,
						eventLimit: true,
						locale: "ko",
	                	
 
						events: [
							<c:forEach var="li" items="${roaa }">
							 <c:forEach var="lli" items="${li }">
	 								
	 				
				                {
				                	
				                	
				                	title : "${lli.meet_subtitle }", 
				                	start : "${lli.meet_date_start} ${lli.meet_time_start}",
				                    end : "${lli.meet_date_end} ${lli.meet_time_end}",
				                    <c:forEach var="bookli" items="${bookli}">
				                    <c:if test="${lli.num==bookli.class_id && lli.book_id==bookli.book_id}">
				                    color : "#FF97FF"
				                    </c:if>
// 				                    <c:if test="${lli.num==bookli.class_id && lli.book_id==bookli.book_id}">
// 				                    color : "#000000"
// 				                    </c:if>
				                    </c:forEach>
				                    
				                    
				                }, 
				                </c:forEach>
				                </c:forEach>
			                
					 	]
					
					});
					
					
				});
				
				
// 				function addscehdul() {
// 					 	var url = "${pageContext.request.contextPath}/room/roombook?num=13";
// 			            var name = "popup test";
// 			            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
// 			            window.open(url, name, option);
// 				}
				
			</script>


			
	


	<div id="calendar" style="max-width: 900px; margin: 0 auto;"></div>
	</div>

</body>
</html>