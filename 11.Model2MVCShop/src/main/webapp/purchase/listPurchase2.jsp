<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<html>
<head>

	
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


<title>구매 목록조회</title>


	<style>
	  body {
            padding-top : 50px;
        }
        
        .tableHeader th{
         text-align:center;
        }
    </style>
<script type="text/javascript">

//검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
function fncGetPageList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
 	document.detailForm.submit();		
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header text-info">
		       <h3>구매목록조회</h3>
		</div>
		
		 <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		 <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr class="tableHeader">
            <th align="center">No</th>
            <th align="center" >상품명</th>
            <th align="center">배송현황</th>  
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="center" class="view" value="${purchase.tranNo }">${purchase.purchaseProd.prodName }</td>	
			  
			  <c:choose>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">구매 취소된 상품입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('100')}">
					<td align="center">현재 구매완료 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('002')}">
					<td align="center">현재 배송중 상태입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="center">현재 배송완료 상태입니다.</td>
				</c:otherwise>
		      </c:choose>
			  
			  <c:choose>
			  <c:when test="${purchase.tranCode.equals('002')}">
					<td align="center" class="divy" value1="${purchase.tranNo }" value2="${purchase.tranCode}">물건도착</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('001')}">
					<td align="center" class="cancel"  value1="${purchase.tranNo }" value2="${purchase.tranCode}">구매취소</a>
				</c:when>
				<c:when test="${purchase.tranCode.equals('000')}">
					<td align="center">구매취소완료</td>
				</c:when>
				<c:otherwise>
					<td align="center">수정사항 없음</td>
				</c:otherwise>
			  	</c:choose>
			  	
			  <td align="center">
			  	<i class="glyphicon glyphicon-ok" id= "${purchase.tranNo}"></i>
			  	<input type="hidden" value="${purchase.tranNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	</div>
<!--  화면구성 div End /////////////////////////////////////-->

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
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
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
					<td align="left">현재구매완료 상태입니다.</td>
				</c:when>
				<c:when test="${purchase.tranCode.equals('200')}">
					<td align="left">현재배송중 상태입니다.</td>
				</c:when>
				<c:otherwise>
					<td align="left">현재배송완료 상태입니다.</td>
				</c:otherwise>
			</c:choose>
			<td></td>
			
			<c:if test="${purchase.tranCode.equals('200')}">
				<td align="left"><a href="/updateTranCode.do?prodNo=${purchase.purchaseProd.prodNo }&tranCode=${purchase.tranCode}">물건도착</a></td>
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


</form>

</div>
 -->
</body>
</html>