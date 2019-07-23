<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<title>회원 정보 수정</title>

<p>이메일 : ${member.email }</p>
<p>성함 : ${member.name }</p>
<p>비밀번호 : ${member.password }</p>
<p>인증 : ${member.auth }</p>
