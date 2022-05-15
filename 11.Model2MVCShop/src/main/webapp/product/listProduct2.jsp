<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
	.underline{
		text-decoration:underline;
	}

	.upProduct{
		color:red;
		text-decoration : underline;
		cursor:pointer;
	}
	
	.ajaxButton{
		z-index:1;
		border: none;
 		border-radius: 50%;
 		cursor:pointer; 	
 		background-color: lightgray;
 		color:white;	
	}
	.ajaxButton:hover{
		background-color: skyblue;
	}
	
	.page-header{
	    padding-top: 30px;	
	}
	
	.form-group .form-control.index{
		width: 110px !important;
	}
	
	.tableheader th{
		text-align:center;
	}
	
	.caption{		
	    position: absolute;
	  	top: 0;
	    left: 0;	  	   
	    transition:all 0.7s;	    	      
    	position: absolute;    	    	   
	    width: 251px;
	    height: 250px;
	    padding: 50px;
	    color:#fff;	    
	    text-align: center;
	    cursor:pointer;
	    background-color: rgb(0 0 0 / 50%); 	
	    opacity:0;
	}
	
	.captionBuyNo{
		position: absolute;
		top: 0;
	    left: 0;
	    transition: all 0.7s;
	    position: absolute;
	    width: 251px;
	    height: 250px;
	    padding: 50px;
	    color: #fff;
	    text-align: center;
	    cursor: none;
	    pointer-events: none;
	    background-color: rgb(54 54 54 / 50%);
	    opacity: 1;
	}
	
	.captionParent{
  		position: relative;
		padding-bottom: 3.5%;
		padding:0;
		width: 255px;
		left: 80px;
	}
	

	@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');

body{
  padding: 40px;
  background-color: #fff;  
}

.text{
    position: absolute;
    top: 7%;
    left: 50%;
    transform: translate(-50%, 0);
}

.happyText {
  border-right: solid 3px rgba(0,255,0,.75);
  white-space: nowrap;
  overflow: hidden;    
  /*font-family: 'Source Code Pro', monospace;*/  
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  font-size: 28px;
  color: rgb(28 28 28 / 70%);
}

/* Animation */
.happyText {
  animation: animated-text 3s steps(40,end) 500ms 1 normal both,  			 
             animated-cursor 600ms steps(40,end) infinite; 
               
}

/* text animation */

@keyframes animated-text{
  from{width: 0;}
  to{width: 305px;}
}

/* cursor animations */

@keyframes animated-cursor{
  from{border-right-color: rgba(0,255,0,.75);}
  to{border-right-color: transparent;}
}

.searchBtn{
	top:0;
	left:0;
}

	
</style>



<script type="text/javascript">
//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  


function fncGetList(currentPage) {
	
	var hiddenMenu =$('.hiddenMenu').val();	
	console.log(hiddenMenu);

	$("#currentPage").val(currentPage).text().trim();  

//	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+hiddenMenu).submit();		
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+hiddenMenu).submit();
}

function fncGetProductList(currentPage) {
	var hiddenMenu =$('.hiddenMenu').val();	
	console.log(hiddenMenu);
	$("#currentPage").val(currentPage).text().trim(); 
	
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+hiddenMenu).submit();		
}



$(function() {
	
	$('.ajaxButton').on("click",function(){
		var productName = $(this).parent().find('.upProduct').text().trim(); 
		console.log("heartbeat");
				
		console.log(productName);
		/////////////////////////////////////////////////////////////////////////////////
		$.ajax( 
				{
					url : "/product/json/getProduct/"+productName ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {

						//Debug...
						//alert(status);
						//Debug...
						//alert("JSONData : \n"+JSONData);
						
						var displayValue = "<h3>"
													+"아이디 : "+JSONData.userId+"<br/>"
													+"이  름 : "+JSONData.userName+"<br/>"
													+"이메일 : "+JSONData.email+"<br/>"
													+"ROLE : "+JSONData.role+"<br/>"
													+"등록일 : "+JSONData.regDateString+"<br/>"
													+"</h3>";
						//Debug...									
						//alert(displayValue);
						$("h3").remove();
						$( "#"+userId+"" ).html(displayValue);
					}
			});
		/////////////////////////////////////////////////////////////////////////////////
	})
	 
	//==> 검색 Event 연결처리부분
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
	 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
		fncGetProductList(1);
	});
	
	
	//상품수정
	$(".upProduct").on("click" , function() {
			var innerText = $(this).text().trim();
			//var prodNo = $('.prodNo').text().trim();
			
			var prodNo = $(this).parent().parent().find('.prodNo').text().trim();
			
			console.log(prodNo);
			//Debug..
			//alert(  $( this ).text().trim() );		
			console.log($(this).text());						
			self.location ="/product/updateProductView?prodNo="+prodNo;
	
			//<a href="/getProduct?prodNo=${product.prodNo}&prodName=${product.prodName}">${product.prodName}</a>			
	});
	
	//상품구매
	$(".buyProduct").on("click" , function() {
			var innerText = $(this).text().trim();
			//var prodNo = $('.prodNo').text().trim();
			
			var prodNo = $(this).parent().parent().find('.prodNo').text().trim();
			
			console.log(prodNo);
			//Debug..
			//alert(  $( this ).text().trim() );		
			console.log($(this).text());						
			self.location ="/purchase/addPurchaseView?prodNo="+prodNo;
	
			//<a href="/getProduct?prodNo=${product.prodNo}&prodName=${product.prodName}">${product.prodName}</a>			
	});
	
	//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
	$( ".ct_list_pop td:nth-child(3) a" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	
	//==> 아래와 같이 정의한 이유는 ??
	//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	//==> 엔터키이벤트
	
	$('.searchBtn').on("click",function(){
      
        	fncGetProductList('1');
       
    });
	
	 $('.captionParent').mouseenter(function(){
		   console.log("hsan");
		  // $(this).find('.caption').show(300);		   
		   $(this).find('.caption').css("opacity","1");
		  });
	 
	 $('.captionParent').mouseleave(function(){
		   console.log("hsan1");
		   $(this).find('.caption').css("opacity","0");
		  });
	 
	 $('.caption').on("click",function(){		 
		 
		 var hiddenProdNo = $(this).find('.hiddenProdNo').text().trim();
		 
		console.log(hiddenProdNo);
		 
		 self.location="/purchase/addPurchaseView?prodNo="+hiddenProdNo;
		 
		 
	 })

});	

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

<div class="container">
	
	
		<div class="page-header text-info">
		
			<c:choose> 
				<c:when test="${param.menu eq 'manage'}">
				 <h3>상품관리</h3>
				</c:when> 
				<c:otherwise>
				  <!--   <h3>상품목록조회</h3> -->
				</c:otherwise> 
			</c:choose>
			      
			 <div class="text">
				<p class="happyText">happy shopping! ${user.userId }! </p>		
			</div>
	    </div>

 	<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    <!--
		    <div class="col-md-8 text-left">
		    	<span class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</span>
		    </div>
		  -->  
		    <div class="col-md-8 text-right">
			    <form class="form-inline" name="detailForm">
			    
			    <c:choose> 
					<c:when test="${param.menu eq 'manage'}">
						<input type="hidden" class="hiddenMenu" value="manage"/>
					</c:when> 
					<c:otherwise>
					   <input type="hidden" class="hiddenMenu" value="search"/>
					</c:otherwise> 
				</c:choose>			
			    
			    
				  <div class="form-group">						
					<select class="form-control index" name="searchCondition" style="width:80px">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default searchBtn">검색</button>
				  
			
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
		
	  <!--  table Start /////////////////////////////////////-->
      
      <c:if test="${param.menu.equals('search') }">			        							       		      		      
		<div class="row" id="target">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			
			  <div class="col-sm-4 col-md-3 captionParent">
			  
			    <c:choose>
			    <c:when test="${product.fileName.contains('&')}">
				    <c:choose>
					<c:when test="${product.fileName.contains('mp4')}">
						이미지없음
					</c:when>
					<c:otherwise>
						<c:forEach var="name" items="${product.fileName.split('&')[0]}">
							<img src="/images/uploadFiles/${name}" width="250" height="250" >
						</c:forEach>
					</c:otherwise>
					</c:choose>
			    </c:when>
			    <c:otherwise>
					<img src="/images/uploadFiles/${product.fileName}" width="250" height="250"> 
				</c:otherwise>
				</c:choose>		
				
				    
			      	
			      	<c:choose>																										
						<c:when test="${product.proTranCode.equals('100')}">	
								 <div class="captionBuyNo">
						        <h3>Sold Out</h3>			    			        			      
						        	        				   
						        <p align="right">			       
						        <span style="display:none" class="hiddenProdNo">${product.prodNo}</span>		       	
						        </p>			        			  								      
					      	</div>
						</c:when> 
							<c:when test="${product.proTranCode.equals('200')}">	
								 <div class="captionBuyNo">
						        <h3>Sold Out</h3>			    			        			      
						        	        				   
						        <p align="right">			       
						        <span style="display:none" class="hiddenProdNo">${product.prodNo}</span>		       	
						        </p>			        			  								      
					      	</div>
						</c:when> 
							<c:when test="${product.proTranCode.equals('300')}">	
								 <div class="captionBuyNo">
						        <h3>Sold Out</h3>			    			        			      
						        	        				   
						        <p align="right">			       
						        <span style="display:none" class="hiddenProdNo">${product.prodNo}</span>		       	
						        </p>			        			  								      
					      	</div>
						</c:when> 
						<c:otherwise>
							 <div class="caption">
						        <h3>${product.prodName}</h3>			    			        			      
						        <p>${product.price} 원</p>			        				   
						        <p align="right">			       
						        <span style="display:none" class="hiddenProdNo">${product.prodNo}</span>		       	
						        </p>			        			  								      
					      	</div>	
					</c:otherwise>	
					
					
			      	</c:choose>				
						    			    
			  </div>					
          </c:forEach>
          </div>
       </c:if>
	  <!--  table End /////////////////////////////////////-->
	  
	  <!--  table Start /////////////////////////////////////-->
	  
	   <c:if test="${param.menu.equals('manage') }">			
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr class="tableheader">
            <th align="center">No</th>
            <th align="left">상품명</th>
            <th align="left">상세정보</th>
            <th align="left">가격</th>
            <th align="left">제조일자</th>
            <th align="left">배송관리</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="tablebody">
			  <td align="center">${ i }</td>
			  
				<c:choose> 
					<c:when test="${param.menu eq 'manage'}">							
						<td align="center"><a href="/product/updateProductView?prodNo=${product.prodNo}&prodName=${product.prodName}" class="underline">${product.prodName}</a></td>					  								
					</c:when> 
					<c:otherwise>																						 																																																																			  
			       	    <td align="center"><a href="/product/getProduct?prodNo=${product.prodNo}&prodName=${product.prodName}" class="underline">${product.prodName}</a></td>  																																																			
					</c:otherwise> 
				</c:choose>

			  <td align="left">${product.prodDetail}</td>
			  <td align="center">${product.price}</td>
			  <td align="center">${product.manuDate}</td>
			  	<td align="center">
													
					<c:choose>																										
						<c:when test="${product.proTranCode.equals('100')}">						
							구매완료<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&tranCode=${product.proTranCode}&currentPage=${resultPage.currentPage}">배송하기</a>																			
						</c:when> 
						<c:when test="${product.proTranCode.equals('200')}">
							배송중<a href="/purchase/updateTranCode?prodNo=${product.prodNo }&tranCode=${product.proTranCode}&currentPage=${resultPage.currentPage}">배송완료</a>																															
						</c:when> 
						<c:when test="${product.proTranCode.equals('300')}">
							배송완료
						</c:when> 		
							<c:otherwise>
							판매중
					</c:otherwise>												
					</c:choose>																				
			</td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
    </c:if>
	  <!--  table End /////////////////////////////////////-->
	  
	
 </div>
	<!--  화면구성 div End /////////////////////////////////////-->

	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>