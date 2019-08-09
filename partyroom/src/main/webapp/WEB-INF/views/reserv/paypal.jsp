<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- PayPal -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(document).ready(function() {
	var price = ${reserv.price};
	console.log(price);
	var email = "${member.email}";
	console.log(email);
	var name = "${member.name}";
	console.log(name);  
	var phone = "${member.phone}";
	console.log(phone);
var IMP = window.IMP;
IMP.init('imp86425090');
IMP.request_pay({
	
	
	
    pg : 'paypal',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : 'korea guesthouse',
    amount : price,
    currency : 'USD',
    buyer_email : 'email',
    buyer_name : 'name',
    buyer_tel : 'phone',
    //buyer_addr : '서울특별시 강남구 삼성동',
    //buyer_postcode : '123-456',
    m_redirect_url : 'http://localhost:8080/reserv/confirm'
	});
});
</script>






<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>