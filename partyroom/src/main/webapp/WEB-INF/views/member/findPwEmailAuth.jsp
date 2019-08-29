<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<br /><br /><br /><br /><br />
<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >비밀번호 찾기</p>

	
	<div style="width : 30%; margin-left: auto; margin-right: auto;">
		<form method="POST" id="resetPwForm" action="/member/resetPassword">
			<input type="password" name="modifyPassword" id="modifyPassword" class="form-control my-2" placeholder="비밀번호 변경" > 
			<input type="password" name="modifyPasswordChk" id="modifyPasswordChk" class="form-control my-2" placeholder="비밀번호 확인" > 
			<input type="hidden" name="email" id="email" value="${member.email }">
			<input type="button" style="background-color: #475C7A; color: white;" id="ModifyPwBtn"
			class="btn btn-block form-control" value="비밀번호 변경">
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#ModifyPwBtn").on("click", function() {
				//비밀번호 체크
				var email = $("#email").val();
				var modifyPassword = $("#modifyPassword").val();
				var modifyPasswordChk = $("#modifyPasswordChk").val();
				
				console.log(email);
				console.log(modifyPassword);
				console.log(modifyPasswordChk);
				
				
				 if (modifyPassword == "" || modifyPassword == null) {
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
				 alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.");
				 $("#resetPwForm").submit();  
				
			});
			
		});
	</script>