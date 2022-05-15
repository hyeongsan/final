<%@ page contentType="text/html; charset=euc-kr" %>

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
	
	<!-- Ķ���� -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/addform.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;
	

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}


	document.detailForm.action='/product/addProduct';	
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}


//=============    jQuery =============
	 $(function() {
		
		 $('.addBtn').on("click",function(){
			 console.log("addBtnŬ��Ȯ��");
			 //self.location ="/product/addProduct;
				fncAddProduct();
		 })
		 
		 //Ķ�������
		 $('#datepicker').datepicker({
			 dateFormat: 'yy-mm-dd'
		 });
		
	 });

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
       <h3>��ǰ���</h3>
    </div>
    
<div class="form-horizontal">

	  <div class="form-style">
        <form id="form" name="detailForm" method="POST" enctype="multipart/form-data">
            
            <div class="bold">��ǰ��
                <input class="mar-15b" type="text" name="prodName" placeholder="Enter the product name" required>
            </div>
            
            <div class="bold">��ǰ������
                <input class="mar-15b"  type="text" name="prodDetail" placeholder="Enter the product detail" required>
            </div>
            
            <div class="bold">������¥
            	<input class="mar-15b" name="manuDate" type="text" id="datepicker" placeholder="Enter the manufacture day" readonly required>               
            </div>
            
            <div class="bold">����
                <input class="mar-15b"  type="text" name="price" placeholder="Enter the product price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
            </div>
            
            <div class="bold">
                <input type="file" id="fileName" name="uploadfiles[]" multiple="multiple" >
            </div>
            
          <!--  <input type="file" name="files"> -->  

        	</form>                                   
    	</div>
</div>
    

	
	<div class="col-md-12 text-center "addBtnDiv"">
	  			<button type="button" class="btn btn-primary addBtn">���</button>
	  		</div>
</div>
</body>
</html>