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
@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');

body{
  padding: 40px;
  background-color: #fff;  
}

.text{
	position: absolute;
    top: 50%;
    left: 35%;
}

p {
  border-right: solid 3px rgba(0,255,0,.75);
  white-space: nowrap;
  overflow: hidden;    
  /*font-family: 'Source Code Pro', monospace;*/  
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  font-size: 28px;
  color: rgb(28 28 28 / 70%);
}

/* Animation */
p {
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
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->


	<div class="text">
		<p>happy shopping! ${user.userId }! </p>		
	</div>
</body>

</html>