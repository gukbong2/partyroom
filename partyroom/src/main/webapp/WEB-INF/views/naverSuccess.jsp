<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>




<script type="text/javascript">
		
		
		
	    var name = ${result}.response.name;
	    var email = ${result}.response.email;
	    var api_id = ${result}.response.id;
		
		 var params = {
				'name' : name,
				'email' : email,
				'api_id' : api_id,
				'type' : 'naver'
		} 
		
		console.log(params); 
		
		
		
		$.ajax({
			
			url : "/social/count",
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				console.log(data);
				console.log("data.cnt : " + data.cnt);
				if(data.cnt == 0) {
					
					var insertForm = document.socialInsertForm;
					console.log("insertForm : " + insertForm);
					insertForm.email.value = email;
					insertForm.name.value = name;
					insertForm.api_id.value = api_id;
					insertForm.type.value = 'naver';
					
					insertForm.submit();
					
					
					
				} else if (data.cnt >= 1) {
					console.log("data.cnt : " + data.cnt);
					
					var updateForm = document.socialUpdateForm;
					console.log("updateform : " + updateForm);
					updateForm.email.value = email;
					updateForm.name.value = name;
					updateForm.api_id.value = api_id;
					updateForm.type.value = 'naver';
					
					updateForm.submit();
					
					
				}
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("에러 발생 : " + jqXHR.status + "에러임");
			}
		});   
</script>

</head>
<body>
	
	
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
	
</body>
</html>
