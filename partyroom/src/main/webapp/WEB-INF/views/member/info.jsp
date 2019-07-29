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




