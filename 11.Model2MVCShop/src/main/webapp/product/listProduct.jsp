<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<html>
<head>

<meta charset="EUC-KR">
	
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
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  


function fncGetList(currentPage) {
	
	var hiddenMenu =$('.hiddenMenu').val();	
	console.log(hiddenMenu);

	$("#currentPage").val(currentPage);  


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
	


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		  $(window).scroll(function() {		
                if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
			//page 1�� ����
			var cpage= $("#currentPage").val();
			cpage = Number(cpage)+1;
			console.log(cpage);
			
			//ajax����
			$.ajax({
			
				url: "/product/json/listProduct",
				
				method: "POST",
				
				data : JSON.stringify({
					currentPage : cpage
				}),
				
				dataType : "json" ,
				
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				
				success : function(JSONData, status){
				
				//ajax����� �����ϸ� currentPage value�� +1�� �������ش�
			
				   $("#currentPage").val(cpage).text().trim();  				  
				   console.log(cpage);
				   console.log(JSONData.list[0].prodName);			
				   console.log(JSONData.list[0].fileName.split('&')[0]);
				   console.log(JSONData.list);
				   
				   for(var i=0; i<JSONData.list.length; i++){
					var image;	
					var prodName;
					var price;
					var prodNo;
					
					console.log("sam");
			
    				image = "<img width='250' height='250' src='/images/uploadFiles/"+JSONData.list[i].fileName.split('&')[0]+"' id='image'>";
    				
    				prodName = JSONData.list[i].prodName;
    				price = JSONData.list[i].price;	
    				prodNo = JSONData.list[i].prodNo;
    				
    				console.log(JSONData.list[i].prodName);    	
			
					var displayValue =  "<div class='col-sm-4 col-md-3 captionParent'>"
										+ image
										+ "<div class='caption'>"
										+ "<h3>"+prodName+"</h3>"
										+ "<p>"+price+"</p>"
										+ "<p align='right'>"
										+ "<span style='display:none' class='hiddenProdNo'>"+prodNo+"</span>"
										+ "</p>"
										+ "</div>"
										+ "</div>"
				  					
			
					$('#prodList').append(displayValue);					                     					
				}			

			}
				
			})
	
	}
			})
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	
	
	 
	//==> �˻� Event ����ó���κ�
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
	 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
		fncGetProductList(1);
	});
	
	
	//��ǰ����
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
	
	//��ǰ����
	$(".buyProduct").on("click" , function() {
			var innerText = $(this).text().trim();
			//var prodNo = $('.prodNo').text().trim();
			
			var prodNo = $(this).parent().parent().find('.prodNo').text().trim();
			var userId = $('.userId').text().trim();
			
			console.log(userId);
			console.log(prodNo);
			//Debug..
			//alert(  $( this ).text().trim() );		
			console.log($(this).text());						
			self.location ="/purchase/addPurchaseView?prodNo="+prodNo+"&userId="+userId+"";
	
			//<a href="/getProduct?prodNo=${product.prodNo}&prodName=${product.prodName}">${product.prodName}</a>			
	});
	
	//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
	$( ".ct_list_pop td:nth-child(3) a" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	
	//==> �Ʒ��� ���� ������ ������ ??
	//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	//==> ����Ű�̺�Ʈ
	
	$('.searchBtn').on("click",function(){
      
        	fncGetProductList('1');
       
    });
	

	 
	 $(document).on("mouseenter",'.captionParent',function(){
		
		  // $(this).find('.caption').show(300);		   
		   $(this).find('.caption').css("opacity","1");
	 })
	 
	  $(document).on("mouseleave",'.captionParent',function(){
		  
		   $(this).find('.caption').css("opacity","0");
	 })
	 
	   $(document).on("click",'.caption',function(){
		
		   
		   var hiddenProdNo = $(this).find('.hiddenProdNo').text().trim();
			 
		  // var userId = $('.userId').text().trim();
			
		
		   
			console.log(hiddenProdNo);
			 
		//	 self.location="/purchase/addPurchaseView?prodNo="+hiddenProdNo+"&userId="+userId+"";
		 	 self.location="/purchase/addPurchaseView?prodNo="+hiddenProdNo;
		//	 self.location="/purchase/addPurchaseView";
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
				 <h3 style="margin-top:-20px;">��ǰ����</h3>
				</c:when> 
				<c:otherwise>
				  <!--   <h3>��ǰ�����ȸ</h3> -->
				</c:otherwise> 
			</c:choose>
			
			<c:choose> 
				<c:when test="${param.menu eq 'search'}">
				
				 	 <div class="text">
				<p class="happyText">happy shopping! ${user.userId }! </p>		
				
				</div>
				</c:when> 
				
			</c:choose>
			      
		
	    </div>

 	<!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    <!--
		    <div class="col-md-8 text-left">
		    	<span class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
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
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default searchBtn">�˻�</button>
				  
			
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value="1"/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
		
	  <!--  table Start /////////////////////////////////////-->
      
      <c:if test="${param.menu.equals('search') }">			        							       		      		      
		<div class="row" id="target">
		<div id="prodList">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			
			  <div class="col-sm-4 col-md-3 captionParent">
			  
			    <c:choose>
			    <c:when test="${product.fileName.contains('&')}">
				    <c:choose>
					<c:when test="${product.fileName.contains('mp4')}">
						�̹�������
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
						        <p>${product.price} ��</p>			        				   
						        <p align="right">			       
						        <span style="display:none" class="hiddenProdNo">${product.prodNo}</span>		       	
						        </p>			        			  								      
					      	</div>	
					</c:otherwise>	
					
						 	
			      	</c:choose>				
							    
			  </div>				  		
          </c:forEach>
             </div>	
          </div>
       </c:if>
         
	  <!--  table End /////////////////////////////////////-->
	  
	  <!--  table Start /////////////////////////////////////-->
	  
	   <c:if test="${param.menu.equals('manage') }">			
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr class="tableheader">
            <th align="center">No</th>
            <th align="left">��ǰ��</th>
            <th align="left">������</th>
            <th align="left">����</th>
            <th align="left">��������</th>
            <!-- 
            <th align="left">��۰���</th>
             -->
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
	
			</tr>
          </c:forEach>
        
        </tbody>
            
    
      </table>
    </c:if>
	  <!--  table End /////////////////////////////////////-->
	  
	
 </div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	 <!-- PageNavigation End... -->

</body>
</html>