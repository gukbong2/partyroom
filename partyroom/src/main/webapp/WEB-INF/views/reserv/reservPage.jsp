<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<script type="text/javascript">
   //부트스트랩 캘린더
   $(function() {
      $('#datepicker1').datetimepicker({
         format : 'YYYY-MM-DD',
         minDate : moment()
      });
      $('#datepicker2').datetimepicker({
         format : 'YYYY-MM-DD',
         useCurrent : false
      });
      $("#datepicker1").on("dp.change", function(e) {
         $('#datepicker2').data("DateTimePicker").minDate(e.date);
      });
      $("#datepicker2").on("dp.change", function(e) {
         $('#datepicker1').data("DateTimePicker").maxDate(e.date);
      });
      
      
   });
</script>


<script>
   $(function() {
      $(document.getElementsByName('breakfast')).attr('disabled', true);
      
      
         //1주
         $('#1week').click(
            function() {
               var startDate = $(document.getElementsByName('start_date')).val();
               console.log('start_date : ' + startDate);
               if (startDate == "") {
                  alert('시작 날짜를 먼저 선택해주세요.');
                  $(document.getElementsByName('start_date')).focus();
                  return false;
               } else {
            	   
                  function dayCalc() {
                     var d = new Date(startDate);
                     console.log('start_date : ' + d.toLocaleString());
                     d.setDate(d.getDate() + 7);
                     var day = d.toLocaleString();
                     var s = leadingZeros(d.getFullYear(), 4) + '-'
                           + leadingZeros(d.getMonth() + 1, 2) + '-'
                           + leadingZeros(d.getDate(), 2);
                     return s;
                  }
                  function leadingZeros(n, digits) {
                     var zero = '';
                     n = n.toString();
                     if (n.length < digits) {
                        for (i = 0; i < digits - n.length; i++)
                           zero += '0';
                     }
                     return zero + n;
                  }
                  console.log('end_date : ' + dayCalc());	
                  $("input[name='end_date']").prop('value', dayCalc());
                  $(document.getElementsByName('breakfast')).removeAttr("disabled");
                  $(document.getElementsByName('breakfast')[0]).prop("checked", true);
                  $(document.getElementsByName('breakfast')[1]).prop("disabled", true);
               }
            });   
         
         
      //2주
      $('#2weeks').click(
         function() {
            var startDate = $(document.getElementsByName('start_date')).val();
            console.log('start_date : ' + startDate);
            if (startDate == "") {
               alert('시작 날짜를 먼저 선택해주세요.');
               $(document.getElementsByName('start_date')).focus();
               return false;
            } else {
            	function dayCalc() {
                  var d = new Date(startDate);
                  console.log('start_date: ' + d.toLocaleString());
                  d.setDate(d.getDate() + 14);
                  var day = d.toLocaleString();
                  var s = leadingZeros(d.getFullYear(), 4) + '-'
                        + leadingZeros(d.getMonth() + 1, 2) + '-'
                        + leadingZeros(d.getDate(), 2);
                  return s;
               }
               function leadingZeros(n, digits) {
                  var zero = '';
                  n = n.toString();
                  if (n.length < digits) {
                     for (i = 0; i < digits - n.length; i++)
                        zero += '0';
                  }
                  return zero + n;
               }
               console.log('end_date : ' + dayCalc());
               $("input[name='end_date']").prop('value', dayCalc());
               $(document.getElementsByName('breakfast')).removeAttr("disabled");
               $(document.getElementsByName('breakfast')[0]).prop("checked", true);
               $(document.getElementsByName('breakfast')[1]).prop("disabled", true);
            }
         });
	      
      //5일
      $('#5days').click(
         function() {
            var startDate = $(document.getElementsByName('start_date')).val();
            console.log('start_date : ' + startDate);
            if (startDate == "") {
               alert('시작 날짜를 먼저 선택해주세요.');
               $(document.getElementsByName('start_date')).focus();
               return false;
            } else {
            	function dayCalc() {
                  var d = new Date(startDate);
                  console.log('start_date : ' + d.toLocaleString());
                  d.setDate(d.getDate() + 5);
                  var day = d.toLocaleString();
                  var s = leadingZeros(d.getFullYear(), 4) + '-'
                        + leadingZeros(d.getMonth() + 1, 2) + '-'
                        + leadingZeros(d.getDate(), 2);
                  return s;
               }
               function leadingZeros(n, digits) {
                  var zero = '';
                  n = n.toString();
                  if (n.length < digits) {
                     for (i = 0; i < digits - n.length; i++)
                        zero += '0';
                  }
                  return zero + n;
               }
			   
               console.log('end_date : ' + dayCalc());
               $("input[name='end_date']").prop('value', dayCalc());
               $(document.getElementsByName('breakfast')).removeAttr("disabled");
               $(document.getElementsByName('breakfast')[0]).prop("checked", true);
               $(document.getElementsByName('breakfast')[1]).prop("disabled", true);
            }
         });
      
	      $('#nope').on("click",function() {
	          $("input[name='end_date']").prop('value', '');
	          $(document.getElementsByName('breakfast')).removeAttr("disabled");
	          $(document.getElementsByName('breakfast')[0]).prop("disabled", true);
	          $(document.getElementsByName('breakfast')[1]).prop("checked", true);
	         // $(document.getElementsByName('breakfast')).attr('disabled', true); 
	      });	
      
      
   });
   
</script>



<script>
	$(document).ready(function() {
		
		$("#nope").click();
		
		
		$("#reservCheckBtn").on("click", function() {
			console.log("버튼 클릭");
			  
			
			 
			  var time_idx = $("input:radio[name='time_idx']:checked").val();
		      var startGetDate = new Date($(document.getElementsByName('start_date')).val()).getTime();
		      var endGetDate = new Date($(document.getElementsByName('end_date')).val()).getTime();
		      var breakfast = $("#breakfast").val();
		      var count = $("#count").val();
		      //남성 숙박 인원 수
		      var male = $("#male").val();
		      male = Number(male);
		      //여성 숙박 인원 수 
		      var female = $("#female").val();
		      female = Number(female);
		      count = male + female; 
		      $("#count").val(count);
		      // 숙박 가격
		      var price = $("#price").val();
		      // 숙박 가격 + 인원수
		      var priceAddCount = price * count;
		      
		     console.log("price 숙박 가격: " + price);
		      console.log("priceAddCount 숙박가격 곱하기 인원수: " + priceAddCount);
		      console.log("count 인원수: " + count);		      
		      console.log(startGetDate);
		      console.log(endGetDate);
			 // console.log("chk : " + chk);
			
			  if(!startGetDate) {
				  alert("체크인 날짜를 입력하세요");
				  return false;
			  } else if (!endGetDate) {
				  alert("체크아웃 날짜를 입력하세요");
				  return false;
			  } else if (male == 0 && female == 0) {
				  alert("투숙객 인원수를 설정해주세요.");
				  return false;
			  }
			  console.log("breakfast : " + breakfast);
				  
			  $("#reservForm").submit();
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
               <b><span id="num" class="noback">STEP1</span>
               <span id="select" class="click">날짜선택</span></b>
            </a></li>
            <li><strong></strong></li>
            <li><a class="menu" href="#">
               <b><span id="num" class="back">STEP2</span>
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
               <input type="hidden" name="price" id="price" value="3"/>
               <input type="hidden" name="count" id="count" value="0"/>
               <input type="hidden" id="reserv_name" name="reserv_name" value="${member.name }"/>
               <input type="hidden" id="reserv_email" name="reserv_email" value="${member.email }"/>
               <!-- 달력 -->
               
               <br>
               <div style="margin: 10px; border: 1px solid lightgray;">
                  <div id="calendar" class="container">
                     <div class="form-group">
                        <div class='input-group date' id='datepicker1'>
                           <input type='text' name="start_date" class="form-control" autocomplete="off"/>
                           <span class="input-group-addon">
                           <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class='input-group date' id='datepicker2'>
                           <input type='text' name="end_date" class="form-control" autocomplete="off"/>
                           <span class="input-group-addon">
                           <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- 데이트피커 끝 -->



				<!-- 이용안내 -->
               <div id="info">
                  <h4 class="bold">이용안내</h4>
                  <p><i class="fas fa-hiking">장기간 투숙객 예약 시 조식 제공 (5일 이상)</i></p>
                  <p><i class="fas fa-hand-holding-usd">저희 숙소는 선결제만 가능합니다.</i></p>
				  <p><i class="fas fa-key">락커 키를 잃어버리시면 +5000원 입니다.</i></p>
				  <p><i class="fas fa-smoking">객실 내 흡연 절대 불가능</i></p>
				  <p><i class="fas fa-id-card">체크인 시 여권을 보여주세요.</i></p>
                  <p>이용안내 문구 더 적기</p>
                  <hr>
					
                  <table class="table table-bordered" style="width: 100%; background-color: white;">
                  		
                     <tr>
                        <th style="text-align: center; width: 30%;">객실 / 투숙공간</th>
                        <th style="text-align: center; width: 40%;">장기간 투숙객 할인</th>
                        <th style="text-align: center; width: 30%;">조식 여부</th>
                     </tr>
                     <tr height="150px;">
                        <td>
                              <select name="male" id="male">
                                 <option value="0" selected="selected">남성 인원</option>
                                 <option value="1">남성 1명</option>
                                 <option value="2">남성 2명</option>
                                 <option value="3">남성 3명</option>
                                 <option value="4">남성 4명</option>
                              </select>
                              
                              <select name="female" id="female">
                                 <option value="0" selected="selected">여성 인원</option>
                                 <option value="1">여성 1명</option>
                                 <option value="2">여성 2명</option>
                                 <option value="3">여성 3명</option>
                                 <option value="4">여성 4명</option>
                              </select>
                        </td>
                         <td>
                           <div class="radio" style="text-align : center;">
                              <div id="userTicket">
                              	 <label><input type="radio" id="nope" name="time_idx" value="1">장기권 사용안함</label><br>
                                 <label><input type="radio" id="5days" name="time_idx" value="2">5일 결제</label><br>
                                 <label><input type="radio" id="1week" name="time_idx" value="3">1주 결제</label><br>
                                 <label><input type="radio" id="2weeks" name="time_idx" value="4">2주 결제</label><br>
                              </div>
                           </div>
                        </td>
						
						
						
                        <td>
                           <div style="text-align : center;">
                              <label><input type="radio" id="breakfast" name="breakfast" value="O">사용</label><br>
                              <label><input type="radio" id="breakfast" name="breakfast" value="X" checked="checked">사용안함</label>
                           </div>
                        </td>
                     </tr>

                  </table>

                  <div class="center" style="padding: 10px;">
                     <button type="button" id="reservCheckBtn">예약 정보 확인</button>
                  </div>

               </div>
  
            </form>
         </div>
      </div>
   </div>
   <!-- 바디 끝 -->
</body>
</html>