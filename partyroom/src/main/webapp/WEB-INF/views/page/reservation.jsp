<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@include file="../includes/header.jsp"%>


<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >예약하기</p>
	
<div>
	<button class="btn-btn primary" onclick="showPopup();">예약하기</button>
</div>

<script>



function showPopup() { 
	window.open("/reserv/reservPage", "a", "width=1200, height=800, left=250, top=50"); 
	
	}
</script>