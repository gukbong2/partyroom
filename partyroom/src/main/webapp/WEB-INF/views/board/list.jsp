<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<%@include file="../includes/header.jsp"%>

<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >문의 게시판</p>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12" >
		<div class="panel panel-default">
			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-xs pull-right">글 작성</button>
				<button id='naverBtn' type="button" class="btn btn-xs pull-right">네이버</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-hover" style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
			<thead>
				<tr>
					<th width="8%">No.</th>
					<th width="57%">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
				</tr>
			</thead>
			<tbody>

					
					<c:forEach items="${list }" var="board">
						<tr>
							<td><c:out value="${board.bno }"/></td>
							<td style="color : black;"><a href="/board/get?bno=${board.bno }"><c:out value="${board.title }"/></a></td>
							<td><c:out value="${board.writer }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
						</tr>
					
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
	$("#regBtn").on("click", function() {
		self.location = "/board/register";
	});
	
	$("#naverBtn").on("click", function() {
		self.location = "/index";
	});
	
	
});

</script>