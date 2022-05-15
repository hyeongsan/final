<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.service.domain.User" %>
<%@ page import="com.model2.mvc.service.domain.Purchase" %>

<%
	Product product=(Product)request.getAttribute("product");
	System.out.println(product.getProdNo());
	session.setAttribute("product", product);
	User user = (User)session.getAttribute("user");
	System.out.println(user.getUserId());
	
%>
 --%>
<html>
<head>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

   <!-- �����̵� -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<!--
<link rel="stylesheet" href="/css/admin.css" type="text/css">
-->
<title>��ǰ����ȸ</title>

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">


function fncAddPurchase() {
	var receiverName = document.addPurchase.receiverName.value;
	var receiverPhone = document.addPurchase.receiverPhone.value;
	var divyAddr = document.addPurchase.divyAddr.value;
	var divyRequest = document.addPurchase.divyRequest.value;
	var divyDate = document.addPurchase.divyDate.value;
	


	if(receiverName == null || receiverName.length<1){
		alert("�������̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("�����ڿ���ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("�������ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(divyRequest == null || divyRequest.length<1){
		alert("���ſ�û������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(divyDate == null || divyDate.length<1){
		alert("��������¥�� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	
	document.addPurchase.submit();
}

function noEvent() {
	console.log("�Լ�����Ȯ��");
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;

$(function(){
	
	$('.single-item').slick();
	

	  //�¿��ư, ���׶�� ��ư ���� //

	  var wid = $(".slider").width();
	  var i = $(".btnDot li.on").index();
	  var len = $(".panel li").length;	
	  
	  console.log(i);
	  
	  // �ϴ� pager ���� start
	  
		  var tag = "";
		  for(i=0; i<len-1; i++){
		  	tag += "<li></li>";
		  }
		  $(".btnDot").append(tag);
		  
	  // �ϴ� pager ���� end

	  $(".prev").click(function() {


	    if (i == 0) {

	      i = len - 1;


	    } else {

	      i = i - 1;

	    }

	    showSlide();
	  });

	  $(".next").click(function() {
		  	
		
	    if (i == len-1) {

	      i = 0;


	    } else {
		  
	      i = i + 1;

	    }
	    console.log(i);
	    showSlide();
	    console.log(i);
	  });

	  $(".btnDot li").click(function() {

	    i = $(this).index();

	    showSlide();


	  });
	  
	  $(".wish").click(function(){		
		  
		  console.log('��ٱ���Ŭ��');
		  
		  // var userId = $('.userId').val().text().trim();		 
	 	  
		  var userIdSpan = $('.userIdSpan').text();
		  var prodNoSpan = $('.prodNoSpan').text();
		    		 
		  
		  console.log(userIdSpan);
		  console.log(prodNoSpan);
		  
		  //self.location ="/wishlist/addWishlist";		
		  //console.log(prodNo);
		  
		  $.ajax({
			  url:'/wishlist/json/addWishlist',
			  type:'POST',
			  data : JSON.stringify({
				  userId : userIdSpan,
				  prodNo : prodNoSpan
				}),
				success : function(result){
					console.log("�߰��Ϸ�");
				}
		  })
		  		 
	  })

	  function showSlide() {				 
	    
		$(".btnDot li").removeClass("on");	  				 		   
	    $(".btnDot li").eq(i).addClass("on");
	    $(".panel li").stop(true, true).fadeOut();
	    $(".panel li").eq(i).stop(true, true).fadeIn();
	  }
	 
})
</script>
</head>
<style>
	.form-group.noneBorder input{
		 border:none;
		 background-color:#fff;
	}
	
	.page-header {
		    padding-top: 10px;
	}
	
	li{
		list-style:none;
	}
	
	.slider {
	    width: 510px;
	    height: 320px;
	    margin: 0 auto;
	    background-color: aqua;
	    position: relative;
	    overflow: hidden;
	    left: -188px;
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
	  left: 60px;
	  color: #fff;
	  font-size: 30px;
	  display: none;
	}
	
	.panel li:nth-child(1) {	
	  display: block;
	}
	
	.panel li img{
		width:300px;
		height:auto;
	}
	

	
	.btnDot {
	    position: absolute;
	    bottom: 0px;
	    left: 43%;
	    margin-left: -104px;
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
<body>

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->


<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	<div class="page-header text-info">
       <h3>��ǰ����</h3>
    </div>
	
	
	<form class="form-horizontal" name="addPurchase"  method="post" action="/purchase/addPurchase" >
	 <span class="prodNoSpan" style="display="hidden";>${product.prodNo}</span>
	 <span class="userIdSpan" style="display="hidden";>${user.userId}</span>
	 
	 <input type="hidden" name="prodNo" class="prodNo" value="${product.prodNo}"/>
	 <input type="hidden" name="prodName" value="${product.prodName }"/>
	 <input type="hidden" name="prodDetail" value="${product.prodDetail }"/>
	 <input type="hidden" name="userId" class="userId" value="${user.userId}" />
	 
		  <div class="form-group noneBorder">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="prodNo" placeholder="��ǰ��ȣ" value="${product.prodNo}" readonly>
		    </div>
		  </div>
		  
		
	  		<div class="col-xs-4 col-md-2"><strong>�̹���</strong></div>
			<div class="col-xs-8 col-md-4">	</div>
			<div class="slider">
		  <ul class="panel">
				<c:choose>	
					<c:when test="${product.fileName.contains('&')}">		
							<c:choose>
							<c:when test="${product.fileName.contains('mp4')}">
								<c:forEach var="name" items="${product.fileName.split('&')}">	
								<li>	
									<video width="400" height="300" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
								</li>																						
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="name" items="${product.fileName.split('&')}">
								<li>	
									<img src="/images/uploadFiles/${name}" align="absmiddle"/>		
								</li>																			
								</c:forEach>
							</c:otherwise>
							</c:choose>			
					</c:when>		
						<c:otherwise>				
								<li>	
									<img src="/images/uploadFiles/${product.fileName}" align="absmiddle"/>		
								</li>																		
						</c:otherwise>
				</c:choose>
		  </ul>
		  
		  <ul class="btnDot">		 
		  	<li class="on"></li>
		  </ul>
		  <button type="button" class="prev"><</button>
	  	  <button type="button" class="next">></button>
	  	  
	  	  
		</div>
		
		  
		   <div class="form-group noneBorder">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��" value="${product.prodName}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group noneBorder">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������" value="${product.prodDetail}" readonly>
		    </div>
		  </div>
		  
		   <div class="form-group noneBorder">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��ǰ������" value="${product.manuDate}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group noneBorder">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="regDate" name="regDate" placeholder="�������" value="${product.regDate}" readonly>
		    </div>
		  </div>
		  
		    <div class="form-group noneBorder">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����" value="${product.price}" readonly>
		    </div>
		  </div>
		  
		    <div class="form-group noneBorder">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" placeholder="${user.userId}" value="${user.userId}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="form-control" >
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		    </div>
		  </div>
		  		  
		   <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="�������̸�" required> 
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="�����ڿ���ó"  value="${user.phone}">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="�������ּ�"  >
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="���ſ�û����"  >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="����������">
		    </div>
		  </div>
		  
	</form>
	
	
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncAddPurchase();">����</a>
					</td>
					
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:history.go(-1)">���</a>
					</td>
					
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<button class="wish">��ٱ���</button>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
	</div>










</body>
</html>
