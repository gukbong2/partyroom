<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@include file="../includes/header.jsp"%>

<style>
.pagination {
   justify-content: center;
}
</style>

<h2 style="text-align: center" id="name"></h2>
<h4 style="text-align: center" id="email"></h4>

<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >문의 게시판</p>
		
<%-- 
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
		
		<h3>이메일 : ${member.email }</h3>
		<br />
		<h3>비밀번호 : ${member.password }</h3>
		<br />
		<h3>성함 : ${member.name }</h3>
		
	</div>
</div>
 --%>

<div class="row">
	<div class="col-lg-12" >
		<div class="panel panel-default">
			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-xs pull-right">글 작성</button>
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
							
							<td>
								<a class="move" href='<c:out value="${board.bno }"/>'>
									<c:out value="${board.title }"></c:out>
								</a>
							</td>
							
							<td><c:out value="${board.writer }"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
						</tr>
					
					</c:forEach>

				</table>
				
				<!-- 검색 조건 처리 시작 -->
				
				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>

				<!-- 검색 조건 처리 끝 -->
				
				<!-- 페이징 시작 -->
				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
							</li>
						</c:if>
						
						
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							
							<!-- ${pageMaker.cri.pageNum == num ? "active":""} " -->
							<li class="page-item">
								<a id="pageBtn" class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
							</li>
						</c:if>


					</ul>
				</div> 
				<!-- 페이징 끝 -->
				
				
				
				<form id='actionForm' action="/board/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='${pageMaker.cri.type}'>
					<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
				</form>
				
				
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
	
		
	$("#regBtn").on("click", function() {
		self.location = "/board/register";
	});
	
	
	var actionForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log("클릭!");
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	
	});
	
	$(".move").on("click",function(e) {

		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr("href")
						+ "'>");
		actionForm.attr("action","/board/get");
		actionForm.submit();

	});
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e) {
		if(!searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요.");
			return false;
		}
		
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("검색 키워드를 입력하세요.");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
	
	
	
	
	
	
	
	
});
	
	

</script>