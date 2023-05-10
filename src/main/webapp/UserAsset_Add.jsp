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
						<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>메인</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="index.jsp" class="dropdown-item">메인</a> 
							<a href="calendar1.jsp" class="dropdown-item">캘린더</a>
						</div>
						<a href="inout.jsp" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>입/지출</a>
						<a href="UserAsset.jsp" class="nav-item nav-link  active"><i class="fa fa-th me-2"></i>내 자산</a>
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
	<!-- 유저자산추가 start -->
	
	
	<script type="text/javascript">
		function showHideDiv(){
			var ckMoney = document.getElementById("ckMoney");
			var ckDep = document.getElementById("ckDep");
			mon_choice.style.display = ckMoney.checked ? "block" : "none";
			
			if(mon_choice.style.display == 'block'){
				dep_choice.style.display = 'none';
			}
			else if (mon_choice.style.display == 'none'){
				dep_choice.style.display = 'block';
			}
		}
	</script>
	
	<div class="container-fluid pt-4 px-4"  style="display : flex; justify-content: center; align-items : center;">
			<div class="col-sm-12 col-xl-6">
				<div class="bg-secondary rounded h-100 p-4">
					<h2 class="mb-4" style="text-align: center;">내 자산 추가</h2>
					<div class="form-check">
							<form name="frm" action="assetAddservice" method="post">
							
								<input class="form-check-input" type="radio"
									name="flexRadioDefault" id="ckMoney" onclick="showHideDiv()">
								<label class="form-check-label" for="ckMoney"><h6>현금성 자산</h6></label> 
								
								
								<div id="mon_choice" style="display:block">
								
								<select class="form-select mb-3" name="bank_name" aria-label="Default select example">
									<option >은행선택</option>
									<option value="NH농협">NH농협</option>
									<option value="KB국민은행">KB국민은행</option>
									<option value="신한은행">신한은행</option>
									<option value="KEB하나은행">KEB하나은행</option>
									<option value="SC제일은행">SC제일은행</option>
									<option value="우리은행">우리은행</option>
									<option value="기업은행">기업은행</option>
									<option value="한국씨티은행">한국씨티은행</option>
								</select>
								<div class="row mb-3">
									<label for="inputEmail3" class="col-sm-2 col-form-label">잔액작성</label>
									<div class="col-sm-10">
										<input type="NUMBER" name="account_balance" class="form-control" id="inputEmail3">
									</div>
								</div>
						</div>
					<br>
					<br>
					<div>
					<div class="form-check">
						<input class="form-check-input" type="radio" onclick="showHideDiv()"
							name="flexRadioDefault" id="ckDep"> <label
							class="form-check-label" for="ckDep"><h6>부채</h6></label>
							
						<div id="dep_choice" style="display: none">
						
							<div class="form-check form-check-inline">
							
								<input class="form-check-input" type="radio" onclick="showHideDep()"
									name="inlineRadioOptions" id="ckCard" value="option1">
								<label class="form-check-label" for="inlineRadio1">신용카드</label>
							</div>
							
							
							<script type="text/javascript">
								function showHideDep(){
									var ckCard =document.getElementById("ckCard");
									var ckLoan =document.getElementById("ckLoan");
									card_choice.style.display = ckCard.checked ? "block" : "none";
									
									if(card_choice.style.display == 'block'){
										loan_choice.style.display ='none';
									}
									else if(card_choice.style.display == 'none'){
										loan_choice.style.display ='block';
									}
									
								}
							</script>
<!-- 신용카드 -->
							<div id="card_choice" style="display: block">
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">카드명</label>
								<select class="form-select mb-3" name="dept_card_name" 
									aria-label="Default select example">
									<option >카드선택</option>
									<option value="BC카드">BC카드</option>
									<option value="국민카드">KB국민카드</option>
									<option value="신한카드">신한카드</option>
									<option value="삼성카드">삼성카드</option>
									<option value="롯데카드">롯데카드</option>
									<option value="우리카드">우리카드</option>
									<option value="하나카드">하나카드</option>
									<option value="NH농협카드">NH농협카드</option>
									<option value="IBK기업은행카드">IBK기업은행카드</option>
									<option value="현대카드">현대카드</option>
								</select>
							</div>

						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">사용
								액</label>
							<div class="col-sm-10">
								<input type="text" name="dept_card_amount" class="form-control" id="inputEmail3">
							</div>
						</div>
						
						</div>
						

						

						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" onclick="showHideDep()"
								name="inlineRadioOptions" id="ckLoan" value="option2">
							<label class="form-check-label" for="inlineRadio2">대출</label>
						</div>
						<!-- 대출 -->
						<div id="loan_choice" style="display: none">
							<div>
							<select class="form-select mb-3" name="dept_loan_name"
								aria-label="Default select example">
								<option>은행선택</option>
								<option value="NH농협">NH농협</option>
								<option value="KB국민은행">KB국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="KEB하나은행">KEB하나은행</option>
								<option value="SC제일은행">SC제일은행</option>
								<option value="우리은행">우리은행</option>
								<option value="기업은행">기업은행</option>
								<option value="한국씨티은행">한국씨티은행</option>
							</select>
						</div>
					


				<div class="row mb-3">
					<label for="inputEmail3" class="col-sm-2 col-form-label">사용액</label>
					<div class="col-sm-10">
						<input type="text" name="dept_loan_amount" class="form-control" id="inputEmail3">
					</div>
				</div>
				</div>
				
				

	<hr>
	</div>
	<div style="text-align: center;">
		<button type="button" class="btn btn-success m-2" onclick="Asset_Add()">자산 추가</button>
		<button type="button" class="btn btn-warning m-2" onclick="location.href='UserAsset.jsp'">뒤로가기</button>
				</form>

		<script type="text/javascript">
			function Asset_Add() {
				let returnValue = confirm('자산을 추가하시겠습니까?');
				if (returnValue === true) { // 확인 버튼을 눌렀을 경우
					returnValue = '자산이 추가되었습니다.';
					alert(returnValue);
					document.frm.submit();
				} else { // 취소 버튼을 눌렀을 경우
					returnValue = '취소되었습니다. ';
				    return false;
				}
				
			}
		
		</script>
		</div>
			</div>
		</div>
	</div>
<!-- 유저자산 추가 End -->
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
</body>
</html>