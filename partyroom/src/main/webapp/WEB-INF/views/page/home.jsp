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

.slider-subheading lead {
	font-size: 30em;
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
		
 
 		
<!-- jumbotron -->
<section id="reservation">
	<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: bottom;">
		<div>
			<div>
				<h2 style="text-align: center;"><strong>7Hours 예약하기</strong></h2>
				<c:choose>
				<c:when test="${member.name ne null }">
				<br /><br />
				<button class="btn btn-lg btn-block" style="background-color : #ececec;" id="popupBtn">
					<img src="/resources/image/booking.png" alt="" style="width : 150px;" />
				</button>
				</c:when>

				<c:otherwise>
				<button class="btn btn-lg btn-block" style="background-color : #ececec;" id="notLogined">
					<img src="/resources/image/booking.png" alt="" style="width : 150px;" />
				</button>
				</c:otherwise>				
				</c:choose>
					
					<br />
					<br />
					<br />
					<br />
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
				
				<!--Accordion wrapper-->
<div class="accordion md-accordion accordion-1" id="accordionEx23" role="tablist" style="font-size: 20px; width: 80%; margin-right : auto; margin-left : auto;">
  <div class="card">
    <div class="card-header blue lighten-3 z-depth-1" role="tab" id="heading96">
      <h5 class="text-uppercase mb-0 py-1">
        <a class="white-text font-weight-bold" data-toggle="collapse" href="#collapse96" aria-expanded="true"
          aria-controls="collapse96">
         	1. 7Hours에 오신걸 환영합니다!
        </a>
      </h5>
    </div>
    <div id="collapse96" class="collapse show" role="tabpanel" aria-labelledby="heading96"
      data-parent="#accordionEx23">
      <div class="card-body">
        <div class="row my-4">
          <div class="col-md-8">
            <h2 class="font-weight-bold mb-3 black-text">안녕하세요! 7Hours입니다.</h2>
            <p class="">7Hours를 이용하려면 웹사이트를 통한 페이팔 결제 또는 현장에서 결제를 해야합니다.</p>
            <p class="mb-0">신분을 알 수 있는 여권 또는 ID카드가 필수이고, 미보유 시 체크인 및 결제가 불가처리 되오니</p>
            <p> 손님들께선 이 점 양해부탁드립니다.</p>
            <p> 직원의 안내에 따라 사물함 번호, 신발장 번호를 확인부탁드립니다.</p>
            <p> 또한, 신발장 키를 잃어버리시면 열쇠값 +5000원이 청구됩니다.</p>
          </div>
          <div class="col-md-4 mt-3 pt-2">
            <div class="view z-depth-1">
              <img src="/resources/image/checkin.svg" alt="" class="img-fluid">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header blue lighten-3 z-depth-1" role="tab" id="heading97">
      <h5 class="text-uppercase mb-0 py-1">
        <a class="collapsed font-weight-bold white-text" data-toggle="collapse" href="#collapse97"
          aria-expanded="false" aria-controls="collapse97">
         	2. 짐 보관하는 곳이 어디지?
        </a>
      </h5>
    </div>
    <div id="collapse97" class="collapse" role="tabpanel" aria-labelledby="heading97"
      data-parent="#accordionEx23">
      <div class="card-body">
        <div class="row my-4">
          <div class="col-md-8">
            <h2 class="font-weight-bold mb-3 black-text">7Hours는 사물함 보관층 / 샤워실 / 화장실이 성별별로 분리되어있습니다.</h2>
            <p class="">남성은 5F, 여성은 3F에 사물함 보관 및 샤워실이 있습니다.</p>
            <p class="mb-0">사물함에 매일 샤워용품과 칫솔을 리필해드립니다. 만약 사물함에 리필이 안되어있을 경우</p>
            <p>직원에게 알려주시면 빠르게 리필해드리겠습니다.</p>
          </div>
          <div class="col-md-4 mt-3 pt-2">
            <div class="view z-depth-1">
               <img src="/resources/image/locker.svg" alt="" class="img-fluid">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header blue lighten-3 z-depth-1" role="tab" id="heading98">
      <h5 class="text-uppercase mb-0 py-1">
        <a class="collapsed font-weight-bold white-text" data-toggle="collapse" href="#collapse98"
          aria-expanded="false" aria-controls="collapse98">
          	3. 공항 또는 다른 곳에서 무거운 짐을 이끌고 오느라 힘드셨죠?
        </a>
      </h5>
    </div>
    <div id="collapse98" class="collapse" role="tabpanel" aria-labelledby="heading98"
      data-parent="#accordionEx23">
      <div class="card-body">
        <div class="row my-4">
          <div class="col-md-8">
            <h2 class="font-weight-bold mb-3 black-text">7Hours의 무료 샤워용품으로 씻고 난 뒤 여행지를 둘러보세요.</h2>
            <p class="">7Hours는 성별 마다 층이 분리되어있고, 샤워부스 또한 1인 프라이빗 부스로 만들어 놨습니다.</p>
            <p class="mb-0">날씨가 너무 더운 서울 .. 수건이 모자르시면 직원에게 말씀해주세요! 리필해드리겠습니다.</p>
            <p>공용헤어드라이기는 사용한 다음에는 다시 정리해주세요.</p>
            <p>스킨, 로션 또한 공용세면대에 있으니 마음껏 사용하셔도 됩니다.</p>
          </div>
          <div class="col-md-4 mt-3 pt-2">
            <div class="view z-depth-1">
              <img src="/resources/image/shower.svg" alt="" class="img-fluid">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
   <div class="card">
    <div class="card-header blue lighten-3 z-depth-1" role="tab" id="heading99">
      <h5 class="text-uppercase mb-0 py-1">
        <a class="collapsed font-weight-bold white-text" data-toggle="collapse" href="#collapse99"
          aria-expanded="false" aria-controls="collapse97">
         	4. 7HOURS 캡슐 불편하지 않을까?
        </a>
      </h5>
    </div>
    
    <div id="collapse99" class="collapse" role="tabpanel" aria-labelledby="heading99"
      data-parent="#accordionEx23">
      <div class="card-body">
        <div class="row my-4">
          <div class="col-md-8">
            <h2 class="font-weight-bold mb-3 black-text">7Hours는 넓고 쾌적합니다.</h2>
            <p class="mb-0">7Hours의 캡슐은 다른 타 캡슐호텔보다  큰 가로 120cm, 세로 230cm, 높이 120cm입니다.</p>
            <p class="mb-0">또한 혼성 층은 없이 남성/여성층으로 구분시켰습니다.</p>
           	<br />
            <p>주변 소음에 민감하신 분들은 직원에게 귀마개를 달라고하시면 무료로 드립니다.</p>
            <p>또한 7Hours는 주변소음에 민감하신 손님들이 있으니 캡슐안에서는 음식, 음료 섭취가 불가입니다.</p>
            <p>캡슐 안에 ID카드를 넣으시면 캡슐 내부의 기능을 사용할 수 있습니다.</p>
            <p>조명설정으로 숙면을 취하고 내일아침을 위해 알림설정으로 일찍 일어나서 서울의 아침을 느껴보세요! </p>
          </div>
          <div class="col-md-4 mt-3 pt-2">
            <div class="view z-depth-1">
               <img src="/resources/image/sleeping_pod.svg" alt="" class="img-fluid">
            </div>
          </div>
        </div>
      </div>
    </div>
  
  </div>
  
</div>
				
			</div>
		</div>
	</div>
</section>

<!-- jumbotron -->
<!-- <section>
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
</section> -->
	
		
		
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
				
				
				<div style="font-size: 20px; width: 60%; margin-right : auto; margin-left : auto;">
					<img src="/resources/image/instagram.png">
					<img src="/resources/image/instagram.png">
				</div>
				<div id="kakaoMap">
				
				</div>
				  
			</div>
		</div>
	</div>
</section>
	
<section id="faq" class="facility__faq">
<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: top; ">
	<h2  style="text-align: center;"><strong>7Hours 서비스 규정</strong></h2>
	<br /><br />
		<div>
		<div style="text-align: center;">
		<ol style="list-style: none;" class="faq">
			<li style="text-align: center;">
				<h4>체크인, 체크아웃</h4>
				<p>체크인은 13:00부터 시작, 체크아웃은 다음날 10:00까지 체크아웃을 해야합니다. 레이트 체크아웃은 없습니다.</p>
			</li>
			<li>
			<h4>장기 숙박 관련</h4>
			<p>7Hours를 이용하시는 손님들께서는 10:00까지 체크아웃을 해야합니다.  손님께서 머무는동안, 여전히 사물함은 쓸 수 있지만, 
			청소하기 쉽도록 10:00 - 13:00 사이에 캡슐 사용은 불가입니다. </p>
			<p>외출 시에는 소지품을 반드시 휴대하거나 사물함에 보관하십시오. 
			불편을 끼쳐드린 점 사과드리며 양해해 주셔서 감사드립니다.</p>
			</li>
			<li>
			<h4>레이트 체크아웃</h4>
			<p>7Hours에 24:00보다 늦게 도착한다면, 7Hours로 연락해주십시오. 7Hours에 연락을 미리 취하지 않는 경우, 손님의 예약은 취소될 예정입니다.</p>
			</li>
			<li>
			<h4>결제 방법</h4>
			<p>7Hours에 체크인할 때 미리 선결제해야 합니다. 웹사이트를 통한 페이팔 결제 또는 7Hours에서 결제 가능합니다.</p>
			</li>
			<li>
			<h4>사물함 사이즈</h4>
			<p>폭 40cm x 깊이 55cm x 높이 180cm</p>
			</li>
			<li>
			<h4>큰 사이즈의 수하물, 수하물 보관</h4>
			<p>사물함에 맞지 않는 수하물은, 프론트 데스크 앞에 보관할 수 있습니다.
			7Hours는 손님의 짐을 체크아웃 일까지만 보관이 가능하고, 귀중품 보관은 불가합니다. 귀중품의 안전은 7Hours에서 책임지지 않습니다.</p>
			</li>
			
			<li>
			<h4>제공용품</h4>
			<p>7Hours는 매일 손님들에게 목욕 타월, 얼굴 타월, 라운지 의류, 그리고 칫솔을 손님의 사물함에 리필해드립니다. 헤어 드라이어는 세면실에 있으며, 
			샴푸, 컨디셔너, 비누는 각 샤워부스마다 제공됩니다.</p>
			</li><li>
			<h4>캡슐 공간 사이즈</h4>
			<p>7Hours의 캡슐 사이즈는 가로 120cm, 세로 230cm, 높이 120cm입니다. 각 캡슐에 체크인 시 받은 ID카드를 넣으면, 캡슐을 이용할 수 있습니다.</p>
			</li>
			<li>
			<h4>세탁시설</h4>
			<p>7Hours는 세탁시설이 없습니다.</p>
			</li>
			<li>
			<h4>음식, 음료 섭취</h4>
			<p>7Hours는 캡슐안에서 음식, 음료 섭취는 불가입니다. 프론트 데스크 앞 라운지에서 드시길 부탁드립니다.</p>
			</li>
			<li>
			<h4>청소 수수료</h4>
			<p>7Hours는 고의적이든 아니든 손상되거나 더럽혀진 침구에는 50000원의 청소비가 붙습니다. 조심히 사용해주세요.</p>
			</li>
			<li>
			<h4>예약 취소 및 변경</h4>
			<p>+82 10-3922-2459로 연락 부탁드립니다.</p>
			</li>
			
			</ol>
			
			</div>
			
			
			
		</div>
	</div>
</section>	
 
<section id="gallery">
<div class="jumbotron jumbotron-fluid" style="background-color : #ececec; vertical-align: top; ">
	<h2  style="text-align: center;"><strong>포토 갤러리</strong></h2>
<div class="slick-carousel">
  <div>
    <img src="/resources/image/photogallery1.jpg">
  </div>
  <div>
   <img src="/resources/image/photogallery3.jpg">
  </div>
  <div>
    <img src="/resources/image/photogallery4.jpg">
  </div>
  <div>
   <img src="/resources/image/photogallery5.jpg">
  </div>
  <div>
   <img src="/resources/image/photogallery6.jpg">
  </div>
  <div>
   <img src="/resources/image/photogallery7.jpg">
  </div>
</div>
</div>
</section> 

<style>
.slick-carousel {
  margin: 0 auto;
  width: 1500px;
}

/* The width of each slide */
.slick-slide {
  width: 350px;
}

/* Color of the arrows */
.slick-next::before, .slick-prev::before {
  color: blue;
}
</style>

  	
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
	    autoplaySpeed : 1500,
	    speed : 2000,
	    autoplay : true,
	    fade: true
	  });
	  
	  $('.slick-carousel').slick({
		  infinite: true,
		  nextArrow: '<div class="chevron-container slick-right"><i class="fa fa-chevron-right" aria-hidden="true"></i></span><span class="sr-only">Next</span></div>',
		  prevArrow: '<div class="chevron-container"><i class="fa fa-chevron-left" aria-hidden="true"></i></span><span class="sr-only">Previous</span></div>',
		   
		  slidesToShow: 3, 
		  slidesToScroll: 1, 
		  arrows: true,
		  autoplaySpeed : 5000,
		  speed : 5000,
		  autoplay : true,
		  dots: true 
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
	 
	 /* function showPopup() { 
		//결제 창 열기
		var memberName = "${member.name}";
		
		if (memberName != null) {
			
		window.open("/reserv/reservPage", "a", "width=1200, height=800, left=250, top=50"); 
		} 
		
		if (memberName == null || memberName == "") {
			return false;
			alert("이름없음")
		}
			
	}  */
	$("#popupBtn").on("click", function() {
			
			window.open("/reserv/reservPage", "a", "width=1200, height=800, left=280, top=50"); 
			
			
	
	});
	
	$("#notLogined").on("click", function() {
		alert("로그인 후 사용가능합니다.");
		return false;
	})
	
	 
</script>



<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
