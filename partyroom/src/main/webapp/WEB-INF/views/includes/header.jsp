<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> 
    
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    
    
    
    
    <!-- 써머노트 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<script src="/resources/js/summernote-ko-KR.js"></script>
</head>

<style>

.nav-item {
	font-weight: 800;
	font-size: 20px;
	color: #668;
}





</style>

<body>
    <!-- header -->
    
    
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light  static-top" >
		<div class="container-fluid">
			<a class="navbar-brand" href="/">
				<img src="/resource/image/logo2.png" width="200px" height="80px">
			</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/info">운영안내</a></li>
				<li class="nav-item"><a class="nav-link" href="/guide">이용안내</a></li>
				<li class="nav-item"><a class="nav-link" href="/booked">예약하기</a></li>
				<li class="nav-item"><a class="nav-link" href="/board/list">문의게시판</a></li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#login">로그인</a></li>

				<li class="nav-item"><a class="nav-link" data-toggle="modal" href="#register">회원가입</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- <p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 2em; background-color: #475C7A;
		color: white; text-align: center;" >
		게시판 적기
</p> -->

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
				<form name="frm" action="#" method="post">
					<input type="text" name="id" class="form-control my-2" placeholder="아이디" id="idInput"> 
					<input type="password" name="password" class="form-control my-2" placeholder="비밀번호">
					
					<input type="button" style="background-color: #475C7A; color: white;" 
					class="btn btn-block form-control" value="로그인" onclick="login()">
				</form>
				<hr>

				<form style="text-align: center;">
					<!-- 소셜 로그인 추후 -->	
				</form>
				<hr>

				<div class="text-center">
					<a href="/member/findId">도움이 필요하십니까?</a><br>
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
				<form name="frm" action="#" method="post">
					<input type="text" name="id" class="form-control my-2" placeholder="아이디" id="idInput"> 
					<input type="password" name="password" class="form-control my-2" placeholder="비밀번호">
					
					<input type="button" style="background-color: #475C7A; color: white;" 
					class="btn btn-block form-control" value="회원가입" onclick="register()">
				</form>
				<hr>

				<form style="text-align: center;">
					<!-- 소셜 로그인 추후 -->	
				</form>
				<hr>

				<div class="text-center">
					<a href="/member/findId">도움이 필요하십니까?</a><br>
					<a data-toggle="modal" data-dismiss="modal" href="#login"
						data-target="#login">로그인</a>
				</div>
			</div>
			
			
		</div>
	</div>
</div>    
 
</body>
</html>


