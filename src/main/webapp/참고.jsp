<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>보고서</h1>
 
<br>
목표달성률 => <br>
꺾은선 그래프로 교체(지난달 대비 소비량)<br>

<br>
소비현황 상세보기 -> <br>
일자별(범위 10일)/월별(범위12) 꺾은선 그래프 추가<br>
<br>

지출태그<br>
<br>
저축/보험<br>
식비<br>
공과금<br>
생필품<br>
품위유지비<br>
교통비<br>
상환<br>
기타<br>
+ 목표1<br>
+ 목표2<br>
+ 목표3<br>
<br>
이번달지출 TOP 막대 그래프추가<br>

<br>
목표<br>
목표 달성리스트 [메모공간]<br>
<br>
목표를 설정하면<br>
지출태그에 설정한 목표태그가 추가되게<br>



<h1> 기능 구현</h1><br>

로그인 페이지<br>
- tb_user 테이블 회원 아이디 비번 일치 확인<br>
- 일치하면 회원 id에 맞는 tb_user 테이블 컬럼 SELECT<br>
- 가져온 값 세션에 user_info 로 userVO 타입으로 저장<br>
- 마지막에 메인 페이지로 이동<br>
<br>
회원가입<br>
- tb_user 테이블 에서 일치하는 아이디 있는지 SELECT<br>
- 비밀번호랑 비밀번호 확인이랑 일치한지 확인<br>
- userVO 타입으로 저장 후 INSERT<br>
<br>
메인바<br>
- 세션 user_info 있는지 확인<br>
- 없으면 첫화면으로 보내기<br>
- 있다면<br>
-- 닉네임님 환영합니다 표시<br>
-- MyPage, Logout 표시<br>
-Logout 클릭시 로그아웃 얼런창 표현 및 첫화면 이동<br>
- 각 a태그 링크 연결 확인<br>
<br>
메인화면<br>
캘린더<br>
- 캘린더 클릭시 메인에 캘린더 페이지로 이동<br>
목표<br>
- 회원 아이디에 일치하는 ArrayList<targetVO> 타입으로  SELECT<br>
- 가져온 값 으로 대시보드화<br>
항목 별 입/지출<br>
- 회원 아이디에 일치하는 ArrayList<income_expenseVO>타입으로 SELECT<br>
- 가져온 값 으로 대시보드화<br>
알람<br>
- ArrayList<income_expenseVO>에서  가져온값 분석<br>
- 지난달 이번달 소비내역 비교 후 막대 그래프 표현<br>
<br>
캘린더<br>
- 원하는 날짜 클릭 후 input.jsp에 선택한 날짜 전달<br>
- ArrayList<income_expenseVO> 타입으로 가져와 그날 그날 수입/지출 계산<br>
- 계산한 값 캘린더에 전송하여 달력에 표시<br>
input.jsp <br>
-- 입력 값 tb_income_expense 테이블에  INSERT<br>
-- 입력 값 tb_asset 테이블에  update<br>
--- 소비가 목표라면 tb_target 테이블에  update<br>
--- ArrayList<targetVO> 에서 타겟명 가져와 태그 추가<br>
<br>

입/지출 상세내역<br>
- ArrayList<income_expenseVO>에서 수입/지출 계산 후 대시보드화<br>
- ArrayList<income_expenseVO> 로 테이블 만들어서 출력<br>
<br>
내 자산<br>
- tb_asset 에서 ArrayList<assetVO> 타입으로  SELECT<br>
- 가져온 데이터로 대시보드화<br>
- 가져온 데이터 타입별로 테이블에 만들기<br>
UserAsset_Add.jsp<br>
-자산 추가 버튼 누르면 tb_asset  INSERT<br>
- 뒤로가기 누르면 UserAsset.jsp 로 이동<br>
<br>
보고서<br>
나의총자산<br>
- ArrayList<assetVO> 타입으로  SELECT<br>
- 가져온 데이터로 대시보드화<br>
소비현황<br>
- ArrayList<income_expenseVO>에서 수입으로 태그별 계산 후 대시보드화<br>
나이,연봉 별 자산 비교<br>
- tb_user 테이블 에서 나이별, 연봉별 계산하여 대시보드화<br>
<br>
항목별 지출 순위<br>
- ArrayList<income_expenseVO> 에서 태그별로 계산하여 대시보드화<br>
<br>
통계<br>
- tb_user 테이블 에서 나이별, 연봉별 계산하여 대시보드화<br>
<br>
목표<br>
- 회원 아이디에 일치하는 ArrayList<targetVO> 타입으로  SELECT<br>
목표리스트<br>
-- ArrayList<targetVO> 에서 목표 이름 추출하여 목표리스트 표현<br>
-- targetVO 타입으로 tb_target 테이블에  INSERT<br>
-- 체크박스 선택된 targetVO 는  tb_target 테이블에  delete<br>
목표현황<br>
-- ArrayList<targetVO> 에서 추출하여 목표명, 기간, 적립액, 등 추출하여 대시보드화<br>







</body>
</html>