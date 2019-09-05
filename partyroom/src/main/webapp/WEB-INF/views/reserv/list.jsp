<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../includes/headerForBoard.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<br /><br /><br /><br /><br />

<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >문의 게시판</p>
		


<table class="table table-hover">
				
			<thead>
				<tr>
					<th width="8%">No.</th>
					<th width="49%">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
					<th width="8%">조회수</th>
				</tr>
			</thead>
			<tbody>

					
				<c:forEach items="${reservList}" var="reserv">
		            <tr>
		              <td><c:out value="${reserv.reserv_idx}" /></td>
		               <td>
		                  <a class='move' href='<c:out value="${reserv.reserv_idx}"/>'>
		                  <c:out value="${reserv.ticket}" />   <b>[  <c:out value="${reserv.count}" />  ]</b>
		                  </a>
		              <td><c:out value="${reserv.price}" /></td>
		              
		              <td><fmt:formatDate pattern="yyyy-MM-dd"
		                  value="${reserv.start_date}" /></td>
		                  
		                 <%--  <td><c:out value="${board.viewcnt }"/></td> --%>
		                  <td><c:out value="${reserv.reserv_email}" /></td>
		            </tr>
          	</c:forEach>

				</table>
</body>
</html>