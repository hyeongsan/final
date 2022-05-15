<%@ page contentType="text/html; charset=euc-kr" %>

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
	
	<!-- 캘린더 -->
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
	//Form 유효성 검증
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;
	

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
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
			 console.log("addBtn클릭확인");
			 //self.location ="/product/addProduct;
				fncAddProduct();
		 })
		 
		 //캘린더사용
		 $('#datepicker').datepicker({
			 dateFormat: 'yy-mm-dd'
		 });
		
	 });

</script>


</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
<div class="page-header text-info">
       <h3>상품등록</h3>
    </div>
<div class="form-horizontal">


	
 
	  <div class="form-style">
        <form id="form" name="detailForm" method="POST" enctype="multipart/form-data">
            
            <div class="bold">상품명
                <input class="mar-15b" type="text" name="prodName" placeholder="Enter the product name" required>
            </div>
            
            <div class="bold">상품상세정보
                <input class="mar-15b"  type="text" name="prodDetail" placeholder="Enter the product detail" required>
            </div>
            
            <div class="bold">제조날짜
            	<input class="mar-15b" name="manuDate" type="text" id="datepicker" placeholder="Enter the manufacture day" readonly required>               
            </div>
            
            <div class="bold">가격
                <input class="mar-15b"  type="text" name="price" placeholder="Enter the product price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
            </div>
            
           <input type="file" name="files">  

            
                          
            
            
            <!-- 
            <h4>Which option best decribes your current role?</h4>
            <select class="select-style mar-15b" name="roles">
                <option value="">Select current role</option>
                <option value="junior engineer">Junior Engineer</option>
                <option value="senior engineer">Senior Engineer</option>
            </select>
            <h4>Would you recommend freeCodeCamp to a friend?</h4>
            <label class="block" for="Definitely">
                <input id="Definitely" type="radio" name="recommendation" value="Definitely" checked="checked">
                Definitely</label>
            <label class="block" for="maybe">
                <input id="maybe" type="radio" name="recommendation" value="maybe">
                Maybe</label>
            <label class="block" for="not-sure">
                <input class="mar-15b" id="not-sure" type="radio" name="recommendation" value="not sure">
                Not sure</label>
            <h4>What is your favorite feature of freCodeCamp</h4>
            <select class="select-style mar-15b" name="fav-feature">
                <option value="">Select an option</option>
                <option value="side by side practice">Side by side practice</option>
                <option value="open source">Open source</option>
                <option value="valid-cert.">Valid-certification</option>
            </select>
            <h4>What would you like to see improved?</h4>
            <label class="block" for="front-end-project">
                <input id="front-end-project" type="checkbox" name="improvisation" value="front-end projects"> Front-end Projects
            </label>
            <label class="block" for="back-end-proj">
                <input id="back-end-proj" type="checkbox" name="improvisation" value="back-end projects"> Back-end Projects
            </label>
            <label class="block" for="data-visualisation">
                <input id="data-visualisation" type="checkbox" name="improvisation" value="data-visualization"> Data Visualization
            </label>
            <label class="block" for="Challenges">
                <input id="Challenges" type="checkbox" name="improvisation" value="Challenges"> Challenges
            </label>
            <label class="block" for="open-source">
                <input id="open-source" type="checkbox" name="improvisation" value="Open Source Community"> Open Source Community
            </label>
            <label class="block" for="help-room">
                <input id="help-room" type="checkbox" name="improvisation" value="Gitter help rooms"> Gitter help rooms
            </label>
            <label class="block" for="videos">
                <input id="videos" type="checkbox" name="improvisation" value="Videos"> Videos
            </label>
            <label class="block" for="city-meetups">
                <input id="city-meetups" type="checkbox" name="improvisation" value="City Meetups"> City Meetups
            </label>
            <label class="block" for="wiki">
                <input id="wiki" type="checkbox" name="improvisation" value="Wiki"> Wiki
            </label>
            <label class="block" for="forum">
                <input id="forum" type="checkbox" name="improvisation" value="Forum"> Forum
            </label>
            <label class="block mar-15b" for="Additional-courses">
                <input id="Additional-courses" type="checkbox" name="improvisation" value="Additional Courses"> Additional Courses
            </label>
            <label for="comments">Any comments or suggestions?</label>
            <textarea class="select-style" id="comments" name="comments" rows="5" placeholder="Enter your comments here..."></textarea>
            <div>
                <hr class="hr-style">
                <button class="select-style bg-green" type="submit">Sumbit</button>
            </div>
             -->
        	</form>                                   
    	</div>
    </div>
    

	
	<div class="col-md-12 text-center "addBtnDiv"">
	  			<button type="button" class="btn btn-primary addBtn">등록</button>
	  		</div>
</div>
</body>
</html>