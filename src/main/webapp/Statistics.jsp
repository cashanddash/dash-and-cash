<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.assetVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.DAO_Z"%>
<%@page import="com.smhrd.model.income_expenseVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.DAO_G"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.userVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%
	userVO loginD = (userVO) session.getAttribute("loginD");
	DAO_G dao = new DAO_G();
	ArrayList<income_expenseVO> ie_list = dao.selectlist(loginD.getUser_id());
	DAO_Z dao2 = new DAO_Z();
	List<assetVO> asvo = dao2.myAsset(loginD.getUser_id());

	int[] Sum = new int[3];
	for (int i = 0; i < asvo.size(); i++) {
		if (asvo.get(i).getAccount_balance() != 0) {
			Sum[0] += asvo.get(i).getAccount_balance();
		}
		if (asvo.get(i).getDept_loan_amount() != 0) {
			Sum[1] += asvo.get(i).getDept_loan_amount();
		}
		if (asvo.get(i).getDept_card_amount() != 0) {
			Sum[2] += asvo.get(i).getDept_card_amount();
		}
		System.out.println(Sum[0] + Sum[1] + Sum[2]);
	}
	%>
	<div id="income" style="display: none">
		수입 :<%
	int income = 0;
	for (int i = 0; i < ie_list.size(); i++) {
	%>
		<%
		if (ie_list.get(i).getItem_type().equals("수입")) {
		%>
		<%
		income += (int) ie_list.get(i).getAmount();
		}
		%>
		<%
		}
		%>
		<%=income%></div>

	<div id="expense" style="display: none">
		지출 :<%
	int expense = 0;
	for (int i = 0; i < ie_list.size(); i++) {
	%>
		<%
		if (ie_list.get(i).getItem_type().equals("지출")) {
		%>
		<%
		expense += (int) ie_list.get(i).getAmount();
		}
		%>
		<%
		}
		%>
		<%=expense%></div>

	<%
	if (loginD == null) {
		response.sendRedirect("signin.jsp");
	}
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
						if (loginD == null) {
						%>
						<a href="signin.jsp"><h6 class="ms-3">로그인이 필요합니다</h6></a>
						<%
						} else {
						%>
						<h6 class="lolog">
							&nbsp;&nbsp;&nbsp;<%=loginD.getUser_nick()%>님 환영합니다!
						</h6>
						<%
						}
						%>
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
						<a href="#" class="nav-link dropdown-toggle "
							data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>메인</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="index.jsp" class="dropdown-item">메인</a> <a
								href="calendar1.jsp" class="dropdown-item">캘린더</a>
						</div>
						<a href="inout.jsp" class="nav-item nav-link"><i
							class="fa fa-laptop me-2"></i>입/지출</a> <a href="UserAsset.jsp"
							class="nav-item nav-link"><i class="fa fa-th me-2"></i>내 자산</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle active"
								data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>보고서</a>
							<div class="dropdown-menu bg-transparent border-0">
								<a href="Report.jsp" class="dropdown-item">보고서</a> <a
									href="Details_consumption.jsp" class="dropdown-item">소비현황</a> <a
									href="Statistics.jsp" class="dropdown-item active">통계</a>
							</div>
						</div>
						<a href="TargetList.jsp" class="nav-item nav-link"><i
							class="fa fa-table me-2"></i>목표</a>
					</div>
				</div>
			</nav>
		</div>
		<!-- Sidebar End -->

		<!-- Content Start -->
		<div class="content">

			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
				<a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-user-edit"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i></a>
				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<%
						if (loginD == null) {
						%>

						<a href="signin.jsp"><span class="ms-3"> 로그인이 필요합니다</span></a>
						<%
						} else {
						%>
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2"
							src="assets/darkpan-1.0.0/img/user.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex"><%=loginD.getUser_nick()%></span>
							<%
							}
							%>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
							<a href="Mypage.jsp" class="dropdown-item">마이페이지</a> <a
								href="Mypage_modify.jsp" class="dropdown-item">마이페이지 수정</a> <a
								href="Enterance.jsp" class="dropdown-item">로그아웃</a>
						</div>


					</div>
				</div>
			</nav>
			<!-- Navbar End -->

			<!-- 통계시작 -->


			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">연령별 소득 평균</h6>
							<span>(단위 : 만원)</span>
							<canvas id="Salary_on_ages" width="450" height="230"
								style="display: block; box-sizing: border-box; height: 230px; width: 450px;"></canvas>
						</div>
					</div>
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">연령별 총 자산 평균</h6>
							<span>(단위 : 만원)</span>
							<canvas id="assets_on_ages" width="450" height="230"
								style="display: block; box-sizing: border-box; height: 230px; width: 450px;"></canvas>
						</div>
					</div>
				</div>
			</div>


			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">연령별 월 소비량 평균</h6>
							<span>(단위 : 원)</span>
							<canvas id="month_spendings_by_ages" width="450" height="230"
								style="display: block; box-sizing: border-box; height: 230px; width: 450px;"></canvas>
						</div>
					</div>
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">소득구간별 월 소비량 평균</h6>
							<span>(단위 : 만원)</span>
							<canvas id="month_spendings_by_earnings" width="450" height="230"
								style="display: block; box-sizing: border-box; height: 230px; width: 450px;"></canvas>
						</div>
					</div>
				</div>
			</div>

			<!-- Footer Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary rounded-top p-4">
					<div class="row">
						<div class="col-12 col-sm-6 text-center text-sm-start">
							&copy; <a href="index.jsp">CASH&DASH</a>, All Right Reserved.
						</div>
						<div class="col-12 col-sm-6 text-center text-sm-end">
							<a style="color: #EB1616;">Team:</a><a>Dash&Cash</a> <br> <a
								style="color: #EB1616;">Member:</a><a>CJH.GGW.LCM.JHM.JYJ.KSM</a>
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

		<!-- 막대그래프 Script -->

		<%
		int salary = loginD.getUser_salary() * 1000;
		int sum = Sum[0] - Sum[1] - Sum[2] / 10000;
		int Expense = expense / 12;
		%>
		<script type="text/javascript">
         
	         Chart.defaults.color = "#6C7293";
             Chart.defaults.borderColor = "#000000";
	
             var age = <%=Integer.parseInt(loginD.getUser_age())%>; 
             var sal = <%=salary%>;
             var str1;
             var str2;
             var str3;
             var str4;
             
            
             
			if (age < 30){
				str1 = [sal, 0,  0, 0, 0];
			} 
			else if(age >=30 && age<40){
				str1 = [0, sal, 0, 0, 0];
			}
			else if(age >= 40 && age < 50){
				str1 = [0, 0, sal, 0, 0];
			}
			else if (age >= 50 && age <60){
				str1 = [0, 0, 0,sal, 0];
			}
			else {
				str1 = [0, 0, 0,0, sal];
			}
         	
             
             // 연령별 소득 평균
             var ctx1 = $("#Salary_on_ages").get(0).getContext("2d");
             var myChart1 = new Chart(ctx1, {
                 type: "bar",
                 data: {
                     labels: ["20대", "30대", "40대", "50대", "60대 이상"],
                     datasets: [{
                             label: "소득평균",
                             data: [3144.5, 4582.5, 5542, 5430.5, 4239],
                             backgroundColor: "rgba(255,255,36, .7)" }, 
                             
                             {label: "나의 소득",
                              data: str1,
                              backgroundColor: "rgba(245,255,250, .7)"
                          }]
                     },
                 options: { responsive: true }
             });
             
             var expense = <%=Expense%>
             
     		if (age < 30){
				str2 = [expense, 0,  0, 0, 0];
			} 
			else if(age >=30 && age<40){
				str2 = [0, expense, 0, 0, 0];
			}
			else if(age >= 40 && age < 50){
				str2 = [0, 0, expense, 0, 0];
			}
			else if (age >= 50 && age <60){
				str2 = [0, 0, 0,expense, 0];
			}
			else {
				str2 = [0, 0, 0, 0, expense];
			}
             
                  // 연령별 월 소비량 평균  
              var ctx2 = $("#month_spendings_by_ages").get(0).getContext("2d");
              var myChart2 = new Chart(ctx2, {
                  type: "bar",
                  data: {
                      labels: ["20대", "30대", "40대", "50대", "60대이상"],
                      datasets: [{
                              label: "소비량 월 평균",
                              data: [3078632, 2839233, 4231157, 3974838, 2369185],
                              backgroundColor: "rgba(173,255,47, .7)"
                          }, {
                              label: "나의 소비량",

                              data: str2,

                              backgroundColor: "rgba(255,250,250, .7)"
                          }]                      
                      },
                  options: {
                      responsive: true
                  }
              });
              
              if(sal <3000){
            	  str3 = [expense, 0,  0, 0];
              }
              else if (sal>=3000 && sal<4000){
            	  str3 = [0, expense,  0, 0];
              }
              else if(sal>=4000 && sal<5000){
            	  str3 = [0, 0, expense, 0];
              }
              else if(sal>=5000 && sal<6000){
            	  str3 = [0, 0, 0, expense];
              }
                           
              // 소득구간별 월 소비량 평균  
              var ctx4 = $("#month_spendings_by_earnings").get(0).getContext("2d");
              var myChart4 = new Chart(ctx4, {
                  type: "bar",
                  data: {
                      labels: ["3000만원이하", "4000~5000만원", "5000~6000만원", "6000만원이상"],
                      datasets: [{
                              label: "소비량 평균",
                              data: [2254467, 2729463, 3919575,4764427],
                              backgroundColor: "rgba(30,144,255, .7)"
                          }, {
                              label: "나의 소비량",

                              data: str3,

                              backgroundColor: "rgba(255,250,250, .7)"
                          }]                      
                      },
                  options: {
                      responsive: true
                  }
              });
              
              var totalSum = <%=sum%>
             
          	if (age < 30){
				str4 = [totalSum, 0,  0, 0, 0];
			} 
			else if(age >=30 && age<40){
				str4 = [0, totalSum, 0, 0, 0];
			}
			else if(age >= 40 && age < 50){
				str4 = [0, 0, totalSum, 0, 0];
			}
			else if (age >= 50 && age <60){
				str4 = [0, 0, 0,totalSum, 0];
			}
			else {
				str4 = [0, 0, 0,0, totalSum];
			}
              
               // 연령별 총 자산 평균
             var ctx6 = $("#assets_on_ages").get(0).getContext("2d");
             var myChart6 = new Chart(ctx6, {
                 type: "bar",
                 data: {
                     labels: ["20대", "30대", "40대", "50대", "60대이상"],
                     datasets: [{
                             label: "총 자산 평균",
                             data: [7489, 21904, 31246, 37026,33772],
                             backgroundColor: "rgba(255,20,147, .7)"
                         }, {
                              label: "나의 총 자산",

                              data: str4,


                              backgroundColor: "rgba(255,250,250, .7)"
                          }]
                     },
                 options: {
                     responsive: true
                 }
             });
             
          
         
         
         </script>
</body>
</html>