<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cash&dash</title>
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">


<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="assets/darkpan-1.0.0/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="assets/darkpan-1.0.0/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="assets/darkpan-1.0.0/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="assets/darkpan-1.0.0/css/style.css" rel="stylesheet">
</head>

<body>
<%userVO loginD = (userVO)session.getAttribute("loginD"); %>
<% if(loginD != null){
response.sendRedirect("Mypage.jsp");	
}	%>

	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-secondary navbar-dark">
				<a href="signin.jsp" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">CASH&DASH</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
					<%
						if(loginD==null){%>
						<a href="signin.jsp"><h6 class="ms-3"> 로그인이 필요합니다</h6></a>
					<%}else{%>
						<h6 class="lolog">&nbsp;&nbsp;&nbsp;<%=loginD.getUser_nick() %>님 환영합니다!</h6>	
					<%}%>
						<!--  <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">로그인한 아이디가 보여지는 공간</h6>
                        <span>일반회원</span> -->
					</div>
				</div>
				
			</nav>
		</div>
		<!-- Sidebar End -->
		
		<!-- Content Start -->
		<div class="content">
		
			<!-- Navbar Start -->
			<nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
				<a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-user-edit"></i>
					</h2>
				</a> 
		
				<a href="#" class="sidebar-toggler flex-shrink-0"> <i class="fa fa-bars"></i></a>
				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<%if(loginD==null){ %>

							<a href="signin.jsp"><span class="ms-3"> 로그인이 필요합니다</span></a>
							<%}else{ %>
							<a href="#" class="nav-link dropdown-toggle"data-bs-toggle="dropdown"> 
							<img class="rounded-circle me-lg-2" src="assets/darkpan-1.0.0/img/user.jpg" alt="" style="width: 40px; height: 40px;"> 
							<span class="d-none d-lg-inline-flex"><%=loginD.getUser_nick() %></span>
							<%} %>
						</a>
						<div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
							<a href="Mypage.jsp" class="dropdown-item">마이페이지</a> 
							<a href="Mypage_modify.jsp" class="dropdown-item">마이페이지 수정</a> 
							<a href="logoutservice" class="dropdown-item">로그아웃</a>
						</div>


					</div>
				</div>
			</nav>
			<!-- Navbar End -->
			
            
            
            <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="signin.jsp" class="">
                                <h3 class="text-primary">Cash&Dash</h3>
                            </a>
                            <h3>로그인</h3>
                        </div>
                      <form action="loginservice" method="post">  
                        <div class="form-floating mb-3">
                            <input name="user_id" id="user_id" type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">아이디</label>
                            
                        </div>
                        <div class="form-floating mb-4">
                            <input name="user_pw" id="user_pw" type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">패스워드</label>
                        </div>
                        <button type="submit" class="btn btn-primary py-3 w-100 mb-4" onclick="signin();">로그인</button>
                        </form>
                       <script>
                       function signin(){
                    	   var user_id=$("#user_id").val();
                    	   var user_pw=$("#user_pw").val();
                    	   $.ajax({
                               url : "loginservice",
                               method : "post",                             
                               data : {"user_id":user_id,"user_pw":user_pw},
                               success : function(data){ 
                            	   if(data!=-1){
                            	     alert("로그인 성공");
                            	     location.href = "index.jsp";
                            	   }else{
                            		 alert("로그인 실패");
                            		 location.href ="signin.jsp";
                            	   }                               
                               },
                               error : function(err) {
                                  alert("아이디와 패스워드를 확인하세요.");
                                  location.href ="signin.jsp";
                               }
                            });

                       }
                       </script>
                        <p class="text-center mb-0">캐시앤대시 회원이 아니십니까? <a href="signup.jsp">회원가입</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
   
   		<!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start"> &copy; <a href="index.jsp">CASH&DASH</a>, All Right Reserved.</div>
                        <div class="col-12 col-sm-6 text-center text-sm-end"> 
                            <a style="color:#EB1616;">Team:</a><a>Dash&Cash</a>
                            <br>
                            <a style="color:#EB1616;">Member:</a><a>CJH.GGW.LCM.JHM.JYJ.KSM</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->
            

<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/chart/chart.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/easing/easing.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/waypoints/waypoints.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<!-- Template Javascript -->
		<script src="assets/darkpan-1.0.0/js/main.js"></script>
</body>
</html>