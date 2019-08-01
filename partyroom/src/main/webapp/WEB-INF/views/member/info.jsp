<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >회원 정보 관리</p>
<p> 회원 탈퇴, 비밀번호 수정 </p>

<p>이메일 : ${member.email }</p>
<p>성함 : ${member.name }</p>
<p>비밀번호 : ${member.password }</p>
<p>인증 : ${member.auth }</p>

 <a class="nav-link" data-toggle="modal" href="#modifyPwd">비밀번호 수정</a>
 <a class="nav-link" data-toggle="modal" href="#removeMember">비밀번호 탈퇴</a>
	
	
<!-- 비밀번호 수정 모달 -->	
<div class="modal fade" id="modifyPwd" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>비밀번호 수정</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form method="POST" id="ModifyPasswordForm" action="/member/updatePassword">
					<input type="hidden" name="email" id="email" value="${member.email }" />
					
					<input type="password" name="password" id="password" class="form-control my-2"
					 placeholder="기존 비밀번호" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="password" name="modifyPassword" id="modifyPassword" class="form-control my-2"
					 placeholder="변경할 비밀번호" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="password" name="modifyPasswordChk" id="modifyPasswordChk" class="form-control my-2"
					 placeholder="변경할 비밀번호 확인" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="modifyPasswordBtn"
					class="btn btn-block form-control" value="비밀번호 변경">
				</form>
				<hr>
			</div>
		</div>
	</div>
</div>
<!-- 비밀번호 수정 모달  끝-->	
				
<script>
	$(document).ready(function(e) {
		
		$("#modifyPasswordBtn").on("click", function(e) {
			
		//비밀번호 체크
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		
		var email = $("#email").val();
		var password = $("#password").val();
		var modifyPassword = $("#modifyPassword").val();
		var modifyPasswordChk = $("#modifyPasswordChk").val();
		
		console.log(email);
		console.log(password);
		console.log(modifyPassword);
		
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
				} else if (modifyPassword == "" || modifyPassword == null) {
					alert("변경할 비밀번호를 입력해주세요");
					$("#modifyPassword").val("");
					$("#modifyPassword").focus();
					return false;
				} else if (modifyPassword != modifyPasswordChk) {
					alert("변경할 비밀번호가 일치하지 않습니다.");
					$("#modifyPassword").val("");
					$("#modifyPasswordChk").val("");
					$("#modifyPassword").focus();
					return false;
				} 
				
				$("#ModifyPasswordForm").submit();
				
			}
			
			
		}); 
		
		});
		
	});
</script>