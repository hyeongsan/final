<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %>

 
<%
Product productVO=(Product)request.getAttribute("vo");
System.out.println("updateView.jsp 시작, menu:" + request.getParameter("menu"));
%>
--%>


<html>
<head>


	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- 캘린더 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/addform.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	

<title>상품 수정</title>



<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">


function fncAddProduct(){
	//Form 유효성 검증
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	console.log("콘솔테스트");
	document.detailForm.action='/product/updateProduct';
	console.log("콘솔테스트2");
	document.detailForm.submit();	
}

function resetData(){
	document.detailForm.reset();
}

</script>

<style>


*{
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}

.mar-15b{
    border: none !important;
    padding: 15px 20px !important;
    border-radius: 7px;
    background: rgb(232 240 254);
}

h3{
	text-align:left;
}

.page-header{
	padding-top: 30px;
}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
<div class="page-header text-info">
       <h3>상품수정</h3>
    </div>


	



<div class="form-horizontal">


	  <div class="form-style">
        <form id="form" name="detailForm" method="POST" enctype="multipart/form-data">
        
            <input type="hidden" name="prodNo" class="ct_input_g"  value="${product.prodNo}">
			<input type="hidden" name="menu" class="ct_input_g"  value="${param.menu }">
            
            <div class="bold">상품명
                <input class="mar-15b" type="text" name="prodName" value="${product.prodName}" placeholder="Enter the product name" required>
            </div>
            
            <div class="bold">상품상세정보
                <input class="mar-15b"  type="text" name="prodDetail" value="${product.prodDetail}" placeholder="Enter the product detail" required>
            </div>
            
            <div class="bold">제조날짜
            	<input class="mar-15b" name="manuDate" type="text" id="datepicker" value="${product.manuDate}" placeholder="Enter the manufacture day" readonly required>               
            </div>
            
            <div class="bold">가격
                <input class="mar-15b"  type="text" name="price" value="${product.price}" placeholder="Enter the product price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
            </div>
            
            <div class="bold">                       				          
                <input type="file" id="fileName" name="uploadfiles[]" value="${product.fileName}" multiple="multiple" >
            </div>
            
          <!--  <input type="file" name="files"> -->  

        	</form>                                   
    	</div>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<a href="javascript:fncAddProduct();">수정</a>
				</td>
				
				
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:history.go(-1)">취소</a>
					</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	
</table>

</form>
</body>
</html>