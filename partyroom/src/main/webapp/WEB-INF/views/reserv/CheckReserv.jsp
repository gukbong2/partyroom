<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!doctype html>
<html lang="ko">
<head>
<title></title>
<link rel="icon" type="image/png" sizes="32x32" href="/resources/fav/favicon-32x32.png">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
   crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
   integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
   crossorigin="anonymous"></script>
<!-- jQuery minified CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
   integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
   integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
   crossorigin="anonymous"></script>

<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/8824bffde2.js"></script>

<!-- 부트스트랩 캘린더 =========================================================================== -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?ver=1"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.0/moment-with-locales.js"></script>
<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/5a991bff/src/js/bootstrap-datetimepicker.js"></script>
<link href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/master/build/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />







<style>
body {
   font-family: 'NanumSquare', sans-serif;
   color: #666;
}
.container {
   max-width: 1500px;
}	
.normal {
   font-weight: 400
}
.bold {
   font-weight: 700
}
.bolder {
   font-weight: 800
}
.light {
   font-weight: 300
}
</style>

<style>
   body {
      font-family: 'NanumSquare', sans-serif;
      font-weight: 400;
      color: #666;
   }
   
   .center { text-align: center;
   }
   
   .boxoutside {
      width: 100%;
      height: auto;
   }
   
   .box { float: left; 
   }
   .boxoutside::after {
      content: "";
      clear: both;
      display: table;
   }
   
   #calendar, #info { padding: 20px; 
   }
   #calendar { width: 30%; 
   }
   
   
   #chk a { text-decoration: none; 
   }
   #chk {
      width: 100%;
      margin: 0 auto;
   }
   
   #chk ul>li {
      float: left;
      list-style-type: none;
      padding: 0 5% 0 5.5%;
      text-align: center;
      margin-bottom: 20px;
   }
   
   #chk ul>li>a { font-size: 1.1em; }
   #chk::after {
      content: "";
      clear: both;
      display: table;
   }
   
   .select { color: gray; 
   }
   
   .back {
      background-color: gray;
      color: white;
      padding: 0 8px 0 8px;
      border-radius: 30px;
      font-size: 20px;
   }
   
   .click {
      color: #475C7A;
      font-size: 17px;
   }
   
   /* step 1 2  */
   .noback {
      background-color: #475C7A;
      color: white;
      padding: 0 8px 0 8px;
      border-radius: 30px;
      font-size: 20px;
   }
   
   /* 버튼 */
   
   button {
      display: inline-block;
      padding: 6px 12px;
      border-radius: 4px;
      font-size: 14px;
      text-align: center;
      background-color: white;
      border: 1px solid #475C7A;
      cursor: pointer;
   }
   
   button:hover {
      border: 1px solid #475C7A;
      background-color: #475C7A;
      color: white;
   }
   
   #ticket { background-color: #f8f9fa; }
   /* 버튼 끝 */
</style>

<script>
	$(document).ready(function() {
		
		$("#reservBackBtn").on("click", function() {
			console.log("click");
			
			location.href = "/reserv/reservPage";
		});
		
		$("#reservCheckBtn").on("click", function() {
			
			console.log("click");
			
			location.href = "/reserv/paypal";
			
		});
		
	});
</script>

</head>


<body>
	
   <div id="container">
      <br>
      <!-- 예약 헤더 -->
      <div id="chk">
         <ul>
            <li><a class="menu" href="#">
               <b><span id="num" class="back">STEP1</span>
               <span id="select" class="click">날짜선택</span></b>
            </a></li>
            <li><strong></strong></li>
            <li><a class="menu" href="#">
               <b><span id="num" class="noback">STEP2</span>
               <span id="select" class="select">예약확인</span></b>
            </a></li>
            <li><strong></strong></li>
            <li><a class="menu" href="#">
               <b><span id="num" class="back">STEP3</span>
               <span id="select" class="select">결제하기</span></b>
            </a></li>
         </ul>
      </div>
      <!-- 예약 헤더끝 -->



      <div id="ticket" style="box-sizing: border-box;">
      
         <div class="boxoutside">
         
            <form method="get" action="/reserv/CheckReserv" id="reservForm">
               <!-- 달력 -->
               <input type="hidden" id="reserv_name" name="reserv_name" value="${member.name }"/>
               
               <br>
              



				<!-- 이용안내 -->
               <div id="info">
                  <h4 class="bold">이용안내</h4>
                  <p>장기간 투숙객 예약 시 조식 제공 (1주일 이상)</p>
                  <p>저희 숙소는 선결제만 가능합니다.</p>
                  <p>이용안내 문구 더 적기</p>
                  
                  
	                  
                  <hr>
					
                  <table class="table">
                  
                  	<thead >
                  		<tr style="text-align : center;">
                  			<th>예약자명</th>
                  			<th>체크인</th>
                  			<th>체크아웃</th>
                  			<th>조식여부</th>
                  			<th>숙소공간</th>
                  			<th>인원수</th>
                  		</tr>	
                  	</thead>


                  	<tbody>
                  		 <tr class="table-default">
					        <td>
					        	${reserv.reserv_name } 님
					        </td>
					        
					        <td>
					        	<fmt:formatDate value="${reserv.start_date }" pattern="yyyy-MM-dd"/>
					        </td>
					        
					        <td>
					        	<fmt:formatDate value="${reserv.end_date }" pattern="yyyy-MM-dd"/>
					        </td>
					        
					        <td>
					        	${reserv.breakfast }
					        </td>
					        
					        <td>
					        	남자 ${reserv.male } 명 / 여성 ${reserv.female } 명
					        </td>
					        
					        <td>
					        	총 인원 : ${reserv.count }명
					        </td>
					    </tr>
                  	
                  	</tbody>
                  	
                  	
                  </table>
                  
                  
                  <div class="center">
                  	<h2><strong>숙박요금 :: $${reserv.price }</strong></h2>
                  </div>

                  <div class="center" >
                     <button type="button" id="reservBackBtn" style="height : 30%; width : 115px;">이전단계</button>
                   <button type="button" id="reservCheckBtn">
                   <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_100x26.png"
                    alt="PayPal Logo">
                   </button> 
                  </div>

               </div>
  
            </form>
         </div>
      </div>
   </div>
   <!-- 바디 끝 -->
</body>
</html>