<%@page import="com.smhrd.virtualData.bankDAO"%>
<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.targetVO"%>
<%@page import="com.smhrd.model.DAO_L"%>
<%@page import="com.smhrd.model.DAO_S"%>
<%@page import="com.smhrd.model.DAO_G"%>
<%@page import="com.smhrd.model.income_expenseVO"%>
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
<style>
.cal_{
	color : white;
	text-align: center;
}
.list_{
	color : #6C7293;
}
.tgdel{
	font-size : 30px;
	color: #74b9ff;
}


</style>

</head>

<body>
<%userVO loginD = (userVO)session.getAttribute("loginD"); %>
<% if(loginD == null){
response.sendRedirect("signin.jsp");	
}
DAO_S daos = new DAO_S();
ArrayList<income_expenseVO> list1 = daos.ietgroupSelects(loginD.getUser_id());
DAO_G daog = new DAO_G();
ArrayList<income_expenseVO> ie_list = daog.selectlist(loginD.getUser_id());

%>

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
				<a href="index.jsp" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">CASH&DASH</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
					<%
						if(loginD==null){%>
						<a href="signin.jsp"><h6 class="ms-3"> 로그인이 필요합니다</h6></a>
					<%}else{%>
						<h6 class="lolog">
							&nbsp;&nbsp;&nbsp;<%=loginD.getUser_nick()%>님 환영합니다!
						</h6>	
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
				<div class="navbar-nav w-100">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>메인</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="index.jsp" class="dropdown-item active">메인</a> 
							<a href="calendar1.jsp" class="dropdown-item">캘린더</a>
						</div>
						<a href="inout.jsp" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>입/지출</a>
						<a href="UserAsset.jsp" class="nav-item nav-link"><i class="fa fa-th me-2"></i>내 자산</a>
						<div class="nav-item dropdown"> 
						<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>보고서</a>
							<div class="dropdown-menu bg-transparent border-0">
								<a href="Report.jsp" class="dropdown-item">보고서</a> 
								<a href="Details_consumption.jsp"class="dropdown-item">소비현황</a> 
								<a href="Statistics.jsp"class="dropdown-item">통계</a>
							</div>
						</div>
						<a href="TargetList.jsp" class="nav-item nav-link"><i class="fa fa-table me-2"></i>목표</a>
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
			
			
			<!-- 본문 Start -->

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6">
						<div class="h-50 bg-secondary rounded p-4">
						<div class="border rounded p-4 pb-0 mb-4">
							<div class="d-flex align-items-center justify-content-between mb-4">
								<h3 class="mb-0"><a class="cal_">📅캘린더</a></h3>
								<a href="calendar1.jsp">자세히보기</a>
							</div>
						
							<div id="calender"></div><br>
						</div>
						</div>
						<div class="bg-secondary rounded h-50 p-4 " style="display : flex; justify-content: center; align-items : center;">
							<div> <h2 class="mb-4">✨목표리스트✨</h2><br><br>
							<%
                           	DAO_L dao = new DAO_L();
                           	// 실습
               				// MessageDAO 클래스 안에 messageSelect()메소드를 구현하시오
               				// session id값은 messageSelect로 해주세요
							ArrayList<targetVO> list = dao.target_name_call(loginD.getUser_id());                           	
        					if(list.size() != 0){
                           	for(int i = 0; i< list.size(); i++){%>

                             <h3><li><%=list.get(i).getTarget_name()%></li></h3>
                    
                           	<%}
        					}else{%>
                           		<h3 class="tgadd">목표를 추가해주세요</h3>
                           	<%}%>
							<br>
							
							<button type="button" class="btn btn-lg btn-primary m-2" onclick="location.href='TargetList.jsp'">&emsp;&emsp;&emsp;&emsp;목표 상세 보러가기&emsp;&emsp;&emsp;&emsp;</button>
							
							</div>
							
						</div>
					</div>


					<div class="col-md-6 text-center">
					<div class="h-100 bg-secondary rounded p-4">
					<h3>항목별 지출</h3>
						<canvas id="pie-chart"></canvas>
					</div>
					</div>

				</div>
			</div>
			

			<div class="container-fluid pt-4 px-4">
				
			</div>
			<!-- 본문 End -->
			
			
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
	<script
		src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="assets/darkpan-1.0.0/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="assets/darkpan-1.0.0/js/main.js"></script>
	<script>
		// Pie Chart
		var ctx = $("#pie-chart").get(0).getContext("2d");
		var pie_chart = new Chart(
				ctx,
				{

					type : "pie",
					data : {
						labels : [
									//for (int i = 0; i < list.size(); i++) {
									//	out.print("\"" + list.get(i).getItem_tag() + "\",");
									//		}%>
										],
						datasets : [ {
							backgroundColor : [ "rgba(235, 22, 22, .7)",
									"rgba(235, 22, 22, .6)",
									"rgba(235, 22, 22, .5)",
									"rgba(235, 22, 22, .4)",
									"rgba(235, 22, 22, .3)",
									"rgba(235, 22, 22, .2)",
									"rgba(235, 22, 22, .1)", ],
							data : [
						<%for (int i = 0; i < list1.size(); i++) {
								out.print(list1.get(i).getAmount() + ",");
							}%>
																]
						} ]
					},
					options : {
						responsive : true
					}
				});

	</script>
</body>
</html>
<body>

</body>
</html>