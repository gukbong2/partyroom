<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
#invoice{
    padding: 30px;
}

.invoice {
    position: relative;
    background-color: #FFF;
    min-height: 680px;
    padding: 15px
}

.invoice header {
    padding: 10px 0;
    margin-bottom: 20px;
    border-bottom: 1px solid #3989c6
}

.invoice .company-details {
    text-align: right
}

.invoice .company-details .name {
    margin-top: 0;
    margin-bottom: 0
}

.invoice .contacts {
    margin-bottom: 20px
}

.invoice .invoice-to {
    text-align: left
}

.invoice .invoice-to .to {
    margin-top: 0;
    margin-bottom: 0
}

.invoice .invoice-details {
    text-align: right
}

.invoice .invoice-details .invoice-id {
    margin-top: 0;
    color: #3989c6
}

.invoice main {
    padding-bottom: 50px
}

.invoice main .thanks {
    margin-top: -100px;
    font-size: 2em;
    margin-bottom: 50px
}

.invoice main .notices {
    padding-left: 6px;
    border-left: 6px solid #3989c6
}

.invoice main .notices .notice {
    font-size: 1.2em
}

.invoice table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    margin-bottom: 20px
}

.invoice table td,.invoice table th {
    padding: 15px;
    background: #eee;
    border-bottom: 1px solid #fff
}

.invoice table th {
    white-space: nowrap;
    font-weight: 400;
    font-size: 16px
}

.invoice table td h3 {
    margin: 0;
    font-weight: 400;
    color: #3989c6;
    font-size: 1.2em
}

.invoice table .qty,.invoice table .total,.invoice table .unit {
    text-align: right;
    font-size: 1.2em
}

.invoice table .no {
    color: #fff;
    font-size: 1.6em;
    background: #3989c6
}

.invoice table .unit {
    background: #ddd
}

.invoice table .total {
    background: #3989c6;
    color: #fff
}

.invoice table tbody tr:last-child td {
    border: none
}

.invoice table tfoot td {
    background: 0 0;
    border-bottom: none;
    white-space: nowrap;
    text-align: right;
    padding: 10px 20px;
    font-size: 1.2em;
    border-top: 1px solid #aaa
}

.invoice table tfoot tr:first-child td {
    border-top: none
}

.invoice table tfoot tr:last-child td {
    color: #3989c6;
    font-size: 1.4em;
    border-top: 1px solid #3989c6
}

.invoice table tfoot tr td:first-child {
    border: none
}

.invoice footer {
    width: 100%;
    text-align: center;
    color: #777;
    border-top: 1px solid #aaa;
    padding: 8px 0
}




    .invoice footer {
        position: absolute;
        bottom: 10px;
        page-break-after: always
    }

    .invoice>div:last-child {
        page-break-before: always
    }
}
</style>


</head>
<body>
<!------ Include the above in your HEAD tag ---------->

<div id="invoice">

   
    <div class="invoice overflow-auto">
        <div style="min-width: 600px">
            <header>
                <div class="row">
                    <div class="col">
                           <img src="/resources/image/logo.png" width="100px" height="100px"> 
                           <strong>gukbong's guesthouse</strong>
                    </div>
                    <div class="col company-details">
                        
                        <div>경기도 고양시 화중로 32-37</div>
                        <div>+82-10-3922-2459</div>
                        <div>gukbongworld@gmail.com	</div>
                    </div>
                </div>
            </header>
                <div class="row contacts">
                    <div class="col invoice-to">
                        <div class="text-gray-light"><h4>${reserv.reserv_name } 님! 결제가 완료되었습니다.</h4></div>
                        <h5 class="to"><a href="mailto:junyeon2459@gmail.com">${reserv.reserv_email }</a></h5>
                      <c:if test="${member.type eq 'site' }">
                      <div class="address">${member.address } ${member.addressDetail }</div> 
                      </c:if>
                    </div>
                    <div class="col invoice-details">
                       <div class="date">
							
                       </div>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th class="text-left"><strong>DESCRIPTION</strong></th>
                            <th class="text-right"><strong>남성 인원</strong></th>
                            <th class="text-right"><strong>여성 인원</strong></th>
                            <th class="text-center"><strong>조식 여부</strong></th>
                            <th class="text-right"><strong>총 금액</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-left">
                            	<h3>${reserv.ticket }</h3>
                            </td>
                            <td class="unit">${reserv.male }명</td>
                            <td class="qty">${reserv.female }명</td>
                            <td class="text-center">${reserv.breakfast }</td>
                            <td class="total">$ ${reserv.price }</td>
                        </tr>
                    </tbody>
                    
                    
                    <tfoot>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2">check-in</td>
                            <td><fmt:formatDate value="${reserv.start_date }" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2">check-out</td>
                            <td><fmt:formatDate value="${reserv.end_date }" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2">결제금액</td>
                            <td>$ ${reserv.price }</td>
                        </tr>
                    </tfoot>
                </table>
                <div class="thanks"><strong>Thank you!</strong></div>
                <br /><br />
             <footer>
                gukbong's guesthouse
            </footer> 
        </div>
        <!--DO NOT DELETE THIS div. IT is responsible for showing footer always at the bottom-->
        <div></div>
    </div>
</div>





</body>
</html>