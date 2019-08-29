	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>


    <title>7Hours</title>
    <meta charset="utf-8">
    
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic&display=swap" rel="stylesheet">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
    
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    
    <!-- 써머노트 -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<!-- slick.js -->
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
	
	<!-- fontawesome -->
	 <script src="https://kit.fontawesome.com/8824bffde2.js"></script> 
	
	<!-- member.js 시작 -->
	<script type="text/javascript" src="/resources/js/member.js"></script>
	
</head>

<style>
body, table, div, p{ font-family: 'Nanum Gothic', sans-serif; }

.nav-item {
	font-weight: 800;
	font-size: 20px;
	color: #668;
}

.pagination {
   justify-content: center;
}

 a:link { color: #646464; text-decoration: none;}
 a:visited { color: #646464; text-decoration: none;}
 a:hover { color: #646464; text-decoration: none;}
 a:active {text-decoration:none; color:#646464; }
 
 .dropdown-item a:hover {
	background-color: #646464;
	text-decoration: none;
}
 .dropdown-item a:active {
	background-color: #646464;
	text-decoration: none;
}
 
.dropbtn {
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content2 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-weight: 400;
}

.dropdown-content a:hover {
	background-color: #475C7A;
	color: white;
	font-weight: 400;
}

.dropdown:hover .dropdown-content {
	display: block;
}


 
 
</style>







<body>
    <!-- header -->
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light  fixed-top" >
		<div class="container-fluid">
			<a class="navbar-brand" href="/">
				 <img src="/resources/image/logo.png" width="100px" height="100px"> 
			</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/page/home">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="/page/home" id="book">예약하기</a></li>
					<li class="nav-item"><a class="nav-link" href="#guide">소개</a></li>
				<li class="nav-item"><a class="nav-link" href="/page/home">서비스</a></li>
				<li class="nav-item"><a class="nav-link" href="/page/home">찾아 오는 길</a></li>
				 <li class="nav-item">
					<div class="dropdown">
						<a class="nav-link dropbtn" href="#">게시판</a>
						<div class="dropdown-content">
								<a href="/board/list" style="font-size : 0.9em;">문의게시판</a>
								<a href="/board/gallery" style="font-size : 0.9em;">갤러리</a>
						</div>
					</div>
				</li>
				
			</ul>

			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${member.name eq null }">
						<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#register">회원가입</a></li>
					</c:when>
					
					<c:otherwise>
					 <li class="nav-item">
					<div class="dropdown">
						<a class="nav-link dropbtn" href="#">${member.name } ${naverName }&nbsp;님</a>
						<div class="dropdown-content">
						<%-- <c:if test="${member.type eq 'site' }">
						</c:if> --%>
								<a href="/member/profile" style="font-size : 0.9em;">회원 정보 수정</a>
								<a href="#" onclick="logout()" style="font-size : 0.9em;">로그아웃</a> 
						</div>
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
					<!-- 네이버 -->
				   <a href="${urlboard}" id="naverBtn"><img src="/resources/image/naverlogo.PNG" alt="" width="80px;" /></a>
					<!-- 카카오 -->
					<a href="javascript:loginWithKakao()"><img src="/resources/image/kakaologo.png" alt="" width="80px;" /></a>
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
				<form method="POST" id="findPwForm" action="/member/findPassword">
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
					
					<input type="password" name="password" id="RegisterPassword" class="form-control my-2" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" placeholder="비밀번호">
					
					<input type="password" name="passwordChk" id="RegisterPasswordCheck" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" class="form-control my-2" placeholder="비밀번호 확인">
					
					<input type="text" name="name" id="RegisterName" class="form-control my-2" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" placeholder="성함" > 
					
					<!-- <input type="text" name="phone" id="RegisterPhone" class="form-control my-2" 
					onKeyPress="if (event.keyCode==13){phoneChk()}" placeholder="핸드폰 번호" maxlength="11" > 
					
					<div>
						<input type="text" name="phoneCheckBtn" id="phoneCheckBtn"  class="btn btn-block form-control"
						style="background-color: #0da197; color: white;" value="핸드폰 본인 인증" readonly="readonly"
						onKeyPress="if (event.keyCode==13){phoneChk() return false;}"> 
						
						<input type="text"  id="RegisterPhoneCheck" class="form-control my-2" 
						onKeyPress="if (event.keyCode==13){enterRegister() return false;}"placeholder="핸드폰인증번호를 입력하세요." />
					</div> -->
					
					<input type="button" style="background-color: #475C7A; color: white;" id="memberRegiBtn"
					class="btn btn-block form-control" value="회원가입" 
					 onKeyPress="if (event.keyCode==13){enterRegister()}">
				</form>
				<hr>

				<form style="text-align: center;">
					<!-- 네이버 -->
				   <a href="${url}" id="naverBtn"><img src="/resources/image/naverlogo.PNG" alt="" width="80px;" /></a>
					<!-- 카카오 -->
					<a href="javascript:loginWithKakao()"><img src="/resources/image/kakaologo.png" alt="" width="80px;" /></a>
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
 
<!-- api 히든 폼 --> 
<form action="/social/insert" name="socialInsertForm" method="post">
	<input type="hidden" name="email" value="">
    <input type="hidden" name="api_id" value=""> 
	<input type="hidden" name="name" value="">
	<input type="hidden" name="type" value="">
</form>

<form action="/social/update" name="socialUpdateForm" method="post">
	<input type="hidden" name="email" value="">
	<input type="hidden" name="api_id" value="">
	<input type="hidden" name="name" value="">
	<input type="hidden" name="type" value="">
</form>
<!-- api 히든 폼 끝 -->
 
 
 <script>
 		
 		$(document).ready(function() {
 			console.log(memberService);
 			
 			$("#book").on("click", function() {
 				
 				window.open("/reserv/reservPage", "a", "width=1200, height=800, left=280, top=50"); 
 				

 			});
 			
 			
 			var exptest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 			
 			var emailChk = 0;
 			var phoneChk = 0;
 			
 			//email체크
 			$("#findPwBtn").on("click", function() {
 				var emailCheckVal = $("#findPwEmail").val();
 				console.log(emailCheckVal);
 			
			memberService.idCheck(emailCheckVal, function(idCheck) {
				if (exptest.test(emailCheckVal)==false) {
					alert("부적합한 이메일 형식 입니다.");
					$("#findPwEmail").val("");
					$("#findPwEmail").focus();
					return false;
				} else if (idCheck == 0 || idCheck == null) {
					alert("가입하지 않은 이메일입니다. 다시 확인해주세요.");
					$("#findPwEmail").val("");
					$("#findPwEmail").focus();
					return false;
				} else {
					alert("비밀번호 찾기 이메일을 전송 중입니다. 이메일을 확인해주세요.");
					$("#findPwForm").submit();
				}
				
				
			});
 				
		});
 			
 			
 							
 			//이메일 중복확인을 누르면
 			$("#emailCheck").on("click", function() {
 				console.log("누름");
 				var emailCheckVal = $("#RegisterEmail").val();
 				
 				console.log("emailCheckVal : " + emailCheckVal);
 				
 				memberService.idCheck(emailCheckVal, function(idCheck) {
 					
 					/* oninput처리하던지 뭘 해서 직관적으로 바꾸기 */
 					 if (idCheck == 0 && exptest.test(emailCheckVal)==true) {
 						alert("사용 가능한 이메일입니다.");
 						emailChk = 1;
 						$("#RegisterPassword").focus();
 						
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
 			
 			
 			//회원가입 버튼을 누르면
 			$("#memberRegiBtn").on("click", function() {
 				var registerEmail = $("#RegisterEmail").val();
 				var registerName = $("#RegisterName").val();
 				var registerPassword = $("#RegisterPassword").val();
 				var registerPasswordCheck = $("#RegisterPasswordCheck").val();
 				//var RegisterPhoneCheck = $("#RegisterPhoneCheck").val();
				//var PhoneAuthKey = "${message.authkey}";
				//console.log(PhoneAuthKey);

 				console.log("누름");
 				
 				/* 모달이던 oninput이던 아무거나 변경 */
 				if (emailChk == 0) {
 	 				console.log("이메일 중복을 확인해주세요");
 	 				return false;
 	 			} else if (registerEmail == null || registerEmail == "") {
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
				} /* else if (RegisterPhoneCheck != PhoneAuthKey) {
					alert("인증번호가 일치하지 않습니다.");
				} else if (RegisterPhoneCheck == PhoneAuthKey) {
					phoneChk = 1;
				} */
 	 				
 	 			alert("가입이 완료되었습니다. 이메일 인증을 완료되어야 사이트 이용이 가능합니다.");
 				$("#registerForm").submit();
 	 				
 	 			
 			
 			});
 		});
 		
 		
 		//핸드폰 문자전송 버튼을 누르면 일단 member테이블에 핸드폰 중복조회를 한 후, data.cnt == 0 이면 문자 전송
/* 		$("#phoneCheckBtn").on("click", function() {
//			var phone = $("#RegisterPhone").val();
			var phone = $("#RegisterPhone").serialize();
			console.log(phone);
			
			$.ajax({
				method : 'post',
				dataType : 'json',
				data : phone,
				url : '/member/phoneCheck',
				success : function(data) {
					if(data.cnt == 1) {
						alert("가입한 회원입니다. 로그인해주세요.");
						//여기를 모달 #login으로 변경
						
					} else if (data.cnt == 0) {
						console.log(data.cnt);
					
						alert("인증문자 발송 성공!");
						console.log("인증문자 발송 성공!");
							//이것도 restapi로 하지말고 그냥 ajax로 모달안꺼지게 바로 나오게 ㄱ 
						$.ajax({
							method : 'post',
							dataType : 'json',
							data : phone,
							url : '/check/phone/' + phone,
							success : function() {
								
							}
						
						
						
						});
						
					}
				}
			
			
			});
		}); 		 */
	
 		//로그인 버튼 클릭 시
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
			
			
			
		//로그인 모달에서 입력하고 엔터치면 로그인 버튼 클릭
 		function enterLogin() {
 			$("#memberLoginBtn").click();
 		}
 		
		//회원가입 모달에서 입력하고 엔터치면 회원가입 버튼 클릭
 		function enterRegister() {
 			$("#memberRegiBtn").click();
 		}
 		
		//회원가입 모달 - 이메일 입력 부분에서 엔터치면 이메일 중복확인 버튼 클릭
 		function emailChk() {
 			$("#emailCheck").click();
 		}
 		
		//회원가입 모달 - 핸드폰 입력 부분에서 엔터치면 핸드폰 문자전송 버튼 클릭
 		function phoneChk() {
 			$("#phoneCheckBtn").click();
 		}
 		
		//로그아웃 클릭 시 이동
 		function logout() {
 			if (confirm("로그 아웃 하시겠습니까?")) {
 				location.href = "/member/logout";
 				return true;
 			} else {
 				return false;
 			}
 		}

 </script>
 
<!-- 카카오 로그인 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('3c2b575265288831f680b032fa87f3d1'); /* 클라이언트 id 숨겨두기 */
	// 카카오 로그인 버튼을 생성합니다.
	function loginWithKakao() {
		Kakao.Auth.login({
			success : function(authObj) {
				/* alert(JSON.stringify(authObj)); */

				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						console.log(res);
						console.log(res.id);
						var params = {
								'api_id' : res.id,
								'email' : res.kaccount_email,
								'name' : res.properties['nickname'],
								'type' : 'kakao'
						}
						
						console.log(params);
						
					 	$.ajax({
							url : "/social/count",
							type : 'post',
							data : params,
							dataType : 'json',
							success : function(data) {
								console.log("data.cnt : " + data.cnt);
								if(data.cnt == 0) {
									
									var insertForm = document.socialInsertForm;
									console.log("insertForm : " + insertForm);
									insertForm.email.value = res.kaccount_email;
									insertForm.name.value = res.properties['nickname'];
									insertForm.api_id.value = res.id;
									insertForm.type.value = 'kakao';
									
									insertForm.submit();
									
									
								} else if (data.cnt >= 1) {
									console.log("data.cnt : " + data.cnt);
									
									var updateForm = document.socialUpdateForm;
									console.log("updateform : " + updateForm);
									updateForm.email.value = res.kaccount_email;
									updateForm.name.value = res.properties['nickname'];
									updateForm.api_id.value = res.id;
									updateForm.type.value = 'kakao';
									
									updateForm.submit();
									
								}
								
							}, 
							error : function(jqXHR, textStatus, errorThrown) {
								alert("에러 발생 : " + jqXHR.status + "에러임");
							}
						}); 

					}
				})
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	}; /* 카카오 로그인 끝 */
</script>



 <!-- 네이버 로그인 시작-->

<script>
	$("#naverBtn").on("click", function() {
		
		console.log("클릭됨");
		
		
	});
	
	
</script>


 
 
 
 



