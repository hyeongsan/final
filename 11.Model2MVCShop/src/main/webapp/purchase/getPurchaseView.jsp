<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html>
<head>
<title>���Ż���ȸ</title>

	
		
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- �����̵� -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>


<style>
	.page-header{
		padding-top: 10px;
		
	}
	
	.right{
		text-align : right;
	}
	
	.row{
	    margin-right: -15px;
	    margin-left: -15px;
	    border-bottom: 1px solid #eee;
	    padding: 15px 0;
	}
	
	.row.none{
	    border-bottom: none;
	}
	
	.slick-initialized .slick-slide{
	    
	    height: auto;
	}
	
		* {
	  margin: 0px;
	  padding: 0px;
	}
	
	ul {
	  list-style: none;
	}
	
	a {
	  text-decoration: none;
	}
	
	img {
	  border: none;
	}
	
	.slider {
	  width: 400px;
	  height: 200px;
	  margin: 0 auto;
	  background-color: aqua;
	  position: relative;
	  overflow: hidden;
	  left: -350px;
	}
	
	.slider .panel {
	  width: 100%;
	  height: 100%;
	  position: relative;
	}
	
	.slider .panel li {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  top: 0px;
	  left: 0px;
	  color: #fff;
	  font-size: 30px;
	  display: none;
	}
	
	.panel li:nth-child(1) {	
	  display: block;
	}
	
	.panel li img{
		width:300px;
		height:200px;
	}
	

	
	.btnDot {
	    position: absolute;
	    bottom: 0px;
	    left: 43%;
	    margin-left: -70px;
	}
	
	.btnDot li {
		float: left;
	    width: 15px;
	    height: 15px;
	    background-color: #efefef;
	    border-radius: 50%;
	    text-indent: -9999px;
	    margin-right: 20px;
	    cursor: pointer;
	}
	
	.btnDot .on {
	  background-color: #000;
	}
	
	.btnDot li:hover {
	  background-color: #000;
	}
	
	.btnDot li:last-child {
	  margin-right: 0px;
	}
	
	.prev {
	    position: absolute;
	    right: 30px;
	    left: 5px;
	    top: 50%;
	    width: 30px;
	    height: 30px;
	    background-color: none !important;
	    margin-top: -15px;
	    /* font-weight: bold; */
	    border: none;
	    border-radius: 10px;
	    font-size: 26px;
	    line-height: 1px;
	}
	
	.next {
	    position: absolute;
	    right: 105px;
	    top: 50%;
	    width: 30px;
	    height: 30px;
	    background-color: none !important;
	    margin-top: -15px;
	    /* font-weight: bold; */
	    border: none;
	    border-radius: 10px;
	    font-size: 26px;
	    line-height: 1px;
	}
</style>
</head>

<body bgcolor="#ffffff" text="#000000" oncontextmenu="return false">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	<div class="container">
   	
	   	<div class="page-header">
		       <h3 class=" text-info">���Ż���ȸ</h3>		       
	    </div>	    	 
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">	${purchase.purchaseProd.prodNo}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.paymentOption}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������¥</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate }</div>
		</div>
		
	
		
		<!--		 
		<div class="single-item">		</div>		
 		-->

	
	
		</div>

</div>
			
			
		
		<!--
	  <div class="slick"> <div>�̹���1</div> <div>�̹���2</div> <div>�̹���3</div> </div>
		-->
	       	
	
		
		<div class="row none">
	  		<div class="col-md-12 text-center right">
	  			<button type="button" class="btn btn-primary">
					<a href="javascript:history.go(-1)" style="color:#fff">����</a>
				</button>
	  			
	  		</div>
		</div>
	</div>
		

</body>
</html>

