<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>       
body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.btn btn-warning{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}

.btn btn-danger{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}

.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
</style>


<br /><br /><br /><br /><br />
<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >회원 정보 수정</p>

		<div class="container emp-profile">
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        ${member.name } 님
                                    </h5>
                                    <h6>
                                        ${member.email }
                                    </h6>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">프로필</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">최근 예약 정보</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                   <!--  <div class="col-md-2">
                        <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                    </div> -->
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                             <span>
                             <c:if test="${member.type eq 'site' }">
                             <a class="btn btn-warning"data-toggle="modal" href="#memberUpdate"  id="memberModifyBtn">회원 정보 수정</a>
                             <a class="btn btn-info"data-toggle="modal" href="#modifyPwd"  id="memberModifyPasswordBtn">비밀번호 변경</a>
                             </c:if>
                             <a class="btn btn-danger" data-toggle="modal" href="#memberDelete" id="memberRemoveBtn">회원 탈퇴</a>
                             </span>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>이메일</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${member.email }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>이름</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${member.name }</p>
                                            </div>
                                        </div>
                                        <c:if test="${member.type eq 'site' }">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>주소</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${member.address }</p>
                                                <p>${member.addressDetail }</p>
                                            </div>
                                        </div>
                                       
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>연락처</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>123 456 7890</p>
                                            </div>
                                        </div>
                                         </c:if>
                                       
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>예약번호</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${reserv.reserv_idx }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>체크인</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>${reserv.start_date }</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>체크아웃</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>230</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>여성 인원 / 남성 인원 </label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Expert</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>결제금액</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>6 months</p>
                                            </div>
                                        </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Your Bio</label><br/>
                                        <p>Your detail description</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>

<!-- 회원정보 수정 
<div class="modal fade" id="memberUpdate" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>회원 정보 수정</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form method="post" id="registerForm" action="/member/register">
					
					<input type="password" name="password" id="UpdatePassword" class="form-control my-2" 
					placeholder="비밀번호">
					
					<input type="password" name="passwordChk" id="UpdatePasswordCheck" 
					class="form-control my-2" placeholder="비밀번호 확인">
					
					<input type="text" name="firstname" id="UpdateFirstName" class="form-control my-2" 
					 placeholder="성" > 
					
					<input type="text" name="lastname" id="UpdateLastName" class="form-control my-2" 
					placeholder="이름" > 
					
					<input type="button" name="addressSearch" id="addressSearch"  class="btn btn-block form-control"
					style="background-color: #0da197; color: white;" value="주소 검색" readonly="readonly" onclick="goPopup();"> 
					
					
					<input type="text" name="address" id="UpdateRoadAddrPart1" class="form-control my-2" 
					onKeyPress="if (event.keyCode==13){enterRegister()}" placeholder="주소"  readonly="readonly"> 
					
					<input type="text" id="addrDetail" class="form-control my-2" name="UpdateAddressDetail" placeholder="상세주소">

				
					
					
					<input type="hidden" name="name" id="RegisterName"> 
					<input type="hidden" name="type" id="type"> 
					
					<input type="submit" style="background-color: #475C7A; color: white;" id="memberRegiBtn"
					class="btn btn-block form-control" value="회원가입">
				</form>
				<hr>

				<hr>

			</div>
		</div>
	</div>
</div>-->

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
				<form method="POST" id="ModifyMemberModifyPasswordForm" action="/member/updatePassword">
					<input type="hidden" name="email" id="ModifyMemberemail" value="${member.email }" />
					
					<input type="password" name="password" id="ModifyMemberpassword" class="form-control my-2"
					 placeholder="기존 비밀번호" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="password" name="modifyPassword" id="ModifyMembermodifyPassword" class="form-control my-2"
					 placeholder="변경할 비밀번호" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="password" name="modifyPasswordChk" id="ModifyMembermodifyPasswordChk" class="form-control my-2"
					 placeholder="변경할 비밀번호 확인" onKeyPress="if (event.keyCode==13){enterLogin()}">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="modifyPasswordBtn"
					class="btn btn-block form-control" value="비밀번호 변경">
				</form>
				<hr>
			</div>
		</div>
	</div>
</div>

<!-- 회원 탈퇴 모달 -->	
<div class="modal fade" id="memberDelete" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel"><strong>회원 탈퇴</strong></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body center">
				<form method="post" id="DeleteMemberdeleteForm" action="/member/deleteMember">
					<input type="hidden" name="email" id="DeleteMemberemail" value="${member.email }" />
					
					<input type="password" name="password" id="DeleteMemberpassword" class="form-control my-2"
					 placeholder="기존 비밀번호">
					
					
					<input type="password" name="passwordChk" id="DeleteMemberpasswordChk" class="form-control my-2"
					 placeholder="비밀번호 확인">
					
					<input type="button" style="background-color: #475C7A; color: white;" id="removeMemberBtn"
					class="btn btn-block form-control" value="회원 탈퇴">
				</form>
				<hr>
			</div>
		</div>
	</div>
</div>

<!-- 회원탈퇴 -->        
<script>
	$(document).ready(function(e) {
		
		$("#removeMemberBtn").on("click", function(e) {
			
		
		var DeleteMemberemail = $("#DeleteMemberemail").val();
		var DeleteMemberpassword = $("#DeleteMemberpassword").val();
		var DeleteMemberpasswordChk = $("#DeleteMemberpasswordChk").val();
		
		console.log(DeleteMemberemail);
		console.log(DeleteMemberpassword);
		console.log(DeleteMemberpasswordChk);
		
		//var params = $("#ModifyPasswordForm").serialize();
		
		var params = {
				email : DeleteMemberemail,
				password : DeleteMemberpassword
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
					$("#DeleteMemberpassword").val("");
					$("#DeleteMemberpassword").focus();
					return false;
				} else if (DeleteMemberpassword != DeleteMemberpasswordChk) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#DeleteMemberpassword").val("");
					$("#DeleteMemberpasswordChk").val("");
					$("#DeleteMemberpassword").focus();
					return false;
				}
				alert("그동안 사이트를 이용해주셔서 감사합니다.");
					
				 $("#DeleteMemberdeleteForm").submit(); 
				
			} 
			
		
		});
		
	});
});
</script>


<!-- 비밀번호 변경 -->
<script>
	$(document).ready(function(e) {
		
		$("#modifyPasswordBtn").on("click", function(e) {
			
		//비밀번호 체크
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		
		var ModifyMemberemail = $("#ModifyMemberemail").val();
		var ModifyMemberpassword = $("#ModifyMemberpassword").val();
		var ModifyMembermodifyPassword = $("#ModifyMembermodifyPassword").val();
		var ModifyMembermodifyPasswordChk = $("#ModifyMembermodifyPasswordChk").val();
		
		console.log(ModifyMemberemail);
		console.log(ModifyMemberpassword);
		console.log(ModifyMembermodifyPassword);
		
		//var params = $("#ModifyPasswordForm").serialize();
		
		var params = {
				email : ModifyMemberemail,
				password : ModifyMemberpassword
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
					$("#ModifyMemberpassword").val("");
					$("#ModifyMemberpassword").focus();
					return false;
				} else if (ModifyMembermodifyPassword == "" || ModifyMembermodifyPassword == null) {
					alert("변경할 비밀번호를 입력해주세요");
					$("#ModifyMembermodifyPassword").val("");
					$("#ModifyMembermodifyPassword").focus();
					return false;
				} else if (ModifyMembermodifyPassword != ModifyMembermodifyPasswordChk) {
					alert("변경할 비밀번호가 일치하지 않습니다.");
					$("#ModifyMembermodifyPassword").val("");
					$("#ModifyMembermodifyPasswordChk").val("");
					$("#modifyPassword").focus();
					return false;
				} 
				
				alert("비밀번호가 변경되었습니다. 다시 로그인해주세요.");
				
				$("#ModifyMemberModifyPasswordForm").submit();
				
			}
			
			
		}); 
		
		});
		
	});
</script>
        

        
<%@include file="../includes/footer.jsp"%>        
        
        