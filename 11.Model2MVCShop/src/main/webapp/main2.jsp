<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
		 body {
		 	padding-top:80px;
		 }
	body {
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #000;
}

p {
  position: relative;
  font-family: sans-serif;
  text-transform: uppercase;
  font-size: 4em;
  letter-spacing: 4px;
  overflow: hidden;
  background: linear-gradient(90deg, #000, #fff, #000);
  background-repeat: no-repeat;
  background-size: 80%;
  animation: animate 3s linear infinite;
  -webkit-background-clip: text;
  -webkit-text-fill-color: rgba(255, 255, 255, 0);
}

@keyframes animate {
  0% {
    background-position: -500%;
  }
  100% {
    background-position: 500%;
  }
}
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   
      <!-- Main jumbotron for a primary marketing message or call to action -->
     
       <!--  <h1 data-shadow='Model2MVCShop'>Model2MVCShop </h1>-->     
        <p>Model2MVCShop</p>

</body>

</html>