<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
include summernote css/js
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
include summernote-ko-KR -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script> 

<%@include file="../includes/header.jsp"%>

<title>글쓰기</title>

	
</head>
<body>

<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
color: white; text-align: center;" > 문의글 작성</p>
<!-- 나중에 깔끔하게 수정해야함 -->
<div style="width: 80%; margin-left: auto; margin-right: auto;">
	<form method="post">
		<p>글쓴이 :: ${board.writer }</p>
		<hr>
		<p>${board.title }</p>
		<hr>
		<p>${board.content }</p>
		<input id="subBtn" type="button" value="글 수정" style="float: right;" onclick="modify(this.form)"/> 
		<input id="RemoveBtn" type="button" value="글 삭제" style="float: right;" onclick="delete(this.form)"/> 
		
	</form>
</div>



</body>
</html>