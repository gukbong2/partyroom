<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!-- reply.js 시작 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>

<%@include file="../includes/headerForBoard.jsp"%>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>


<br /><br /><br /><br /><br />

<!-- 글 상세보기 시작 -->
<div class='row' style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading"></div>
      <div class="panel-body">

          <div class="form-group">
            <p class="center"><strong>#${board.bno }</strong></p>
            <p> ${board.title }</p>
            <p> ${board.writer } 님</p>
         </div>

		<hr />
		

        <div class="form-group">
        
         <p>${board.content }</p>
        </div>
        
        <br /><br /><br />
        
        <hr />
        
       

        



<c:if test="${member.name eq board.writer && member.email eq board.email}">
<button data-oper='modify' class="btn btn-default">글 수정</button>
</c:if>
<button data-oper='list' class="btn btn-info">글 목록</button>

<hr>

<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>

      </div>

    </div>
  </div>
</div>
<!-- 글 상세보기 끝  -->

 <!-- 파일업로드 -->
		<div class='bigPictureWrapper'>
		   <div class='bigPicture'>
		   
		   </div>
		</div>
		
<div class="row" style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      	  <div class="panel-body">
        
		        <div class='uploadResult'> 
		          <ul>
		          </ul>
		        </div>
	      </div>
      <!--  end panel-body -->
	 </div>
    <!--  end panel-body -->
  	</div>
  <!-- end panel -->
</div>
<!-- /.row -->


<hr style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;" />
<!-- 댓글 시작 -->
<div class='row' style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
  <div class="col-lg-12">
    <div class="panel panel-default">
      	
      <div class="panel-heading">
      <c:if test="${!empty member.name}">
      	<form method="POST" id="replyForm">
       		<input type="button"  id="replyBtn" class='btn btn-secondary btn-sm' value="댓글 작성"/>
       	</form>
       </c:if>
      </div>      
      <br><br>
      
      	<!-- 댓글 입력  -->
      	  <div class="panel-body">
			<div class="addReply" id="addReply">
				
			</div>
		</div> 
		
		
      
      <!-- 댓글목록 -->
      <div class="panel-body">        
        <ul class="chat">
			<!-- 자기 글이면 수정/삭제 버튼 보이게 처리 -->
        </ul>
      </div>

	<div class="panel-footer">
	
	</div>


		</div>
  </div>
</div>
<!-- 댓글 끝 -->



<!-- 댓글 수정 Modal -->
<div class="modal fade" id="ReplyModal" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
      </div>
      
      <div class="modal-body">
        <div class="form-group">
          <label>댓글</label> 
          <input class="form-control" name='reply' value="">
        </div>    
        <!--   
        <div class="form-group">
          <label>작성자</label> 
          <input class="form-control" name='replyer' id="ReplyerVal" value="" readonly="readonly">
        </div>
         -->
      </div>
	   <div class="modal-footer">
	       <button id="replyModBtn" type="button" class="btn btn-warning">수정</button>
	       <button id="replyRemoveBtn" type="button" class="btn btn-danger">삭제</button>
	       <button id="replyRegisterBtn" type="button" class="btn btn-primary">Register</button>
	       <button id="replyCloseBtn" type="button" class="btn btn-default">닫기</button>
	   </div>         
	 </div>
  </div>
</div>
      <!-- 모달끝 -->





<script>

	$(document).ready(function() {
		
		    var bno = '<c:out value="${board.bno}"/>';
		    
		    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
		        
		        console.log(arr);
		        
		        var str = "";
		        
		        $(arr).each(function(i, attach){
		        
		          //image type
		          if(attach.filetype){
		            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.filename);
		            
		            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.filetype+"' ><div>";
		            str += "<img src='/upload/display?filename="+fileCallPath+"'>";
		            str += "</div>";
		            str +"</li>";
		          }else{
		              
		            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.filetype+"' ><div>";
		            str += "<span> "+ attach.filename+"</span><br/>";
		            str += "<img src='/resources/image/attach.png'></a>";
		            str += "</div>";
		            str +"</li>";
		          }
		        });
		        
		        $(".uploadResult ul").html(str);
		        
		        
		      });//end getjson
		      
		      
		    $(".uploadResult").on("click","li", function(e){
		        
		        console.log("이미지 보기");
		        
		        var liObj = $(this);
		        
		        var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		        
		        if(liObj.data("type")){
		          showImage(path.replace(new RegExp(/\\/g),"/"));
		        }else {
		          //download 
		          self.location ="/upload/download?filename="+path
		        }
		        
		        
		      });
		      
		      function showImage(fileCallPath){
		    	    
		        console.log("fileCallPath : " + fileCallPath);
		        
		        $(".bigPictureWrapper").css("display","flex").show();
		        
		        $(".bigPicture")
		        .html("<img src='/upload/display?filename="+fileCallPath+"' >")
		        .animate({width:'100%', height: '100%'}, 1000);
		        
		      }

		      $(".bigPictureWrapper").on("click", function(e){
		        $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		        setTimeout(function(){
		          $('.bigPictureWrapper').hide();
		        }, 1000);
		      });

		      
		    });
</script>



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
	
	
		var bnoValue = '<c:out value="${board.bno}"/>';
		
		var replyUL = $(".chat");
		
		showList(1);
		
		function  showList(page) {
			
			console.log("show list 도큐먼트 레디 " + page);
			
			replyService.getList({bno : bnoValue, page : page || 1 }, function(replyCnt, list) {
				
				console.log("replyCnt : " + replyCnt);

				if (page == -1) {
					pageNum = Math.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
			
				if (list == null || list.length == 0) {
					replyUL.html("");
					showReplyPage("");
					return	;
				}
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str +="<li style='list-style:none;' class='left clearfix' data-rno='"+list[i].rno+"'>";
					 str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
					str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replydate) + "</small></div>";
					str += "<p>" + list[i].reply + "</p></div></li>";
					str += "<hr />";
				}
				
				replyUL.html(str);
				showReplyPage(replyCnt);
			});
		}				
		
		// 댓글을 클릭하면 수정 and 삭제 모달
	    var modal = $("#ReplyModal");
	    var modalInputReply = modal.find("input[name='reply']");
	    var modalInputReplyer = modal.find("input[name='replyer']");
	    var modalInputReplydate = modal.find("input[name='replydate']");
	    var replyModBtn = $("#replyModBtn");
	    var replyRemoveBtn = $("#replyRemoveBtn");
	    var replyRegisterBtn = $("#replyRegisterBtn");
		
	    //댓글 클릭 시
	    $(".chat").on("click", "li", function(e){
	        
	        var rno = $(this).data("rno");
	        var memberName = "${member.name}";
	        var replyer =  modalInputReplyer.val();
	        var reply =  modalInputReply.val();
	        
	       
	       
	          replyService.get(rno, function(reply){
	          
	          modalInputReply.val(reply.reply);
	          modalInputReplyer.val(reply.replyer);
	          modalInputReplydate.val(replyService.displayTime( reply.replydate))
	          .attr("readonly","readonly");
	          modal.data("rno", reply.rno);
	          
	          var replyer = reply.replyer;
	          console.log("rno : " + rno);
	          console.log("memberName : " + memberName);
	          console.log("replyer : " + replyer);
	          console.log("reply : " + reply);
	          
	          
	          modal.find("button[id !='replyCloseBtn']").hide();
	          replyModBtn.show();
	          replyRemoveBtn.show();
	          
	          if (replyer == memberName ) {
		       	  $("#ReplyModal").modal("show");
		       	  
		       	  showList(pageNum);
		       	  
		       	  
	          	} 
	        });
	      });
			
	    //리플 모달 수정
		  	$("#replyModBtn").on("click", function(e) {
		  
		    	console.log("리플수정버튼 클릭~~");
		    	
		    	var reply = {rno : modal.data("rno"), reply : modalInputReply.val()};
		    	
		    	replyService.update(reply, function(result) {
		    		console.log("result : " + result);
		    		modal.modal("hide");
		    		showList(pageNum);
		    	
		    	});
		    
			});
		  	
	    //리플 모달 삭제
		  	$("#replyRemoveBtn").on("click", function(e) {
		  		console.log("리플 삭제 클릭~");
		  		
		  		var rno = modal.data("rno");
		  			
		  		replyService.remove(rno, function(result) {
		  			console.log("result : " + result);
		    		modal.modal("hide");
		    		
		    		
		    		showList(pageNum);
		  		});
		  		
		  	});
		  	
		  	$("#replyCloseBtn").on("click", function(e) {
		  		console.log("리플 모달 닫기 클릭~");
		  		
		  		modal.modal("hide");
	    		showList(pageNum);
		  	});
	
		  	
		  	//댓글 페이징 넣기
		  	 var pageNum = 1;
		     var replyPageFooter = $(".panel-footer");
		     
		     function showReplyPage(replyCnt){
		       
		       var endNum = Math.ceil(pageNum / 10.0) * 10;  
		       var startNum = endNum - 9; 
		       
		       var prev = startNum != 1;
		       var next = false;
		       
		       if(endNum * 10 >= replyCnt){
		         endNum = Math.ceil(replyCnt/10.0);
		       }
		       
		       if(endNum * 10 < replyCnt){
		         next = true;
		       }
		       
		       var str = "<ul class='pagination pull-right'>";
		       
		       if(prev){
		         str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		       }
		       
		       for(var i = startNum ; i <= endNum; i++){
		         
		         var active = pageNum == i? "active":"";
		         
		         str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		       }
		       
		       if(next){
		         str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		       }
		       
		       str += "</ul></div>";
		       
		       console.log(str);
		       
		       replyPageFooter.html(str);
		     }
		      
		  	replyPageFooter.on("click", "li a", function(e) {
		  		e.preventDefault();
		  		
		  		console.log("댓글 페이징 버튼 클릭!");
		  		
		  		var targetPageNum = $(this).attr("href");
		  		
		  		console.log("targetPageNum : " + targetPageNum);
		  		
		  		pageNum = targetPageNum;
		  		
		  		showList(pageNum);
		  	
		  	});
		  	
		  	
});

function addReply(frm) {
	var addReply = $("#addReply");
	
	
	console.log("댓글 등록 클릭 됨");
	
	var replyerVal = $("#replyer").val();
	var replyVal = $("#reply").val();
	var bnoVal = $("#bno").val();
	
	console.log("댓글 : " + reply);
	console.log("댓글적은사람 : " + replyer);
	console.log("글번호 : " + bno);
	
	replyService.add(
		    
		    {reply:replyVal, replyer:replyerVal, bno:bnoVal},
		    
		    function(result){ 
		      console.log("RESULT: " + result);
		      var str = "";
		      $("#addReply").html(str);
		      $("#replyBtn").show();
		      showList(-1);
		    }
		);
}	

</script>



<!-- 댓글 등록 Script -->
<script>
var bnoValue = '<c:out value="${board.bno}"/>';
var replyUL = $(".chat");
	$("#replyBtn").on("click", function(e) {
		console.log("댓글 작성 클릭됨");
		var addReply = $("#addReply");
		
		var str = "";
		
		$("#replyBtn").hide();
		str += '<form method="post" name="frm">';
		str += '<input type="hidden" id="replyer" name="replyer" value="${member.name}">';
		str += '<input type="hidden" id="bno" name="bno" value="${board.bno}">';
		str += '<div class="md-form">';
		str += '<p><textarea type="text" id="reply" class="form-control form-rounded" ></textarea>';
		str += '<input type="button"  id="addReplyBtn" class="btn btn-secondary btn-xg" value="댓글 등록" onclick="addReply(this.form)"/></p></form>';
		
		addReply.html(str);
	});
	
	function addReply(frm) {
		var addReply = $("#addReply");
		
		
		console.log("댓글 등록 클릭 됨");
		
		var replyerVal = $("#replyer").val();
		var replyVal = $("#reply").val();
		var bnoVal = $("#bno").val();
		
		console.log("댓글 : " + reply);
		console.log("댓글적은사람 : " + replyer);
		console.log("글번호 : " + bno);
		
		replyService.add(
			    
			    {reply:replyVal, replyer:replyerVal, bno:bnoVal},
			    
			    function(result){ 
			      console.log("RESULT: " + result);
			      var str = "";
			      $("#addReply").html(str);
			      $("#replyBtn").show();
			      showList(-1);
			    }
			);
	}
	
	function  showList(page) {
		
		console.log("show list 도큐먼트 레디 " + page);
		
		replyService.getList({bno : bnoValue, page : page || 1 }, function(replyCnt, list) {
			
			console.log("replyCnt : " + replyCnt);

			if (page == -1) {
				pageNum = Math.ceil(replyCnt / 10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
		
			if (list == null || list.length == 0) {
				//replyUL.html("");
				
				return;
			}
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				 str +="  <div><div class='header'><strong class='primary-font'>["
					   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
				str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replydate) + "</small></div>";
				str += "<p>" + list[i].reply + "</p></div></li>";
				str += "<hr />";
			}
			
			replyUL.html(str);
			showReplyPage(replyCnt);
		});
	}
		
		
		//댓글 페이징 넣기
	  	 var pageNum = 1;
	     var replyPageFooter = $(".panel-footer");
	     
	     function showReplyPage(replyCnt){
	       
	       var endNum = Math.ceil(pageNum / 10.0) * 10;  
	       var startNum = endNum - 9; 
	       
	       var prev = startNum != 1;
	       var next = false;
	       
	       if(endNum * 10 >= replyCnt){
	         endNum = Math.ceil(replyCnt/10.0);
	       }
	       
	       if(endNum * 10 < replyCnt){
	         next = true;
	       }
	       
	       var str = "<ul class='pagination pull-right'>";
	       
	       if(prev){
	         str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	       }
	       
	       for(var i = startNum ; i <= endNum; i++){
	         
	         var active = pageNum == i? "active":"";
	         
	         str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	       }
	       
	       if(next){
	         str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	       }
	       
	       str += "</ul></div>";
	       
	       console.log(str);
	       
	       replyPageFooter.html(str);
	     }
	      
	  	replyPageFooter.on("click", "li a", function(e) {
	  		e.preventDefault();
	  		
	  		console.log("댓글 페이징 버튼 클릭!");
	  		
	  		var targetPageNum = $(this).attr("href");
	  		
	  		console.log("targetPageNum : " + targetPageNum);
	  		
	  		pageNum = targetPageNum;
	  		
	  		showList(pageNum);
	  	
	  	});
		
		
				
	
</script>

