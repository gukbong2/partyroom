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
<!-- 부트스트랩 캘린더 =========================================================================== -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js?ver=1"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.0/moment-with-locales.js"></script>
<script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/5a991bff/src/js/bootstrap-datetimepicker.js"></script>
<link href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/master/build/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />

<script>
   $(function() {
      $(document.getElementsByName('breakfast')).attr('disabled', true);
      
 	 var room = document.getElementsByName('roomnum');
      
      $(room[0]).click(function() {
         $('#userTicket').show();
      });
      
      $(room[1]).click(function() {
         $('#userTicket').show();
      });
      

     /*  //1일권
      $('#oneday').click(
         function() {
            var startDate = $(document.getElementsByName('start_date')).val();
            console.log('start_date : ' + startDate);

            if (startDate == "") {
               alert('시작 날짜를 먼저 선택해주세요.');
               $(document.getElementsByName('start_date')).focus();
               return false;
            } else {
               //시작값이 있을 때
               function getTimeStamp() {

                  var d = new Date(startDate);
                  console.log('new date : ' + d);
                  console.log('date 확인 : ' + d.toLocaleString());
                  d.setDate(d.getDate() + 1);
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

               console.log('1일 뒤 날짜 확인 : ' + getTimeStamp());
               $("input[name='end_date']").prop('value', getTimeStamp());
               $(document.getElementsByName('breakfast')[1]).prop("checked", true);
               $(document.getElementsByName('breakfast')).attr('disabled', true);
            }
         }); */

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
            	   
                  function getTimeStamp() {

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

                  console.log('end_date : ' + getTimeStamp());	
                  $("input[name='end_date']").prop('value', getTimeStamp());
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

            	function getTimeStamp() {

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

               console.log('end_date : ' + getTimeStamp());
               $("input[name='end_date']").prop('value', getTimeStamp());
               $(document.getElementsByName('breakfast')).removeAttr("disabled");
               $(document.getElementsByName('breakfast')[0]).prop("checked", true);
               $(document.getElementsByName('breakfast')[1]).prop("disabled", true);
            }
         });

	      
      //1달
      $('#1month').click(
         function() {
            var startDate = $(document.getElementsByName('start_date')).val();
            console.log('start_date : ' + startDate);

            if (startDate == "") {
               alert('시작 날짜를 먼저 선택해주세요.');
               $(document.getElementsByName('start_date')).focus();
               return false;
            } else {

            	function getTimeStamp() {

                  var d = new Date(startDate);
                  console.log('start_date : ' + d.toLocaleString());
                  d.setDate(d.getDate() + 28);
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

               console.log('end_date : ' + getTimeStamp());
               $("input[name='end_date']").prop('value', getTimeStamp());
               $(document.getElementsByName('breakfast')).removeAttr("disabled");
               $(document.getElementsByName('breakfast')[0]).prop("checked", true);
               $(document.getElementsByName('breakfast')[1]).prop("disabled", true);
            }
         });
      
      
   });
   
</script>
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
      
      $('#nope').click(function() {
          $("input[name='end_date']").prop('value', '');
          $(document.getElementsByName('breakfast')[1]).prop("checked", true);
          $(document.getElementsByName('breakfast')).attr('disabled', true); 
       });

      
      
   });
</script>
<script>
   function nullchk(frm) {
      if (!frm.start_date.value) {
         alert("예약 시작 날짜를 선택해주세요.");
         frm.start_date.focus();
         return false;
      }
      if (!frm.end_date.value) {
         alert("예약 마감 날짜를 선택해주세요.");
         frm.end_date.focus();
         return false;
      }
      
      var time_idx = $("input:radio[name='time_idx']:checked").val();
      var startGetDate = new Date($(document.getElementsByName('start_date')).val()).getTime();
      var endGetDate = new Date($(document.getElementsByName('end_date')).val()).getTime();
      var chk = $(":input:radio[name=roomnum]:checked").val();
      var roomnum = $(":input:radio[name=roomnum]:checked").val();
      var breakfast = $("#breakfast").val();
      
      console.log("time_idx : " + time_idx);
      console.log(startGetDate);
      console.log(endGetDate);
	  console.log("chk : " + chk);
	  console.log("roomnum : " + roomnum);
      
      if (chk == null) {
         alert("객실종류를 선택해주세요.");
         return false;
      } else if (time_idx == 0 || time_idx == "") {
    	  //정기권 사용 안할 시 조식 0으로 처리
    	  breakfast = 0;
    	  console.log("breakfast : " + breakfast);
      }
      
   }
</script>

<style>
   body {
      font-family: 'NanumSquare', sans-serif;
      font-weight: 400;
      color: #666;
   }
   
   .center { text-align: center; }
   
   .boxoutside {
      width: 100%;
      height: auto;
   }
   
   .box { float: left; }
   .boxoutside::after {
      content: "";
      clear: both;
      display: table;
   }
   
   #calendar, #info { padding: 20px; }
   #calendar { width: 30%; }
   
   #chk a { text-decoration: none; }
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
   
   .select { color: gray; }
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
            <li><strong>&gt;</strong></li>
            <li><a class="menu" href="#">
               <b><span id="num" class="back">STEP2</span>
               <span id="select" class="select">예약확인</span></b>
            </a></li>
            <li><strong>&gt;</strong></li>
            <li><a class="menu" href="#">
               <b><span id="num" class="back">STEP3</span>
               <span id="select" class="select">결제하기</span></b>
            </a></li>
         </ul>
      </div>
      <!-- 예약 헤더끝 -->



      <div id="ticket" style="box-sizing: border-box;">
      
         <div class="boxoutside">
            <form method="post">
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
                  <p>장기간 투숙객 예약 시 조식 제공 (1주일 이상)</p>
                  <p>저희 숙소는 선결제만 가능합니다.</p>
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
                           <div class="radio">
                              <label><input type="radio" name="roomnum" id="roomnum" value="man">남성 도미토리</label><br>
                              <label><input type="radio" name="roomnum" id="roomnum" value="women">여성 도미토리</label>
                           </div>
                        </td>
                         <td>
                           <div class="radio">
                              <label><input type="radio" id="nope" name="time_idx" value="0" checked="checked">장기권 사용안함</label><br>
                              <div id="userTicket">
                              <!--    <label><input type="radio" id="oneday" name="time_idx" value="103">1일권</label><br> -->
                                 <label><input type="radio" id="1week" name="time_idx" value="100">1주 장기결제</label><br>
                                 <label><input type="radio" id="2weeks" name="time_idx" value="101">2주 장기결제</label><br>
                                 <label><input type="radio" id="1month" name="time_idx" value="102">4주 장기결제</label><br>
                              </div>
                           </div>
                        </td>

                        <td>
                           <div>
                              <label><input type="radio" id="breakfast" name="breakfast" value="1">사용</label><br>
                              <label><input type="radio" id="breakfast" name="breakfast" value="0" checked="checked">사용안함</label>
                           </div>
                        </td>
                     </tr>

                  </table>

                  <div class="center" style="padding: 10px;">
                     <button type="button" onclick="nullchk(this.form)">예약확인</button>
                  </div>

               </div>
  
            </form>
         </div>
      </div>
   </div>
   <!-- 바디 끝 -->
</body>
</html>