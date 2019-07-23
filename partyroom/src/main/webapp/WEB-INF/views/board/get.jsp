<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>




<div class="row" style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>Bno</label> <input class="form-control" name='bno'
            value='<c:out value="${board.bno }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='title'
            value='<c:out value="${board.title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='writer'
            value='<c:out value="${member.name }"/>' readonly="readonly">
        </div>



<c:if test="${member.name eq board.writer }">
<button data-oper='modify' class="btn btn-default">글 수정</button>
</c:if>
<button data-oper='list' class="btn btn-info">글 목록</button>
<br /><br /><hr /><br /><br />


<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<!-- 댓글 시작 -->
<div class='row' style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
  <div class="col-lg-12">
    <div class="panel panel-default">
      
      <div class="panel-heading">
         <button id='addReplyBtn' class='btn btn-secondary btn-sm'>댓글 작성</button>  
        
      </div>      
      
      <div class="panel-body">        
      	
      	
        <ul class="chat">
			<li class="left clearfix" data-rno='12'>
				<div>
					<div class="header">
					</div>
				</div>
			
			</li>
        </ul>
      </div>

	<div class="panel-footer"></div>


		</div>
  </div>
</div>
<!-- 댓글 끝 -->
<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify");
    operForm.submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list");
    operForm.submit();
    
  });  
});
</script>

<!-- reply.js 시작 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">

$(document).ready(function() {
		
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		
		var replyUL = $(".chat");
		
		showList(1);
		
		function  showList(page) {
			
			replyService.getList({bno : bnoValue, page : page || 1 }, function(list) {
				var str = "";
			
				if (list == null || list.length == 0) {
					replyUL.html("");
					
					return;
				}
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='left clearfix' data-rno'" + list[i].rno + "'>";
					str += "<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replydate) + "</small></div>";
					str += "<p>" + list[i].reply + "</p></div></li>";
					str += "<hr />";
				}
				
				replyUL.html(str);
			});
		}				
		
		
		
		
		
		
		
		
		
		/* //댓글추가
		replyService.add(
		    
		    {reply:"JS Test", replyer:"테스터", bno:bnoValue},
		    
		    function(result){ 
		      console.log("RESULT: " + result);
		    }
		);
		
		//댓글목록
		replyService.getList({bno:bnoValue, page:1}, function(list) {
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
		});
		
	
		// rno 15 삭제
		replyService.remove(15, function(count) {

		   console.log(count);

		   if (count === "success") {
			   console.log("댓글 삭제 성공!");
		   }
		   
		 }, function(err) {
			 console.log('ERROR...');
		 }); 
			
		
		 //fno 19 수정
		 replyService.update({
			 rno : 19,
			 bno : bnoValue,
			 reply : "reply.js 수정"
		 }, function(result) {
			 console.log("수정 완료!");
		 }); 
		 
		 
		 //rno 10 조회
		 replyService.get(10, function(data) {
			 console.log(data);
		 }) */
	
		 
		 
});
</script>
