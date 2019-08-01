<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >회원 탈퇴</p>
		
		
		
		<a class="nav-link" data-toggle="modal" href="#deleteMember">회원 탈퇴</a>
	
	
<!-- 회원 탈퇴 모달 -->	
<div class="modal fade" id="deleteMember" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>회원 탈퇴</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form method="post" id="deleteForm" action="/member/deleteMember">
					<input type="hidden" name="email" id="email" value="${member.email }" />
					
					<input type="password" name="password" id="password" class="form-control my-2"
					 placeholder="기존 비밀번호" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					
					<input type="password" name="passwordChk" id="passwordChk" class="form-control my-2"
					 placeholder="비밀번호 확인" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="removeMemberBtn"
					class="btn btn-block form-control" value="회원 탈퇴">
				</form>
				<hr>
			</div>
		</div>
	</div>
</div>
<!-- 비밀번호 수정 모달  끝-->	
				
<script>
	$(document).ready(function(e) {
		
		$("#removeMemberBtn").on("click", function(e) {
			
		
		var email = $("#email").val();
		var password = $("#password").val();
		var passwordChk = $("#passwordChk").val();
		
		console.log(email);
		console.log(password);
		console.log(passwordChk);
		
		//var params = $("#ModifyPasswordForm").serialize();
		
		var params = {
				email : email,
				password : password
		}
		
		console.log(params);
		
		 $.ajax({
			method : 'post',
			dataType : 'json', 
			data : params,
			url : "/member/modifyPassword",
			success : function(data) {
				if (data.cnt == 0) {
					alert("기존 비밀번호를 잘못 입력하셨습니다.");
					$("#password").val("");
					$("#password").focus();
					return false;
				} else if (password != passwordChk) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#password").val("");
					$("#passwordChk").val("");
					$("#password").focus();
					return false;
				}
				alert("그동안 사이트를 이용해주셔서 감사합니다.");
					
				 $("#deleteForm").submit(); 
				
			} 
			
		
		});
		
	});
});
</script>