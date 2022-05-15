<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
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


<title>���� �����ȸ</title>



<script type="text/javascript">

//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	
		

		function fncGetList(currentPage) {
			console.log(currentPage);
			console.log("������?");
			$("#currentPage").val(currentPage)			
			$('form').attr("action","POST").attr("action" , "/purchase/listPurchase").submit();				
		}


</script>

<style>
	.tableHeader th{
		text-align:center;
	}
	
	.page-header{
		 padding-top: 20px;
	}
	
</style>
</head>

<body bgcolor="#ffffff" text="#000000">


<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->



<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">
	<div class="page-header text-info">
		       <h3>���Ÿ����ȸ</h3>
		</div>
		
				 <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
	 <form class="form-inline" name="detailForm">
	 <input type="hidden" id="currentPage" name="currentPage" value=""/>
		 <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
	       <thead>
	          <tr class="tableHeader">
	            <th align="center">No</th>
	            <th align="center" >ȸ��ID</th>
	            <th align="center">ȸ����</th>	      
	            <th align="center">��ȭ��ȣ</th>
	            <th align="center">��û����</th>
	            <th align="center">�����Ȳ</th>				
	          </tr>
	        </thead>
	        
	        <tbody>
	        
	        <c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
		
			<td align="center">
			<!-- <a href="/getPurchase.do?tranNo=${purchase.tranNo }">${ i }</a> -->
			<span>${ i }</span>
			</td>
		
			
			<td align="center">
				<!-- <a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> -->
				<span>${purchase.buyer.userId}</span>
			</td>
			
			
			<td align="center">${purchase.receiverName }</td>
			
			
			<td align="center">${purchase.receiverPhone }</td>		
		
			<td align="center">${purchase.divyRequest}</td>
			
			
			
			  <c:choose>
		         <c:when test="${sessionScope.user.userId == 'admin'}">
		              <c:choose>
							<c:when test="${purchase.tranCode.equals('100')}">					
								<td align="center">
								���ſϷ�
								<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&tranCode=${product.proTranCode}&currentPage=${resultPage.currentPage}">����ϱ�</a>
								</td>
							</c:when>
							<c:when test="${purchase.tranCode.equals('200')}">
								<td align="center">
								�����
								<a href="/purchase/updateTranCode?prodNo=${product.prodNo }&tranCode=${product.proTranCode}&currentPage=${resultPage.currentPage}">��ۿϷ�</a>
								</td>
								
							</c:when>
							<c:otherwise>
								<td align="center">��ۿϷ�</td>
							</c:otherwise>
					</c:choose>
		         </c:when>
		        
		         <c:otherwise>
		          <c:choose>
							<c:when test="${purchase.tranCode.equals('100')}">					
								<td align="center">
								���ſϷ�							
								</td>
							</c:when>
							<c:when test="${purchase.tranCode.equals('200')}">
								<td align="center">
								�����								
								</td>
								
							</c:when>
							<c:otherwise>
								<td align="center">��ۿϷ�</td>
							</c:otherwise>
					</c:choose>
		         </c:otherwise>
	    	  </c:choose>
			
			
			
			
		           
		         
		           
	         
			
			
			
			
					
		
			
		</tr>
		
	</c:forEach>	
	        
	        </tbody>

      </table>
		<!--  table End /////////////////////////////////////-->
	</form>
</div>
<!--  ȭ�鱸�� div End /////////////////////////////////////-->

	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->

<!-- 
<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center"><a href="/getPurchase.do?tranNo=${purchase.tranNo }">${ i }</a></td>
			<td></td>
			<td align="left">
				<a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			<td></td>
			<td align="left">${purchase.receiverName }</td>
			<td></td>
			<td align="left">${purchase.receiverPhone }</td>		
			<td></td>
			<c:choose>
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="left">���籸�ſϷ� �����Դϴ�.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="left">�������� �����Դϴ�.</td>
				</c:when>
				<c:otherwise>
					<td align="left">�����ۿϷ� �����Դϴ�.</td>
				</c:otherwise>
			</c:choose>
			<td></td>
			
			<c:if test="${purchase.tranCode.equals('200')}">
				<td align="left"><a href="/updateTranCode.do?prodNo=${purchase.purchaseProd.prodNo }&tranCode=${purchase.tranCode}">���ǵ���</a></td>
			</c:if>
			
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>	
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		

		 
		<jsp:include page="../common/pageNavigator.jsp"/>	
		
		</td>
	</tr>
</table>

<!--  ������ Navigator ��
</form>

</div>
 -->
</body>
</html>