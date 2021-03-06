<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>


</style>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar navbar-default navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/product/listProduct?menu=search">
	<span class="glyphicon glyphicon-fire" aria-hidden="true"></span>
</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                         
	                         <c:if test="${sessionScope.user.userId == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         </c:if>
	                         
	                        <!--  <li class="divider"></li> -->
	                       
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               <c:if test="${sessionScope.user.userId == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">판매상품등록</a></li>
		                         <li><a href="#">판매상품관리</a></li>
		                      
		                        
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- 구매관리 DrowDown -->
	                <li class="dropdown">
	                     <a  href="#" role="button" aria-expanded="false">	                     
	                      <c:choose>
					         <c:when test="${sessionScope.user.userId == 'admin'}">
					           <span >구매이력관리</span>
					         </c:when>					        
					         <c:otherwise>
					               <span >구매이력조회</span>
					         </c:otherwise>
    					  </c:choose>	                     	                     	                            	                      	             
	                     </a>
	                   
	                 </li>
	              
	              <li class="dropdown">
	                     <a  href="#" role="button" aria-expanded="false">	                        
	                       
	                         <!-- 
	                         <span class="caret"></span>
	                          -->
	                     </a>
	                   
	                 </li>
	                 <!-- 
	                 <li><a href="#">etc...</a></li>
	                  -->
	             </ul>
	             
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">로그아웃</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	//=============  판매상품등록 Event  처리 =============	
	 	$( "a:contains('판매상품등록')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/addProductView.jsp");
		});
	 	
	 	//=============  판매상품관리 Event  처리 =============	
	 	$( "a:contains('판매상품관리')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
	 	
	 	//=============  판매리스트조회 Event  처리 =============	
	 	$( "a:contains('판매리스트조회')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listSales?menu=manage");
		});
	 	
	 	//=============  상 품 검 색 Event  처리 =============	
	 	$( "a:contains('상품검색')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	//=============  구매이력조회 Event  처리 =============	
	 	$( "a:contains('구매이력조회')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listPurchase");
		});
		//=============  구매이력관리 Event  처리 =============	
	 	$( "a:contains('구매이력관리')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listPurchase");
		});
		
	 	//=============  최근 본 상품 Event  처리 =============	
	 	$( "a:contains('최근 본 상품')" ).on("click" , function() {
	 		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
	</script>  