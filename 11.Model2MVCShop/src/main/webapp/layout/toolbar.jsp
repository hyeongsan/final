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
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                         
	                         <c:if test="${sessionScope.user.userId == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         </c:if>
	                         
	                        <!--  <li class="divider"></li> -->
	                       
	                     </ul>
	                 </li>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               <c:if test="${sessionScope.user.userId == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">�ǸŻ�ǰ���</a></li>
		                         <li><a href="#">�ǸŻ�ǰ����</a></li>
		                      
		                        
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- ���Ű��� DrowDown -->
	                <li class="dropdown">
	                     <a  href="#" role="button" aria-expanded="false">	                     
	                      <c:choose>
					         <c:when test="${sessionScope.user.userId == 'admin'}">
					           <span >�����̷°���</span>
					         </c:when>					        
					         <c:otherwise>
					               <span >�����̷���ȸ</span>
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
	                <li><a href="#">�α׾ƿ�</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	//=============  �ǸŻ�ǰ��� Event  ó�� =============	
	 	$( "a:contains('�ǸŻ�ǰ���')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/addProductView.jsp");
		});
	 	
	 	//=============  �ǸŻ�ǰ���� Event  ó�� =============	
	 	$( "a:contains('�ǸŻ�ǰ����')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
	 	
	 	//=============  �ǸŸ���Ʈ��ȸ Event  ó�� =============	
	 	$( "a:contains('�ǸŸ���Ʈ��ȸ')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listSales?menu=manage");
		});
	 	
	 	//=============  �� ǰ �� �� Event  ó�� =============	
	 	$( "a:contains('��ǰ�˻�')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	//=============  �����̷���ȸ Event  ó�� =============	
	 	$( "a:contains('�����̷���ȸ')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listPurchase");
		});
		//=============  �����̷°��� Event  ó�� =============	
	 	$( "a:contains('�����̷°���')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listPurchase");
		});
		
	 	//=============  �ֱ� �� ��ǰ Event  ó�� =============	
	 	$( "a:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {
	 		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
	</script>  