<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>

<style>
#kakaoMap { 
width : 1000px; height : 700px; 
margin : auto;
}

.images {
width : 100%;
height : 100%;
margin : auto;
}
</style>



<style>
.slick-slider
{
  position: relative;

  display: block;
  box-sizing: border-box;

  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;

  -webkit-touch-callout: none;
  -khtml-user-select: none;
  -ms-touch-action: pan-y;
  touch-action: pan-y;
  -webkit-tap-highlight-color: transparent;
}

.slick-list
{
  position: relative;

  display: block;
  overflow: hidden;

  margin: 0;
  padding: 0;
}
.slick-list:focus
{
  outline: none;
}
.slick-list.dragging
{
  cursor: pointer;
  cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list
{
  -webkit-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}

.slick-track
{
  position: relative;
  top: 0;
  left: 0;

  display: block;
}
.slick-track:before,
.slick-track:after
{
  display: table;

  content: &#39;&#39;;
}
.slick-track:after
{
  clear: both;
}
.slick-loading .slick-track
{
  visibility: hidden;
}

.slick-slide
{
  display: none;
  float: left;
  position: relative;
  height: 100%;
  min-height: 1px;
}
[dir=&#39;rtl&#39;] .slick-slide
{
  float: right;
}
.slick-slide img
{
  display: block;
}
.slick-slide.slick-loading img
{
  display: none;
}
.slick-slide.dragging img
{
  pointer-events: none;
}
.slick-initialized .slick-slide
{
  display: block;
}
.slick-loading .slick-slide
{
  visibility: hidden;
}
.slick-vertical .slick-slide
{
  display: block;

  height: auto;

  border: 1px solid transparent;
}
.slick-arrow.slick-hidden {
  display: none;
}
.slick-slider img { /* keep images full screen */
  width: 100%;
}

.chevron-container { /* full slider height container for chevrons */
  height: 100%;
  position: absolute;
  width: 100px;
}

.slick-right { /* keeps right arrow to the right */
  right: 0;
  top: 0;
}

.chevron-container > .fa { /* positions chevrons in vertical center */
  bottom: 0;
  color: white;
  font-size: 10em;
  height: 1em;
  margin: auto;
  position: absolute;
  top: 0;
  width: 5em;
  z-index: 10;
}

.slick-slider .info {
  color: #e1e1e1;
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  line-height: 100vh;
  text-align: center;
  z-index: 10;
  font-size: 5em;
  font-weight: 900;
}

.slick-slider .info > div {
  display: inline-block !important;
  vertical-align: middle;
}
</style>


 
 <!-- slick 이미지 슬라이드  -->
 <div class="slick-slider">
	  <div>
	   <img src="/resources/image/home3.jpg" alt="home3" class="images" />
	    <div class="info">
	      <p class="slider-subheading lead">
	      	 <strong>7hours에 오신걸 환영합니다.</strong>
	      </p>
	      <p class="down-arrow">
	        <a class="btn btn-large btn-down-arrow" href="#theend">
	          <i class="fa fa-chevron-down fa-lg" aria-hidden="true"></i>
	        </a>
	      </p>
	    </div>
	  </div>
	  
	  <div>
	   <img src="/resources/image/home4.jpg" alt="home4" class="images" />
	    <div class="info">
	      <p class="slider-subheading lead">
	      	<strong>7hours에 오신걸 환영합니다.</strong>
      	</p>
	      <p class="down-arrow">
	        <a class="btn btn-large btn-down-arrow" href="#theend">
	          <i class="fa fa-chevron-down fa-lg" aria-hidden="true"></i>
	        </a>
	      </p>
	    </div>
	  </div>
	  
	  <div>
	   <img src="/resources/image/home5.jpg" alt="home5" class="images" />
	    <div class="info">
	      <p class="slider-subheading lead">
	      	<strong>7hours에 오신걸 환영합니다.</strong>
	      </p>
	      <p class="down-arrow">
	        <a class="btn btn-large btn-down-arrow" href="#theend">
	          <i class="fa fa-chevron-down fa-lg" aria-hidden="true"></i>
	        </a>
	      </p>
	    </div>
	  </div>
</div> 
 <!--slick 이미지 슬라이드 끝  -->
		
<br /><br />
 
 		
<!-- jumbotron -->
<section id="reservation">
	<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: bottom;">
		<div>
			<div>
				<br /><br />	
				<h2 style="text-align: center;"><strong>7Hours 예약하기</strong></h2>
				<button class="btn btn-lg btn-block" style="background-color : #ececec;" onclick="showPopup();">
					<img src="/resources/image/booking.png" alt="" style="width : 150px;" />
					
					<br />
					<br />
					<br />
					<br />
					
				</button>
			</div>
		</div>
	</div>
</section>
		
<!-- jumbotron -->
<section id="guide">
	<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: bottom;">
		<div>
			<div>
				<br /><br />
				<h2 style="text-align: center;"><strong>7hours 사용방법이 궁금하신가요?</strong></h2>
				<button class="btn btn-lg btn-block" style="background-color : #ececec;">
				</button>
			</div>
		</div>
	</div>
</section>

<!-- jumbotron -->
<section>
	<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: bottom;">
		<div>
			<div>
				<h2  style="text-align: center;"><strong>7hours가 여행자들에게  제공하는 7가지</strong></h2>
				<button class="btn btn-lg btn-block" style="background-color : #ececec;">
					<h5>무료 와이파이<i class="fas fa-wifi fa-fw x7"></i></h5><BR>
					<h5>무료 우산 대여<i class="fas fa-umbrella fa-fw x7"></i></h5><br />
					<h5>무료 자전거대여<i class="fas fa-biking fa-fw x7"></i></h5><br>
					<h5 >무료 여행용 짐 보관<i class="fas fa-suitcase-rolling  fa-fw x7"> </i></h5><br />
					<h5>서울 시티 투어맵 증정<i class="fas fa-map fa-fw x7"></i></h5><br />
					<h5>21시부터 맥주 1병 공짜<i class="fas fa-beer fa-fw x7"></i></h5><br>		
					<h5 id="service">아이스크림 2000원 할인<i class="fas fa-ice-cream fa-fw x7"></i></h5><br>
				</button>
				
				
			</div>
		</div>
	</div>
</section>
	
		
		
	<!-- 지도-->
	<section id="map">
	<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: top;">
		<div>
			<div>
				<br /><br />
				<h2  style="text-align: center;"><strong>7hours의 위치를 확인해보세요!</strong></h2>
				<button class="btn btn-lg btn-block" id="mapBtn" onclick="setZoomable(false)" 
				style="background-color : #ececec;">	
					<img src="/resources/image/map.png" alt="" style="width : 150px;" />
				</button>	
				
				
				
				<div id="kakaoMap">
				</div>  
			</div>
		</div>
	</div>
</section>
	
	
 
  	
<script>
jQuery(function($){
	  $('.slick-slider').slick({
	    accessibility: true,
	    adaptiveHeight: true,
	    arrows: true,
	    infinite: true,
	    mobileFirst: true,
	    nextArrow: '<div class="chevron-container slick-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span><span class="sr-only">Next</span></div>',
	    prevArrow: '<div class="chevron-container"><i class="fa fa-chevron-left" aria-hidden="true"></i></span><span class="sr-only">Previous</span></div>',
	    slidesToShow: 1,
	    autoplaySpeed : 1000,
	    speed : 1000,
	    autoplay : true
	  });
	});
</script> 	
  	
<script>
$(document).ready(function(){
	
	$("#kakaoMap").hide();
	
	$("#mapBtn").on("click", function() {
		console.log("맵버튼누름");
		$("#mapBtn").hide();
		   var con = document.getElementById("kakaoMap");
		   console.log(con);
		    if(con.style.display=='none'){
		        con.style.display = 'block';
		    }else{
		        con.style.display = 'none';
		    }
		});
	
	$("#reservBtn").on("click", function() {
		console.log("리저브페이지버튼 누름");
		$("#reservBtn").hide();
		
		var memberChk = "${member.email}";
		
		if (memberChk == "" || memberChk == null) {
			alert("로그인 후 이용해주세요.");
			return false;
		}
		
		location.href = "reserv/reservPage";
	});
	
	
	
});
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c2b575265288831f680b032fa87f3d1"></script>
<script>
	var mapContainer = document.getElementById('kakaoMap'); // 지도를 표시할 div  
	var mapOption = { 
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
	 
	 function showPopup() { 
		//결제 창 열기
		 window.open("/reserv/reservPage", "a", "width=1200, height=800, left=250, top=50"); 
			
	} 
	 
</script>


<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
