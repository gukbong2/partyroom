<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<br /><br /><br /><br /><br />

    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form method="POST" id="customLoginForm" action="/member/loginInterceptor">
					<input type="text" name="email" id="customLoginEmail" class="form-control my-2" placeholder="이메일" 
					onKeyPress="if (event.keyCode==13){enterCustomLogin()}"> 
					
					<input type="password" name="password" id="customLoginPassword" class="form-control my-2"
					 placeholder="비밀번호" onKeyPress="if (event.keyCode==13){enterCustomLogin()}">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="customMemberLoginBtn"
					class="btn btn-block form-control" value="로그인">
					
					
				</form>
            	
					<a data-toggle="modal" data-dismiss="modal" href="#login"
						data-target="#register">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</a>
					<a data-toggle="modal" data-dismiss="modal" href="#findPW"
					data-target="#findPW">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾기</a><br>	
        </div><!-- /card-container -->
    </div><!-- /container -->
    
<script>
    $("#customMemberLoginBtn").on("click", function() {
 			var exptest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 			
 			var customLoginEmail = $("#customLoginEmail").val();
			var customLoginPassword = $("#customLoginPassword").val();
			var customEmailCheckVal = $("#customLoginEmail").val();
			
			var params = {
					email : customLoginEmail,
					password : customLoginPassword
			}
			
			console.log(params);
			
			$.ajax({
				method : 'post',
				dataType : 'json', 
				data : params,
				url : "/member/modifyPassword",
				success : function(data) {
					if (data.cnt == 0) {
						alert("아이디 혹은 비밀번호를 잘못 입력하셨습니다. 다시 시도해주세요.");
						$("#customLoginEmail").val("");
						$("#customLoginPassword").val("");
						$("#customLoginEmail").focus();
						return false;
					}  else if (customEmailCheckVal == null || customEmailCheckVal == "") {
						alert("이메일을 입력해주세요.");
						$("#customLoginEmail").focus();
						return false;
						
					}  else if (customLoginPassword == null || customLoginPassword == "") {
						alert("비밀번호를 입력해주세요");
						$("#customLoginPassword").focus();
						return false;
					}  else if (exptest.test(customLoginEmail)==false) {
						alert("이메일형식이 올바르지 않습니다.");
						$("#customLoginEmail").val("");
						$("#customLoginEmail").focus();
						return false;
					}  
					
			
					$("#customLoginForm").submit();
		 			}
				});
			
    });
    
    function enterCustomLogin() {
			$("#customMemberLoginBtn").click();
		}
    
</script>
<%@include file="../includes/footer.jsp"%>