package com.smhrd.virtualData;

import java.util.ArrayList;
import java.util.Random;

public class mainVB {

	public static void main(String[] args) {
		bankDAO dao = new bankDAO();
		bankVO vom = new bankVO();
		Random random = new Random();
		
		String[] bnList = { "KEB하나은행", "SC제일은행", "국민은행", "기업은행", "농협", "신한은행", "우리은행", "한국시티은행" };
		String[] knList = { "현대카드", "삼성카드", "롯데카드", "비씨카드", "신한카드", "KB국민카드", "우리카드", "하나카드", "NH농협카드", "IBK기업은행" };

		ArrayList<String> vb_idList = dao.userNameSelect(); 
		// tb_user 테이블에서 회원명 select 후 ArrayList 입력
		int amount = 0;
		int cnt = 0;
		
		for (int index = 10; index < 60; index++  ) {
			ArrayList<bankVO> userVBList = new ArrayList<bankVO>();
			int sum = 0; // 합계


			String vb_id = vb_idList.get(index); // 회원 아이디
			System.out.println("--" + (index+1) + "번 회원 : "+ vb_idList.get(index));
			// 월급 쿼리문 작성 시작
			System.out.println("--" + (index+1) + "번 회원 월급");
			String bankname = bnList[random.nextInt(bnList.length)]; // 은행 랜덤
			int dd = random.nextInt(28) + 1;
			amount = dao.Salary(vb_id) / 10000 * 10000;

			for (int i = 0; i < 3; i++) {
				sum += amount;
				String vb_date = null;
				if (dd > 9) {
					vb_date = "2023-0" + (i + 1) + "-" + dd;
				} else {
					vb_date = "2023-0" + (i + 1) + "-0" + dd;
				}
				bankVO vo = new bankVO(vb_id, vb_date, "은행", bankname, "수입", "월급", amount);
				userVBList.add(vo);
				cnt = dao.vdInsert(vo);
				if (cnt > 0 ) {
//					System.out.println(vo.toString());
//				System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + vb_date
//						+ "', '은행','" + bankname + "','수입','월급'," + amount + ");");
				}
			} // 월급 쿼리문 끝

			// 초기 카드 값 설정 시작
			System.out.println("--" + (index+1) + "번 회원 카드");
			int icNum = random.nextInt(6);// 카드 랜덤
			String[] kn = new String[icNum]; // 카드 랜덤 저장
			for (int i = 0; i < icNum; i++) {
				kn[i] = knList[random.nextInt(knList.length)];
				for (int j = 0; j < i; j++) {
					if (kn[i].equals(kn[j])) {
						i--;
					}
				} // 카드 중복 제거
			}

			
			for (int i = 0; i < icNum; i++) {
				amount = (random.nextInt(500) + 1) * 1000;
				String vb_date = vom.data(2023);
				String detail = dao.DetailList(vb_id).get(random.nextInt(dao.DetailList(vb_id).size()));
				bankVO vo = new bankVO(vb_id, vb_date, "카드", kn[i], "지출", detail, amount);
				userVBList.add(vo);
				cnt = dao.vdInsert(vo);
				if (cnt > 0 ) {
//					System.out.println(vo.toString());
//				System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + vb_date
//						+ "', '카드','" + kn[i] + "','지출','" + detail + "'," + amount + ");");
				}
			} // 초기 카드 값 설정 끝

			// 초기 대출 값 설정 시작123
			System.out.println("--" + (index+1) + "번 회원 대출");
			int ilNum = random.nextInt(6);// 대출 랜덤
			String[] ln = new String[ilNum]; // 대출 랜덤 저장
			for (int i = 0; i < ilNum; i++) { // 대출 랜덤
				ln[i] = bnList[random.nextInt(bnList.length)];
				for (int j = 0; j < i; j++) {
					if (ln[i].equals(ln[j])) {
						i--;
					}
				} // 대출 중복 제거
			}

			for (int i = 0; i < ilNum; i++) {
				amount = (random.nextInt(100) + 1) * 1000000;
				String yyyy = ("202" + random.nextInt(4));
				String vb_date = vom.data(Integer.parseInt(yyyy));
				String detail = dao.DetailList(vb_id).get(random.nextInt(dao.DetailList(vb_id).size()));
				bankVO vo = new bankVO(vb_id, vb_date, "대출", ln[i], "지출", "기타", amount);
				userVBList.add(vo);
				cnt = dao.vdInsert(vo);
				if (cnt > 0 ) {
//					System.out.println(vo.toString());

//				System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + vb_date
//						+ "', '대출','" + ln[i] + "','지출','기타'," + amount + ");");
				}
				
			} // 초기 대출 값 설정 끝

			// 카드 값 갚기
			System.out.println("--" + (index+1) + "번 회원 카드 갚기");
			int size = userVBList.size();
			int pay = userVBList.get(0).getAccountAmount(); // 월급
			
			for (int k = 0; k < size; k++) { // 카드 찾기
				if (userVBList.get(k).getCode_Type().equals("카드")) {
					// 0123456789
					// 2023-03-04

					int mm1 = Integer.parseInt(userVBList.get(k).getVB_Date().substring(6, 7)) + 1;

					for (int m = mm1; m <= 3; m++) {

						String paybackDay = null;

						if (mm1 == 10) {
							// 월급날 카드값 갚는 날 = 카드값 생긴 년도 0부터 4이전 까지 년도 + 카드값 생긴 월에 +1 + 월급날 8번 부터 끝까지 가져오기
							paybackDay = userVBList.get(k).getVB_Date().substring(0, 4) + "-" + mm1 + "-"
									+ userVBList.get(0).getVB_Date().substring(8);
						} else {
							paybackDay = userVBList.get(k).getVB_Date().substring(0, 4) + "-0" + mm1 + "-"
									+ userVBList.get(0).getVB_Date().substring(8);
						}
						int paybackMomey = (random.nextInt(100) + 1) * 10000; // 갚을 돈
						sum -= paybackMomey;

						bankVO kvo = new bankVO(vb_id, paybackDay, "카드", userVBList.get(k).getBankName(), "수입", "상환",
								paybackMomey);
						userVBList.add(kvo);
						cnt = dao.vdInsert(kvo);
						if (cnt > 0 ) {
//							System.out.println(kvo.toString());

//						System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + paybackDay
//							+ "', '카드','" + userVBList.get(k).getBankName() + "','수입','상환',"  + paybackMomey + ");");
						}


						bankVO bvo = new bankVO(vb_id, paybackDay, "은행", userVBList.get(0).getBankName(), "지출", "상환",
								paybackMomey);
						userVBList.add(bvo);
						cnt = dao.vdInsert(bvo);
						if (cnt > 0 ) {
//							System.out.println(bvo.toString());
					
//						System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + paybackDay
//							+ "', '은행','" + userVBList.get(0).getBankName() + "','지출','상환',"  + paybackMomey + ");");
						}
					

						mm1 += 1;
					}

				}

			} // 카드 값 갚기 끝

			// 대출 값기 시작
			System.out.println("--" + (index+1) + "번 회원 대출 갚기");
			for (int l = 0; l < size; l++) { // 대출 찾기
				if (userVBList.get(l).getCode_Type().equals("대출")) {
					// 초기 날짜 가져오기
					int yyyy1 = Integer.parseInt(userVBList.get(l).getVB_Date().substring(0, 4)); // 대출 시작년 가져오기
					int mm1 = Integer.parseInt(userVBList.get(l).getVB_Date().substring(6, 7)) + 1; // 대출 시작 후 한달 후 가져오기
					String dd1 = userVBList.get(0).getVB_Date().substring(8); // 월급일 가져오기

					int gkq = 0;

					int paybackMomey = (random.nextInt(100) + 1) * 10000; // 갚을 돈
					while (true) {

						String paybackDay = null;

						if (yyyy1 == 2023) { // 2023 년도 부터 소비 계산
							sum -= paybackMomey; // 총 소득에서 대축 갚은 돈 빼기

							if (mm1 >= 10) {
								// 월급날 카드값 갚는 날 = 카드값 생긴 년도 0부터 4이전 까지 년도 + 카드값 생긴 월에 +1 + 월급날 8번 부터 끝까지 가져오기
								paybackDay = yyyy1 + "-" + mm1 + "-" + userVBList.get(0).getVB_Date().substring(8);
							} else {
								paybackDay = yyyy1 + "-0" + mm1 + "-" + userVBList.get(0).getVB_Date().substring(8);
							} // if문
							bankVO kvo = new bankVO(vb_id, paybackDay, "대출", userVBList.get(l).getBankName(), "수입",
									"상환", paybackMomey);
							userVBList.add(kvo);
							cnt = dao.vdInsert(kvo);
							if (cnt > 0 ) {
//								System.out.println(kvo.toString());
//								System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + paybackDay
//									+ "', '대출','" + userVBList.get(l).getBankName() + "','수입','상환',"  + paybackMomey + ");");
								
							}

							bankVO bvo = new bankVO(vb_id, paybackDay, "은행", userVBList.get(0).getBankName(), "지출",
									"상환", paybackMomey);
							userVBList.add(bvo);
							cnt = dao.vdInsert(bvo);
							if (cnt > 0 ) {
								
//								System.out.println(bvo.toString());
//								System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + paybackDay
//									+ "', '은행','" + userVBList.get(0).getBankName() + "','지출','상환',"  + paybackMomey + ");");
							}

						} else { // 2023년도 아니면 건별로 쿼리 x, 하나로 함축
							gkq += paybackMomey; // 기존 대출 갚은 값

						}

						if (mm1 >= 12) {
							yyyy1 += 1;
							mm1 = 1;
						} else {
							mm1 += 1;
						}

						if (yyyy1 == 2023 && mm1 > 3) {
							break;
						} // 2023년 3월 이후 브레이크

					} // while 문 끝

					// 초기 대출 갚은 값 쿼리문
					bankVO lvo = new bankVO(vb_id, "2022-12-31", "대출", userVBList.get(l).getBankName(), "수입", "상환",
							gkq);
					userVBList.add(lvo);
					cnt = dao.vdInsert(lvo);
					if (cnt > 0 ) {
						
//						System.out.println(lvo.toString());
//						System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','2022-12-31'," + 
//							+ "'대출','" + userVBList.get(l).getBankName() + "','수입','상환',"  + gkq + ");");
					}

				} // 대출 찾는 if문
			} // 대출값 갚기 끝

			// 소비하기 시작
			System.out.println("--" + (index+1) + "번 회원 소비시작");
			for (int sp = 0; sp < (random.nextInt(500) + 1); sp++) {
				int money = ((random.nextInt(100) + 1)) * 10000;
				String Date = vom.data(2023); // 2023년도 기준으로 날짜 랜덤 선택
				String Tags = vom.Deposit_Withdrawal(5); // 수입 5%확률, 지출 95%확률
				String Detail = dao.DetailList(vb_id).get(random.nextInt(dao.DetailList(vb_id).size()));
				// 소비 태그 랜덤
				if (random.nextInt() + 1 >= 75) { // 소비중 75%확률로 월급 통장에서

					if (sum >= money) { // 통장에 있는 돈보다 소비 금액이 클 경우 만 실행

						bankVO kvo = new bankVO(vb_id, Date, "은행", userVBList.get(0).getBankName(), Tags, Detail,
								money);
						userVBList.add(kvo);
						cnt = dao.vdInsert(kvo);
						if (cnt > 0 ) {
							
//							System.out.println(kvo.toString());
//					System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + paybackDay
//						+ "', '은행','" + userVBList.get(0).getBankName() + "','"+Tags+"','"+Detail+"',"  + money + ");");
						}
					}

				} else { // 소비중 25%확률로 카드로
					if (kn.length != 0) {
						
						String kname = kn[random.nextInt(kn.length)];
						
						bankVO kvo = new bankVO(vb_id, Date, "카드", kname, Tags, Detail, money);
						userVBList.add(kvo);
						cnt = dao.vdInsert(kvo);
						if (cnt > 0 ) {
							
//							System.out.println(kvo.toString());
//				System.out.println("insert into virtualbank values (mbseq.nextVal,'" + vb_id + "','" + paybackDay
//					+ "', '카드','" + kname + "','"+Tags+"','"+Detail+"',"  + money + ");");
						}
					}

				}

			} // 소비하기 끝

			System.out.println(); // 회원 한명 작업 끝 개행

		} // 회원 초기 설정 for문 (월급 수입/ 초기 카드,대출 설정/ 카드 대출 갚기 / 소비하기 )
		System.out.println("끝");
		

	} // main

} // class
