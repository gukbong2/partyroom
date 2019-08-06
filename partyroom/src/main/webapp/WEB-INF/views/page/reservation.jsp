<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@include file="../includes/header.jsp"%>


<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >예약하기</p>
	
<div>
	<button  id="reservBtn" onclick="getPage('address','window_name',
			'width=430,height=300,location=no,status=no,scrollbars=yes');">button</button>
</div>

<script>

function getPage() {
	location.href = "/reserv/reservPage";
}
</script>