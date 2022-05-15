<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
<%@ page import="com.model2.mvc.service.domain.*" %>
<%
Product productVO=(Product)request.getAttribute("productVO");
		System.out.println("get.jsp 시작, menu: "+request.getParameter("menu"));
%>
--%>

<html>
<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- 슬라이드 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

   
<script language='javascript'>

function noEvent() {
	console.log("함수실행확인");
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
			

			  //좌우버튼, 동그라미 버튼 연동 //

			  var wid = $(".slider").width();
			  var i = $(".btnDot li.on").index();
			  var len = $(".panel li").length;	
			  
			  
			  // 하단 pager 생성 start
			  
				  var tag = "";
				  for(i=0; i<len-1; i++){
				  	tag += "<li></li>";
				  }
				  $(".btnDot").append(tag);
				  
			  // 하단 pager 생성 end

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
			    showSlide();
			  });

			  $(".btnDot li").click(function() {

			    i = $(this).index();

			    showSlide();


			  });

			  function showSlide() {				 
			    
				$(".btnDot li").removeClass("on");	  				 		   
			    $(".btnDot li").eq(i).addClass("on");
			    $(".panel li").stop(true, true).fadeOut();
			    $(".panel li").eq(i).stop(true, true).fadeIn();
			  }
			 
		})

</script>


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
	    height: 330px;
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
	  text-align: center;
	}
	
	.panel li:nth-child(1) {	
	  display: block;
	}
	
	.panel li img{
		    width: 260px;
  			  height: auto;
	}
	

	
	.btnDot {
	    position: absolute;
	    bottom: 0px;
	    left: 53%;
	    margin-left: -70px;
	}
	
	.btnDot li {
		float: left;
	    width: 15px;
	    height: 15px;
	       background-color: #d1c6c6;
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
	  left: 25px;
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
	       right: 25px;
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
		       <h3 class=" text-info">상품정보조회</h3>		       
	    </div>	    	 
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이미지</strong></div>
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
		  <button class="prev"><</button>
	  	  <button class="next">></button>
	  	  
	  	  
		</div>
		</div>
		
		<!--		 
		<div class="single-item">		</div>		
 		-->

	
	
		</div>

</div>
			
			
		
		<!--
	  <div class="slick"> <div>이미지1</div> <div>이미지2</div> <div>이미지3</div> </div>
		-->
	       	
	
		
		<div class="row none">
	  		<div class="col-md-12 text-center right">
	  			<button type="button" class="btn btn-primary">
					<a href="javascript:history.go(-1)" style="color:#fff">이전</a>
				</button>
	  			
	  		</div>
		</div>
	</div>
		

</body>
</html>