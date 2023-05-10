<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.income_expenseVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.DAO_G"%>
<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


    <style>
        table {
            clear: both;
            width: 80%;
        }
        


        th {
            height: 50px;
            width: 70px;
            background-color: #191C24;

        }

        td {
            text-align: left;
            height: 80px;
            width: 70px;
            background-color: #191C24;
        }

        input {
            height: 50px;
            width: 70px;
            border: none;
            background-color: #191C24;
            font-size: 30px;
        }

        span {
            font-size: 12px;
        }

        .date {
            vertical-align: top;
        }


        .year_mon {
            font-size: 25px;
        }


        .colToday {
            background-color:  #2d3436;
        }
        
    </style>

    <script>
    
   	
    
        $(function () {
            var today = new Date();
            var date = new Date();
            $("input[name=preMon]").click(function () { // 이전달
                $("#calendar > tbody > td").remove();
                $("#calendar > tbody > tr").remove();
                today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
                buildCalendar();
            })

            $("input[name=nextMon]").click(function () { //다음달
                $("#calendar > tbody > td").remove();
                $("#calendar > tbody > tr").remove();
                today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                buildCalendar();
            })


            function buildCalendar() {
                nowYear = today.getFullYear();
                nowMonth = today.getMonth();
                firstDate = new Date(nowYear, nowMonth, 1).getDate();
                firstDay = new Date(nowYear, nowMonth, 1).getDay(); //1st의 요일
                lastDate = new Date(nowYear, nowMonth + 1, 0).getDate();

                if ((nowYear % 4 === 0 && nowYear % 100 !== 0) || nowYear % 400 === 0) { //윤년 적용
                    lastDate[1] = 29;
                }

                $(".year_mon").text(nowYear + "년 " + (nowMonth + 1) + "월");
                for (i = 0; i < firstDay; i++) { //첫번째 줄 빈칸
                    $("#calendar tbody:last").append("<td></td>");
                }
              
                for (i = 1; i <= lastDate; i++) { // 날짜 채우기
                    plusDate = new Date(nowYear, nowMonth, i).getDay();
                    var a = $('#inOut'+(i-1)).val();
                    var b = $('#type'+(i-1)).val();
                    console.log(a);
                    console.log(b);
                    if (plusDate == 0) {
                        $("#calendar tbody:last").append("<tr></tr>");
                    }
                    $("#calendar tbody:last").append("<td id='dt"+i+"' class='date' onclick='go("+i+")'>" + i +"<br> <span>수입</span> : <span id='dtIn"+i
                    		+"' style='color :red;'></span><br><span>지출</span> :<span id='dtOut"+i+"' style='color :blue;'></span></td>");
                }
                if ($("#calendar > tbody > td").length % 7 != 0) { //마지막 줄 빈칸
                    for (i = 1; i <= $("#calendar > tbody > td").length % 7; i++) {
                        $("#calendar tbody:last").append("<td></td>");
                    }
                }
                $(".date").each(function (index) { // 오늘 날짜 표시
                    if (nowYear == date.getFullYear() && nowMonth == date.getMonth() && $(".date").eq(index).text() == date.getDate()) {
                        $(".date").eq(index).addClass('colToday');
                    }
                })
            }
            buildCalendar();

           
        })
         
        function go(i){

        	var nY = nowYear;
        	var nM = "";
        	if(nowMonth < 10){
        		nM = "0"+(nowMonth + 1);
        	}else{
        		nM = ""+(nowMonth + 1);
        	}
        	var nD = "";
        	if(i < 10){
        		nD = "0"+i;
        	}else{
        		nD = ""+i;
        	}
        	
        	console.log(nY+"/"+(nM)+"/"+nD);

        	location.href = ("input.jsp?date="+nY+"/"+(nM)+"/"+nD)

        }

    </script>

</head>

<body>
<%
userVO loginD = (userVO)session.getAttribute("loginD");
            	DAO_G dao = new DAO_G();
            		ArrayList<income_expenseVO> ie_list = dao.selectlist(loginD.getUser_id());  
            		%>

<% if(loginD == null){
response.sendRedirect("signin.jsp");	
}	

%>
<%for(int i =0; i < ie_list.size();i++) {
	// 2023-03-09

String[] dt  = {ie_list.get(i).getItem_dt().substring(0, 4), ie_list.get(i).getItem_dt().substring(5, 7),ie_list.get(i).getItem_dt().substring(8)};
%>
<input style="display: none" id="inOut<%=i %>" value="<%= ie_list.get(i).getAmount()%>">
<input style="display: none" id="type<%=i%>" value="<%= ie_list.get(i).getItem_type()%>">
<%} %>
           

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
						<a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>메인</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href="index.jsp" class="dropdown-item">메인</a> 
							<a href="calendar1.jsp" class="dropdown-item active">캘린더</a>
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


			<div class="container-fluid pt-4 px-4">
			<div class="bg-secondary rounded h-100 p-4" style="display : flex; justify-content: center; align-items : center;">
    		<table id="calendar">
        	<thead>
            	<tr>
               	 <th><input style="color: #EB1616" name="preMon" type="button" value="<"></th>
                	<th  style="color: #EB1616" colspan="5" class="year_mon" align="center"></th>
                	<th><input style="color: #EB1616" name="nextMon" type="button" value=">"></th>
            	</tr>
           		 <tr style="color: #EB1616">
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    </div>
    </div>


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
</body>
</html>