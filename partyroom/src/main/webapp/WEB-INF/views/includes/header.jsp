<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>


    <title>게하</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
    
   <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
    
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    
    
    
    
    <!-- 써머노트 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<script src="/resources/js/summernote-ko-KR.js"></script>
	
	<!-- member.js 시작 -->
	<script type="text/javascript" src="/resources/js/member.js"></script>
	
</head>

<style>

.nav-item {
	font-weight: 800;
	font-size: 20px;
	color: #668;
}

.pagination {
   justify-content: center;
}

</style>




<body>
    <!-- header -->
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light  static-top" >
		<div class="container-fluid">
			<a class="navbar-brand" href="/page/home">
				 <img src="/resources/image/logo.jpg" width="80px" height="100px"> 
			</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/page/gallery">갤러리</a></li>
				<li class="nav-item"><a class="nav-link" href="/page/guide">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="/page/reservation">예약하기</a></li>
				<li class="nav-item"><a class="nav-link" href="/board/list">문의게시판</a></li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${member.name eq null }">
						<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#register">회원가입</a></li>
					</c:when>
					
					<c:otherwise>
					<li class="nav-item dropdown">
			        	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
			        	  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          		${member.name }&nbsp;님
			        	</a>
			          <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
			            <a class="dropdown-item" href="/member/info">회원 정보 관리</a>
			            <a class="dropdown-item" href="#">내 예약</a>
			           
			           <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#" onclick="logout()">로그아웃</a> 
			           
			          </div>
			        </li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
	</div>
</nav>

<!-- 로그인 모달 -->
<div class="modal fade" id="login" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>로그인</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form method="POST" id="loginForm" action="/member/login">
					<input type="text" name="email" id="LoginEmail" class="form-control my-2" placeholder="이메일" 
					onKeyPress="if (event.keyCode==13){enterLogin()}"> 
					
					<input type="password" name="password" id="LoginPassword" class="form-control my-2"
					 placeholder="비밀번호" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="memberLoginBtn"
					class="btn btn-block form-control" value="로그인">
					
					
				</form>
				<hr>

				<form style="text-align: center;">
					<!-- 소셜 로그인 추후 -->	
					<a href="/social/login"><img src="/resources/image/naverlogo.PNG" alt="" width="80px;" /></a>
					<a href="/social/login"><img src="/resources/image/kakaologo.png" alt="" width="80px;" /></a>
				</form>
				<hr>

				<div class="text-center">
					<a data-toggle="modal" data-dismiss="modal" href="#findPW"
					data-target="#findPW">비밀번호 찾기</a><br>
					<a data-toggle="modal" data-dismiss="modal" href="#register"
						data-target="#register">회원가입</a>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- 로그인 모달 -->

<!-- 회원가입 모달 -->
<div class="modal fade" id="register" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>회원가입</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div> 
			
			<div class="modal-body center">
				<form method="post" id="registerForm" action="/member/register">
					<input type="text" name="email" id="RegisterEmail" class="form-control my-2" 
				 	placeholder="이메일" onKeyPress="if (event.keyCode==13){emailChk()}">
					<input type="text" name="emailCheck" id="emailCheck"  class="btn btn-block form-control"
					style="background-color: #0da197; color: white;" value="이메일 중복체크" readonly="readonly"
					onKeyPress="if (event.keyCode==13){emailChk()}"> 
					<input type="text" name="name" id="RegisterName" class="form-control my-2" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" placeholder="성함" > 
					<input type="password" name="password" id="RegisterPassword" class="form-control my-2" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" placeholder="비밀번호">
					<input type="password" name="passwordChk" id="RegisterPasswordCheck" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" class="form-control my-2" placeholder="비밀번호 확인">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="memberRegiBtn"
					class="btn btn-block form-control" value="회원가입" 
					 onKeyPress="if (event.keyCode==13){enterRegister()}">
				</form>
				<hr>

				<form style="text-align: center;">
					<!-- 소셜 로그인 추후 -->	
					
				</form>
				<hr>

				<div class="text-center">
					<a data-toggle="modal" data-dismiss="modal" href="#findPW"
					data-target="#findPW">비밀번호 찾기</a><br>
					<a data-toggle="modal" data-dismiss="modal" href="#login"
						data-target="#login">로그인</a>
				</div>
			</div>
			
			
		</div>
	</div>
</div>    
<!-- 회원가입 모달 끝-->
 
<!-- 비밀번호 모달 -->
<div class="modal fade" id="findPW" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>비밀번호 찾기</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form method="POST" id="findPwForm" action="/member/findPw">
					<input type="text" name="email" id="findPwEmail" class="form-control my-2" placeholder="이메일" > 
					
					<input type="button" style="background-color: #475C7A; color: white;" id="findPwBtn"
					class="btn btn-block form-control" value="비밀번호 찾기">
				</form>
				<hr>

				<div class="text-center">
					<a data-toggle="modal" data-dismiss="modal" href="#login"
						data-target="#login">로그인</a>
					<a data-toggle="modal" data-dismiss="modal" href="#register"
						data-target="#register">회원가입</a>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- 비밀번호 모달 --> 
 
 
 <script>
 		
 		$(document).ready(function() {
 			console.log(memberService);
 			
 			var exptest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 			
 			var emailChk = 0;
 			
 			$("#emailCheck").on("click", function() {
 				console.log("누름");
 				var emailCheckVal = $("#RegisterEmail").val();
 				
 				console.log("emailCheckVal : " + emailCheckVal);
 				
 				memberService.idCheck(emailCheckVal, function(idCheck) {
 					
 					/* oninput처리하던지 뭘 해서 직관적으로 바꾸기 */
 					 if (idCheck == 0 && exptest.test(emailCheckVal)==true) {
 						alert("사용 가능한 이메일입니다.");
 						emailChk = 1;
 						$("#RegisterName").focus();
 						
 					} else if (exptest.test(emailCheckVal)==false) {
 						alert("이메일형식이 올바르지 않습니다.");
 						$("#RegisterEmail").val("");
 						return false;
 					} 
 					 
 					 else {
 						alert("중복된 이메일입니다.");
 						$("#RegisterEmail").val("");
 						return false;
 					} 
 					
 					
 					
 				});
 				
 			});
 		
 		
 			$("#memberRegiBtn").on("click", function() {
 				var registerEmail = $("#RegisterEmail").val();
 				var registerName = $("#RegisterName").val();
 				var registerPassword = $("#RegisterPassword").val();
 				var registerPasswordCheck = $("#RegisterPasswordCheck").val();



 				console.log("누름");
 				
 				/* 모달이던 oninput이던 아무거나 변경 */
 				if (emailChk == 0) {
 	 				console.log("이메일 중복을 확인해주세요");
 	 				return false;
 	 			} if (registerEmail == null || registerEmail == "") {
						alert("이메일을 입력해주세요.");
						return false;
				} else if (registerName == null || registerName == "") {
					alert("성함을 입력해주세요");
					return false;
				} else if (registerPassword == null || registerPassword == "") {
					alert("비밀번호를 입력해주세요");
					return false;
				} else if (registerPassword != registerPasswordCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				} else if (exptest.test(registerEmail)==false) {
						alert("이메일형식이 올바르지 않습니다.");
						$("#RegisterEmail").val("");
						return false;
				} 
 	 				
 	 				
 				$("#registerForm").submit();
 	 				
 	 			
 			
 			});
 		});
 		
 		

 		
 		$("#memberLoginBtn").on("click", function() {
 			var exptest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 			
 			var LoginEmail = $("#LoginEmail").val();
			var LoginPassword = $("#LoginPassword").val();
			var emailCheckVal = $("#LoginEmail").val();
			
			var params = {
					email : LoginEmail,
					password : LoginPassword
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
						$("#LoginEmail").val("");
						$("#LoginPassword").val("");
						$("#LoginPassword").focus();
						return false;
					} else if ( emailCheckVal == null || emailCheckVal == "") {
						alert("이메일을 입력해주세요.");
						$("#LoginEmail").focus();
						return false;
						
					}  else if (LoginPassword == null || LoginPassword == "") {
						alert("비밀번호를 입력해주세요");
						$("#LoginPassword").focus();
						return false;
					}  else if (exptest.test(LoginEmail)==false) {
						alert("이메일형식이 올바르지 않습니다.");
						$("#LoginEmail").val("");
						$("#LoginEmail").focus();
						return false;
					} 
			
					$("#loginForm").submit();
		 			}
				});
 		});	
			
			
			
			
 		function enterLogin() {
 			$("#memberLoginBtn").click();
 		}
 		
 		function enterRegister() {
 			$("#registerBtn").click();
 		}
 		
 		function emailChk() {
 			$("#emailCheck").click();
 		}
 		
 		function logout() {
 			if (confirm("로그 아웃 하시겠습니까?")) {
 				location.href = "/member/logout";
 				return true;
 			} else {
 				return false;
 			}
 		}

 </script>
 
 
 
 
 
 
 
 
 
</body>
</html>


