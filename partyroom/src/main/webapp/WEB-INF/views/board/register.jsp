<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/headerForBoard.jsp"%>
<style>
body {margin:2rem;}

.form-rounded {
border-radius: 1rem;
}
</style>
<title>글쓰기</title>

	
</head>
<body>
<br /><br /><br />
<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" > 문의글 작성</p> 

<%-- <div class="container"style="width: 60%; margin: auto;">
  
  
  <br />
	<form method="post" action="/board/register" id="boardRegisterForm">
		<!-- 로그인 만든 후 작성자는 hidden 처리 -->
		<input type="text" name="title" id="title" class="form-control form-rounded" placeholder="제목">
		<input type="hidden" name="writer" id="writer" value="${member.name }"/>
		<input type="hidden" name="email" id="email"value="${member.email }"/><br />
		<textarea class="form-control form-rounded" rows="3" name="content" id="content" placeholder="문의 내용을 입력해주세요."></textarea>
		<button id="subBtn" class="btn btn-secondary" style="right;">글 작성</button>
	</form>
</div> --%>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading"></div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/board/register" method="post">
          <div class="form-group">
            <label>Title</label> <input class="form-control form-rounded"  name='title'>
          </div>

          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control form-rounded"  rows="3" name='content'></textarea>
          </div>

         	
          <div class="form-group">
          <input type="hidden" id="writer" name='writer' value="${member.name }">
          <input type="hidden" name="email" id="email"value="${member.email }"/><br />
          </div>	
          
          <button type="submit" class="btn btn-default">
          	Submit Button
          </button>
          
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>

</body>



<script>

$(document).ready(function() {
	  
		$("subBtn").on("click", function() {
			
			console.log("click");
			var title = $("#title").val();
			console.log(title);

			var content = $("#content").val();
			console.log(content);
			var name = $("#name").val();
			console.log(name);
			
			$("#boardRegisterForm").submit();
		});	
	
	
	});	

</script>

