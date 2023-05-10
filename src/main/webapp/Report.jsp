<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.AgeMonthVO"%>
<%@page import="com.smhrd.model.income_expenseVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.assetVO"%>
<%@page import="com.smhrd.model.DAO_G"%>
<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.smhrd.model.userVO"%>
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
<% if(loginD == null){
response.sendRedirect("signin.jsp");	
}	%>

<%
	//내자산
	DAO_G dao = new DAO_G();
	ArrayList<assetVO> myasset = dao.select(loginD.getUser_id());
	System.out.println(myasset.toString());
	int bank_amount=0;
	int card_amount=0;
	int loan_amount=0;
	
	for(int i=0;i<myasset.size();i++){
		bank_amount+=myasset.get(i).getAccount_balance();
		card_amount += myasset.get(i).getDept_card_amount();
		loan_amount += myasset.get(i).getDept_loan_amount();
			
	}
	System.out.println(bank_amount);
	
	//태그
	ArrayList<income_expenseVO> tg_list = dao.tagselect(loginD.getUser_id());
	System.out.print(tg_list.toString());
	int saving =0;//저축,보험
	int foodexpenses = 0;//식비
	int dues =0;//공과금
	int dailynecessity =0;//생필품
	int dmc =0;//품위유지비
	int trans =0;//교통비
	int etc =0;//기타
	for (int i =0; i<tg_list.size();i++){
		if(tg_list.get(i).getItem_tag().equals("저축/보험")){
			saving += (int)tg_list.get(i).getAmount();
		}else if (tg_list.get(i).getItem_tag().equals("식비")){
			foodexpenses += (int)tg_list.get(i).getAmount();
		}else if (tg_list.get(i).getItem_tag().equals("공과금")){
			dues += (int)tg_list.get(i).getAmount();
		}else if (tg_list.get(i).getItem_tag().equals("생필품")){
			dailynecessity += (int)tg_list.get(i).getAmount();
		}else if (tg_list.get(i).getItem_tag().equals("품위유지비")){
			dmc += (int)tg_list.get(i).getAmount();
		}else if (tg_list.get(i).getItem_tag().equals("교통비")){
			trans += (int)tg_list.get(i).getAmount();
		}else if (tg_list.get(i).getItem_tag().equals("기타")){
			etc += (int)tg_list.get(i).getAmount();
		}
	}
	
	//연령대별 수입지출
		ArrayList<AgeMonthVO> avg_20 = dao.avgselect20();
	    System.out.println(avg_20.toString());
	    
		ArrayList<AgeMonthVO> avg_30 = dao.avgselect30();
		System.out.println(avg_30.toString());
		
		ArrayList<AgeMonthVO> avg_40 =dao.avgselect40();
		System.out.println(avg_40.toString());
		
		ArrayList<AgeMonthVO> avg_50 =dao.avgselect50();
		System.out.println(avg_50.toString());
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
				<div class="navbar-nav w-100">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle " data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>메인</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="index.jsp" class="dropdown-item">메인</a> 
							<a href="calendar1.jsp" class="dropdown-item">캘린더</a>
						</div>
						<a href="inout.jsp" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>입/지출</a>
						<a href="UserAsset.jsp" class="nav-item nav-link"><i class="fa fa-th me-2"></i>내 자산</a>
						<div class="nav-item dropdown"> 
						<a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>보고서</a>
							<div class="dropdown-menu bg-transparent border-0">
								<a href="Report.jsp" class="dropdown-item active">보고서</a> 
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


		<!-- Report Start -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4">
				<div class="col-sm-12 col-xl-6">
					<div class="bg-secondary rounded h-100 p-4">
						<h6 class="mb-4">나의 총자산</h6>
						<canvas id="pie-chart2"></canvas>
						<br>
						<div style="text-align: right;">
						<button type="button" class="btn btn-outline-success m-2" onclick="location.href='UserAsset.jsp'">상세보기</button>
						</div>
					</div>
		
         </div>
         <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary rounded h-30 p-4">
                            <h6 class="mb-4">소비 현황</h6>
                            <canvas id="sales"></canvas>
                            <br>
						<div style="text-align: right;">
						<button type="button" class="btn btn-outline-success m-2" onclick="location.href='Details_consumption.jsp'">상세보기</button>
						</div>  
                        </div>
						<div class="bg-secondary rounded h-30 p-4">
                            <h6 class="mb-4">연령별 통계</h6>
                            <canvas id="sales2"></canvas>
                            <br>
						<div style="text-align: right;">
						<button type="button" class="btn btn-outline-success m-2" onclick="location.href='Statistics.jsp'">상세보기</button>
						</div>
                        </div>
						<div class="bg-secondary rounded h-30 p-4">
                            <h6 class="mb-4">연봉별 통계</h6>
                            <canvas id="sales3"></canvas>
                            <br>
						<div style="text-align: right;">
						<button type="button" class="btn btn-outline-success m-2" onclick="location.href='Statistics.jsp'">상세보기</button>
						</div>
                        </div>
          </div>
 
		<!-- Report End -->
		
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
        </div>y
        <!-- Content End -->

<!-- JavaScript Libraries -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/chart/chart.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/easing/easing.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/waypoints/waypoints.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<!-- Template Javascript -->
		<script src="assets/darkpan-1.0.0/js/main.js"></script>
		<script>
		
		// Pie Chart
	    var ctx10 = $("#pie-chart2").get(0).getContext("2d");
	    var myChart10 = new Chart(ctx10, {
	        type: "pie",
	        data: {
	            labels: ["계좌", "카드", "대출"],
	            datasets: [{
	                backgroundColor: [
	                    "rgba(235, 22, 22, .7)",
	                    "rgba(235, 22, 22, .6)",
	                    "rgba(235, 22, 22, .5)",
	                    
	                ],
	                data: [<%=bank_amount%>,
	                	   <%=card_amount%>,
	                	   <%=loan_amount%>]
	            }]
	        },
	        options: {
	            responsive: true
	        }
	    });
	    
		</script>
				<script>
				 // 태그 차트
			    var ctx1 = $("#sales").get(0).getContext("2d");
			    var myChart1 = new Chart(ctx1, {
			        type: "bar",
			        data: {
			            labels: [ "식비", "공과금", "생필품", "품위유지비", "교통비", "기타"],
			            datasets: [{
			            	
			                    label: "저축/보험",
			                    data: [<%=foodexpenses%>,<%=dues%>,<%=dailynecessity%>,<%=dmc%>,<%=trans%>,<%=etc%>],
			                    backgroundColor: "rgba(235, 22, 22, .9)",
			                }]
			            },
			        options: {
			            responsive: true
			        }
			    });
				</script>
				
		<script>
        // 연령대별 월별사용
	     var ctx7 = $("#sales2").get(0).getContext("2d");
	     var myChart7 = new Chart(ctx7, {
	         type: "bar",
	         data: {
	            labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월"],
	            datasets: [{
	                    label: "20대",
	                    data: [<%=avg_20.get(0).getAge_month()%>,
	                    	<%=avg_20.get(1).getAge_month()%>,
	                    	<%=avg_20.get(2).getAge_month()%>,
	                    	<%=avg_20.get(3).getAge_month()%>,
	                    	<%=avg_20.get(4).getAge_month()%>,
	                    	<%=avg_20.get(5).getAge_month()%>,
	                    	<%=avg_20.get(6).getAge_month()%>
	                           ],
	                    backgroundColor: "rgba(235, 22, 22, .7)"
	                },
	                {
	                    label: "30대",
	                    data: [<%=avg_30.get(0).getAge_month()%>,
	                    	<%=avg_30.get(1).getAge_month()%>,
	                    	<%=avg_30.get(2).getAge_month()%>,
	                    	<%=avg_30.get(3).getAge_month()%>,
	                    	<%=avg_30.get(4).getAge_month()%>,
	                    	<%=avg_30.get(5).getAge_month()%>,
	                    	<%=avg_30.get(6).getAge_month()%>],
	                    backgroundColor: "rgba(235, 22, 22, .5)"
	                },
	                {
	                    label: "40대",
	                    data: [<%=avg_40.get(0).getAge_month()%>,
	                    	<%=avg_40.get(1).getAge_month()%>,
	                    	<%=avg_40.get(2).getAge_month()%>,
	                    	<%=avg_40.get(3).getAge_month()%>,
	                    	<%=avg_40.get(4).getAge_month()%>,
	                    	<%=avg_40.get(5).getAge_month()%>,
	                    	<%=avg_40.get(6).getAge_month()%>],
	                    backgroundColor: "rgba(235, 22, 22, .3)"
	                },
	                {
	                    label: "50대",
	                    data: [<%=avg_50.get(0).getAge_month()%>,
	                    	<%=avg_50.get(1).getAge_month()%>,
	                    	<%=avg_50.get(2).getAge_month()%>,
	                    	<%=avg_50.get(3).getAge_month()%>,
	                    	<%=avg_50.get(4).getAge_month()%>,
	                    	<%=avg_50.get(5).getAge_month()%>,
	                    	<%=avg_50.get(6).getAge_month()%>],
	                    backgroundColor: "rgba(235, 22, 22, .2)"
	                }
	            ]
	             },
	         options: {
	             responsive: true
	         }
	     });
		</script>		
		
		<script>
		 var ctx8 = $("#sales3").get(0).getContext("2d");
		    var myChart8 = new Chart(ctx8, {
		        type: "bar",
		        data: {
		            labels: ["2월", "3월", "4월", "5월", "6월", "7월", "8월"],
		            datasets: [{
		                    label: "3천이상",
		                    data: [15, 30, 55, 65, 60, 80, 95],
		                    backgroundColor: "rgba(235, 22, 22, .7)"
		                },
		                {
		                    label: "6천이상",
		                    data: [8, 35, 40, 60, 70, 55, 75],
		                    backgroundColor: "rgba(235, 22, 22, .5)"
		                },
		                {
		                    label: "1억이상",
		                    data: [12, 25, 45, 55, 65, 70, 60],
		                    backgroundColor: "rgba(235, 22, 22, .3)"
		                }
		            ]
		            },
		        options: {
		            responsive: true
		        }
		    });
		</script>

</body>
</html>