<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>




<script>
$(document).ready(function(){
	
	$("#map").hide();
	
	$('.image-slide').slick({
		autoplay : true, //자동재생
		dots: false, //이미지 밑에 점
		speed : 500 , // 이미지가 슬라이딩시 걸리는 시간 
		infinite: true, //무한반복
		autoplaySpeed: 1000,  //이미지가 다른 이미지로 넘어 갈때의 텀 
		arrows: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		fade: false
	});
	
	$("#mapBtn").on("click", function() {
		console.log("맵버튼누름");
		
		   var con = document.getElementById("map");
		    if(con.style.display=='none'){
		        con.style.display = 'block';
		    }else{
		        con.style.display = 'none';
		    }
		});
	
	$("#reservPageBtn").on("click", function() {
		console.log("리저브페이지버튼 누름");
	
	});
	
	
});
</script>



	<!-- 이미지 슬라이드  -->	
 <div class="image-slide">
	  <div><img src="/resources/image/home3.jpg" alt="home3" class="images" style="width:100%"/></div>
	  <div><img src="/resources/image/home4.jpg" alt="home4" class="images" style="width:100%"/></div>
	  <div><img src="/resources/image/home5.jpg" alt="home5" class="images" style="width:100%"/></div>
	  <div><img src="/resources/image/home7.jpg" alt="home7" class="images" style="width:90%"/></div>
 </div>	
		
		
	<div class="jumbotron jumbotron-fluid">
		<div>
			
			<div>
				<h5  style="text-align: center;">숙소 예약하러가기</h5>
				<a href="/page/reservation">
				<button type="button" class="btn btn-primary" id="reservPageBtn">예약하러가기</button>
			 	</a>
			</div>
		</div>
	</div>

		
		
		
	<!-- 지도 -->	
	<button class="btn btn-lg btn-block fun py-3" id="mapBtn" onclick="setZoomable(false)">게스트하우스 찾아오는 법</button>
	<div id="map">
	</div>
 
  






<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ebce737ee3dff4cd2887f0369ec5b64"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.533873, 126.993767), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
{
    title: '이태원 1호점', 
    latlng: new kakao.maps.LatLng(37.533036, 126.993197)
}
];
//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
for (var i = 0; i < positions.length; i ++) {
// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 
// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}
function setZoomable(zoomable) {
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(zoomable);    
}
</script>


<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>