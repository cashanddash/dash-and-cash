package com.smhrd.virtualData;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.apache.ibatis.session.SqlSession;

public class bankVO {		
		private int Idx; // 순번
		private String VB_id; // 고객
		private String VB_Date; // 날짜
		private String code_Type; // 구분코드 (은행, 카드, 대출)
		private String BankName; // 은행명 (은행&대출 , 카드사 )
		private String Deposit_Withdrawal; // 입출금 코드
		private String Detail; // 거래내역
		private int AccountAmount; // 금액
		
		@Override
		public String toString() {
			return "bankVO [Idx=" + Idx + ", VB_id=" + VB_id + ", VB_Date=" + VB_Date + ", code_Type=" + code_Type
					+ ", BankName=" + BankName + ", Deposit_Withdrawal=" + Deposit_Withdrawal + ", Detail=" + Detail
					+ ", AccountAmount=" + AccountAmount + "]";
		}

		public bankVO() {
			super();
		}

		public bankVO(String vB_id, String vB_Date, String code_Type, String bankName, String deposit_Withdrawal,
				String detail, int accountAmount) {
			super();
			VB_id = vB_id;
			VB_Date = vB_Date;
			this.code_Type = code_Type;
			BankName = bankName;
			Deposit_Withdrawal = deposit_Withdrawal;
			Detail = detail;
			AccountAmount = accountAmount;
		}

		public bankVO(int idx, String vB_id, String vB_Date, String code_Type, String bankName,
				String deposit_Withdrawal, String detail, int accountAmount) {
			super();
			Idx = idx;
			VB_id = vB_id;
			VB_Date = vB_Date;
			this.code_Type = code_Type;
			BankName = bankName;
			Deposit_Withdrawal = deposit_Withdrawal;
			Detail = detail;
			AccountAmount = accountAmount;
		}

		public int getIdx() {
			return Idx;
		}

		public void setIdx(int idx) {
			Idx = idx;
		}

		public String getVB_id() {
			return VB_id;
		}

		public void setVB_id(String vB_id) {
			VB_id = vB_id;
		}

		public String getVB_Date() {
			return VB_Date;
		}

		public void setVB_Date(String vB_Date) {
			VB_Date = vB_Date;
		}

		public String getCode_Type() {
			return code_Type;
		}

		public void setCode_Type(String code_Type) {
			this.code_Type = code_Type;
		}

		public String getBankName() {
			return BankName;
		}

		public void setBankName(String bankName) {
			BankName = bankName;
		}

		public String getDeposit_Withdrawal() {
			return Deposit_Withdrawal;
		}

		public void setDeposit_Withdrawal(String deposit_Withdrawal) {
			Deposit_Withdrawal = deposit_Withdrawal;
		}

		public String getDetail() {
			return Detail;
		}

		public void setDetail(String detail) {
			Detail = detail;
		}

		public int getAccountAmount() {
			return AccountAmount;
		}

		public void setAccountAmount(int accountAmount) {
			AccountAmount = accountAmount;
		}
		
		Random random = new Random();
		// 날짜 랜덤(랜덤년 입력)
		public String data(int yyyy) {
			if (yyyy == 2023) {
				int num = random.nextInt(100)+1;
				int mm = 0;
				int dd = 0;
				if (num >45) {
					dd = random.nextInt(31) + 1;
					mm = 1;
				} else if (num >90) {
					dd = random.nextInt(28) + 1;
					mm = 2;
				} else {
					dd = random.nextInt(8) + 1;
					mm = 3;
					
				}
				 // 날짜 랜덤
				
				if (dd < 10) {
					return yyyy + "-0" + mm + "-0" + dd;
				} // 날짜가 10보다 작으면 앞에 0 입력
				return yyyy + "-0" + mm + "-" + dd;
			} else {
				int mm = random.nextInt(12) + 1;
				String mm0 = null ;
				if (mm < 10 ) {
					mm0 = "0"+mm;
				} else {
					mm0 = ""+mm;
				}
				
				int dd = 0;
				if (mm == 1 || mm == 3 || mm == 5 || mm == 7 || mm == 8 || mm == 10 || mm == 12) {
					dd = random.nextInt(31) + 1;
				} else if (mm == 2) {
					dd = random.nextInt(28) + 1;
				} else {
					dd = random.nextInt(30) + 1;
				}
				
				if (dd < 10) {
					return yyyy + "-" + mm0 + "-0" + dd;
				} // 날짜가 10보다 작으면 앞에 0 입력
				return yyyy + "-" + mm0 + "-" + dd;
				
			}

		}

		// 구분코드 랜덤(은행, 카드, 대출)
		public String code_Type() {
			String Type;
			int num = 0; // 랜덤숫자가 담길 변수
			num = random.nextInt(99) + 1;

			if (num <= 35) {
				Type = "은행";
			} else if (num <= 70) {
				Type = "카드";
			} else {
				Type = "대출";
			}

			return Type;
		}

		// 구분코드 결과에 따라 은행, 카드 명 랜덤
		public String BankName(String Type) {
			String BankName = null;
			String[] bnList = { "KEB하나은행", "SC제일은행", "국민은행", "기업은행", "농협", "신한은행", "우리은행", "한국시티은행" };
			String[] knList = { "현대카드", "삼성카드", "롯데카드", "비씨카드", "신한카드", "KB국민카드", "우리카드", "하나카드", "NH농협카드", "IBK기업은행" };

			if (Type.equals("카드")) {
				BankName = knList[random.nextInt(knList.length)];
			} else {
				BankName = bnList[random.nextInt(bnList.length)];
			}

			return BankName;
		}

		// 입금 확률 입력 받고, 확률에 맞춰서 출금,입금 리턴
		public String Deposit_Withdrawal(int num1) {
			int num = 0; // 랜덤숫자가 담길 변수
			num = random.nextInt(99) + 1;
			if (num > num1) {
				return "출금";
			} else {
				return "수입";
			}
		}

		

		
		
}
