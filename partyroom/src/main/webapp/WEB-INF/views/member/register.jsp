<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Member Register</h1>
	</div>
</div>

<div class="container">
   <div class="row">
   <div class="col-md-3"></div> 
   <div class="col-md-6">
      <h4 style="text-align : center;"><strong>회원가입</strong></h4>      
      <form method="POST" id="form">
         <div class="form-group">
            <label for="text"><strong>아이디</strong></label>
            <input id="m_id" type="text" class="form-control" name="m_id" placeholder="이메일을 입력해주세요.">
         </div>
         
         <div class="form-group">
            <button type="button" class="btn btn-outline-secondary btn-block" onclick="idCheck(this.form)" ><strong>아이디 중복확인</strong></button>
         </div>
                  
         <div class="form-group">
            <label for="password" id="pwdCheck"><strong>비밀번호</strong></label>
            <p id="pwdCheckInput"></p>
            <input id="m_pwd" type="password" class="form-control" name="m_pwd" onkeyup="pwdCheck(this.form)" placeholder="비밀번호를 8~16자리로 설정해주세요.">
         </div>
         
           <div class="form-group">
            <label for="password" id="pwdCheck2"><strong>비밀번호 확인</strong></label>
            <input id="m_pwd2" type="password" class="form-control" name="m_pwd2" onkeyup="pwdCheck(this.form)" placeholder="비밀번호를 8~16자리로 설정해주세요.">
         </div>
         
         
         <div class="form-group m-0">
            <button type="button" class="btn btn-outline-secondary btn-block" onclick="register(this.form)"><strong>회원가입</strong></button>
         </div>
         <div class="mt-4 text-center">
           <strong> 사이트 회원이십니까?</strong> <a href="../../loginMember.do"><strong>로그인</strong></a>
         </div>
      </form>
   </div>
   <div class="col-md-3"></div> 
   </div>
</div>