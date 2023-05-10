<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.DAO_Z"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.assetVO"%>
<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<% userVO loginD = (userVO) session.getAttribute("loginD"); %>
<% //if(loginD == null){
//response.sendRedirect("signin.jsp");	
//}	%>
	<%DAO_Z dao = new DAO_Z();
	System.out.println(loginD.getUser_id());
	List<assetVO> asvo = dao.myAsset(loginD.getUser_id());	
	
	
	
	if(asvo != null) {
		
	//	System.out.println("유저자산그래프 나옹당");
	}
	else {
	//	System.out.println("유저자산그래프 안나옹다");
	}
	int [] Sum = new int [3];
	for(int i=0; i<asvo.size(); i++) {
		if(asvo.get(i).getAccount_balance() != 0) {
			Sum[0] += asvo.get(i).getAccount_balance();
		}
		if(asvo.get(i).getDept_loan_amount() !=0) {
			Sum[1] += asvo.get(i).getDept_loan_amount();
		}
		if(asvo.get(i).getDept_card_amount() !=0) {
			Sum[2] += asvo.get(i).getDept_card_amount();
		}
		//System.out.println(Sum[0]+Sum[1]+Sum[2]);
	}
	
	//for(int i = 0; i < asvo.size(); i++){
	//	System.out.println("---------------");
	//	System.out.println(asvo.get(i).getDept_card_name());
	//	System.out.println(asvo.get(i).getBank_name());
	//	System.out.println("---------------");
	//	}
	%>
<!--  assetVO total_asset = (assetVO) request.getAttribute("total_asset")
	int conf = dao.assetAll(loginD.getUser_id());
	
	if(conf != 0){
		System.out.println("총자산 나옴");
	}
	else {
		System.out.println("총자산 안나옴");
	}

	 -->

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
						<a href="UserAsset.jsp" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>내 자산</a>
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




<!-- 내자산 start -->


			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary rounded h-100 p-4">
							<h2 class="mb-4" style="text-align: center;">내 자산</h2>
							<canvas id="doughnut-chart"></canvas>
							<br><br>
							<figure>
								<blockquote class="blockquote" style="text-align: center;">
									<h3><%=loginD.getUser_name() %> 님의 총 자산은</h3>
									<br>
									<h3></h3>
									<h3><fmt:formatNumber value="<%=Sum[0]-Sum[1]-Sum[2] %>" pattern="#,###" /> 원입니다.</h3>
								</blockquote>
								<div style="text-align: center;">
									<br>
									<button type="button" class="btn btn-primary w-100 m-2" onclick="location.href='UserAsset_Add.jsp'">자산추가하기</button>
								</div>
							</figure>
						</div>

					</div>
				<!-- 현금성 자산 -->
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary rounded h-100 p-4">
							<div class="border rounded p-4 pb-0 mb-4">

								<div class="bg-secondary rounded h-100 p-4">
									<h5 class="mb-4" style="text-align: center;">현금성 자산</h5>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">은행명</th>
												<th scope="col">잔액</th>
											</tr>
										</thead>
										<tbody>
											<%
											for(int i=0; i<asvo.size(); i++){
												System.out.println(asvo.get(i));
												if(!asvo.get(i).getBank_name().equals("은행선택")){%>
												<tr>
												<th scope='row'><%=i+1%></th>
												<td><%=asvo.get(i).getBank_name()%></td>
												<td><fmt:formatNumber value="<%=asvo.get(i).getAccount_balance()%>" pattern="#,###" /></td>
												</tr>
												<%}
											}%>
										</tbody>
									</table>
								</div>
										
											<!-- <tr>
												<th scope="row">1</th>
												<td>NH농협</td>
												<td>100,000원</td>
												
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>신한은행</td>
												<td>1,000,000원</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>기업은행</td>
												<td>10,000,000원</td>
											</tr> -->
<!-- 부채 - 카드-->
								<div class="bg-secondary rounded h-100 p-4">
									<h5 class="mb-4" style="text-align: center;">부채</h5>
									<h6 class="mb-4" style="text-align: center;">카드</h6>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">No</th>
												<th scope="col">카드명</th>
												<th scope="col">사용금액</th>
											</tr>
										</thead>
										<tbody>
										
										<%
											for(int i=0; i<asvo.size(); i++){
												if(!asvo.get(i).getDept_card_name().equals("카드선택")){%>
													<tr>
													<th scope='row'><%=i+1%></th>
													<td><%=asvo.get(i).getDept_card_name()%></td>
													<td><fmt:formatNumber value="<%=asvo.get(i).getDept_card_amount()%>" pattern="#,###" /></td>
													</tr>
													<%}
												}%>
											<!-- <tr>
												<th scope="row">1</th>
												<td>BC카드</td>
												<td>100,000원</td>
												<td>과자 사먹기</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>삼성카드</td>
												<td>1,000,000원</td>
												<td>술값</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>NH농협</td>
												<td>10,000,000원</td>
												<td>카드론 이자</td>
											</tr> -->
										</tbody>
									</table>
								</div>
								
<!-- 부채 - 대출 -->
								<div class="bg-secondary rounded h-100 p-4">
									<h6 class="mb-4" style="text-align: center;">대출</h6>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">No</th>
												<th scope="col">은행명</th>
												<th scope="col">대출금액</th>
											</tr>
										</thead>
										<tbody>
										
										<%
											for(int i=0; i<asvo.size(); i++){
												if(!asvo.get(i).getDept_loan_name().equals("은행선택") ){%>
													<tr>
													<th scope='row'><%=i+1%></th>
													<td><%=asvo.get(i).getDept_loan_name()%></td>
													<td><fmt:formatNumber value="<%=asvo.get(i).getDept_loan_amount()%>" pattern="#,###" /></td>
													</tr>
													<%}
												}%>
											<!-- <tr>
												<th scope="row">1</th>
												<td>NH농협</td>
												<td>100,000원</td>
												<td>식비</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>국민은행</td>
												<td>1,000,000원</td>
												<td>월세</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>기업은행</td>
												<td>10,000,000,000원</td>
												<td>전세대출</td>
											</tr> -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
	<!-- 내 자산 End -->
	
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
			<script
				src="assets/darkpan-1.0.0/lib/owlcarousel/owl.carousel.min.js"></script>
			<script src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment.min.js"></script>
			<script
				src="assets/darkpan-1.0.0/lib/tempusdominus/js/moment-timezone.min.js"></script>
			<script
				src="assets/darkpan-1.0.0/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

			<!-- Template Javascript -->
			<script src="assets/darkpan-1.0.0/js/main.js"></script>

			<script>
				// Doughnut Chart
				var ctx6 = $("#doughnut-chart").get(0).getContext("2d");
				var myChart6 = new Chart(ctx6, {
					type : "doughnut",
					data : {
						labels : [ "현금성자산", "신용카드", "대출",
								],
						datasets : [ {
							backgroundColor : [ "rgba(235, 22, 22, .7)",
									"rgba(235, 22, 22, .4)",
									"rgba(235, 22, 22, .3)" ],
									data : [<%=Sum[0]%>,<%=Sum[1]%>,<%=Sum[2]%> ]
						} ]
					},
					options : {
						responsive : true
					}
				});
			</script>
</body>
</html>