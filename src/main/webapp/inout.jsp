<%@page import="com.smhrd.model.PagingVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.DAO_G"%>
<%@page import="com.smhrd.model.income_expenseVO"%>
<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">
#income {
	display: inline;
	position: relative;
}

#expense {
	display: inline;
	position: relative;
	left: 550px;
}

#all {
	display: inline;
	position: relative;
	left: 1100px;
}

.col-sm-12 .col-xl-12 {
	height: 300px;
	width: 300px;
}
</style>
</head>

<body>
	<%
	userVO loginD = (userVO) session.getAttribute("loginD");
	%>
	<%
	if (loginD == null) {
		response.sendRedirect("signin.jsp");
	}
	%>
	<%
	DAO_G dao = new DAO_G();
	ArrayList<income_expenseVO> ie_list = dao.selectlist(loginD.getUser_id());

	System.out.print(ie_list.toString());
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
						<a href="inout.jsp" class="nav-item nav-link active"><i
							class="fa fa-laptop me-2"></i>입/지출</a> <a href="UserAsset.jsp"
							class="nav-item nav-link"><i class="fa fa-th me-2"></i>내 자산</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown"><i class="fa fa-chart-bar me-2"></i>보고서</a>
							<div class="dropdown-menu bg-transparent border-0">
								<a href="Report.jsp" class="dropdown-item">보고서</a> <a
									href="Details_consumption.jsp" class="dropdown-item">소비현황</a> <a
									href="Statistics.jsp" class="dropdown-item">통계</a>
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
								href="logoutservice" class="dropdown-item">로그아웃</a>
						</div>


					</div>
				</div>
			</nav>
			<!-- Navbar End -->


			<!--chart start  -->
			<div class="container-fluid pt-4 px-4">
				<div class="col-sm-12 col-xl-8" style="padding-left: 500px">
					<div class="bg-secondary rounded h-100 p-4">
						<h6 class="mb-4" style="text-align: center;">입/지출 상세내역</h6>
						<canvas id="pie-chart"></canvas>
					</div>
				</div>
			</div>

			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary rounded-top p-4">
					<div class="row">
						<div class="col-12 col-sm-6 text-center text-sm-start">
							<h6 id="income">
								수입&nbsp;:&nbsp;<%
							int income = 0;
							for (int i = 0; i < ie_list.size(); i++) {
								if (ie_list.get(i).getItem_type().equals("수입")) {
									income += (int) ie_list.get(i).getAmount();
								}
							}
							%>
								<a style="color: #6C7293">
								<fmt:formatNumber value="<%=income%>" pattern="#,###" /> 원</a>
							</h6>
							<h6 id="expense">
								지출&nbsp;:&nbsp;<%
							int expense = 0;
							for (int i = 0; i < ie_list.size(); i++) {
								if (ie_list.get(i).getItem_type().equals("지출")) {
									expense += (int) ie_list.get(i).getAmount();
								}
							}
							%><a style="color: #6C7293"><fmt:formatNumber
										value="<%=expense%>" pattern="#,###" />원</a>
							</h6>
							<h6 id="all">
								전체&nbsp;:&nbsp;<a style="color: #6C7293"><fmt:formatNumber
										value="<%=income - expense%>" pattern="#,###" />원</a>
							</h6>
						</div>
					</div>
				</div>
			</div>
			<!--  chart end  -->

			<!-- Table Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary rounded-top p-4">
					<div class="col-sm-12 col-xl-12"
						style="padding-left: 20px; padding-right: 20px;">
						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">입지출 현황</h6>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">no</th>
											<th scope="col">일자</th>
											<th scope="col">은행명</th>
											<th scope="col">거래내역</th>
											<th scope="col">입금</th>
											<th scope="col">지출액</th>

										</tr>
									</thead>
									<tbody>
										<%
										PagingVO paging = new PagingVO();
										paging.setCurPage(1);
										paging.setTotalRowCount(ie_list.size());
										paging.pageSetting();

										System.out.println(paging);
										%>

										<%
										for (int i = 0; i < ie_list.size(); i++) {
										%>
										<tr>
											<th scope="row"><%=i + 1%></th>
											<td><%=ie_list.get(i).getItem_dt()%></td>
											<td><%=ie_list.get(i).getItem_content()%></td>
											<td><%=ie_list.get(i).getItem_type()%></td>
											<%
											if (ie_list.get(i).getItem_type().equals("지출")) {
											%>
											<td></td>
											<td><fmt:formatNumber
													value="<%=ie_list.get(i).getAmount()%>" pattern="#,###" /></td>
											<%
											}
											%>
											<%
											if (ie_list.get(i).getItem_type().equals("수입")) {
											%>
											<td><fmt:formatNumber
													value="<%=ie_list.get(i).getAmount()%>" pattern="#,###" /></td>
											<td></td>
										</tr>
										<%
										}
										%>
										<%
										}
										%>

									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Table End -->


			<!-- Footer Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary rounded-top p-4">
					<div class="row">
						<div class="col-12 col-sm-6 text-center text-sm-start">
							&copy; <a href="#">CASH&DASH</a>, All Right Reserved.
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

		<script>
			// Pie Chart
			var ctx5 = $("#pie-chart").get(0).getContext("2d");
			var myChart5 = new Chart(ctx5, {
				type : "pie",
				data : {
					labels : [ "지출", "수입" ],
					datasets : [ {
						backgroundColor : [ "rgba(235, 22, 22, .7)",
								"rgba(235, 22, 22, .6)", ],
						data : [
		<%=expense%>
			,
		<%=income%>
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