package com.smhrd.virtualData;

import java.util.ArrayList;

import javax.print.DocFlavor.STRING;

import org.apache.tomcat.jni.Time;

import com.smhrd.model.DAO_Z;
import com.smhrd.model.assetVO;
import com.smhrd.model.income_expenseVO;

public class Classification {

	public static void main(String[] args) {
		// 가상 테이블 데이터 만들어지면 tb_asset, tb_income_expense 테이블로 자료 보내주기

		bankDAO dao = new bankDAO();
		

		int cnt;

		ArrayList<String> vb_idList = dao.userNameSelect(); // user 테이블에서 user_id Select //754
		
		for (int index = 0; index <5; index++) {
			
			String user_id = vb_idList.get(index); // 회원 아이디
			ArrayList<bankVO> PersonalList = dao.groupby3Selectvb(user_id);			
			System.out.print("--" + (index + 1) + "번째 회원 아이디 : " + user_id+ "\t 자산 수 " +PersonalList.size());		
			System.out.println();
					
			
			for (int i = 0; i < PersonalList.size(); i++) {	
				
				String bank_name = "";
				int account_balance = 0;
				String dept_card_name = "";
				int dept_card_amount = 0;
				String dept_loan_name = "";
				int dept_loan_amount = 0;
				System.out.println(PersonalList.get(i).toString());

				String value = PersonalList.get(i).getCode_Type();
				System.out.println("PersonalList.get(i).code_Type() 은 : "+value);
				
				if (value.equals("은행")) {
					System.out.println("은행 들어옴");
					bank_name = PersonalList.get(i).getBankName();
					account_balance = PersonalList.get(i).getAccountAmount();
										
				} else if (value.equals("카드")) {
					System.out.println("카드 들어옴");
					dept_card_name = PersonalList.get(i).getBankName();
					dept_card_amount = PersonalList.get(i).getAccountAmount();

				} else if (value.equals("대출"))  {
					System.out.println("대출 들어옴");
					dept_loan_name = PersonalList.get(i).getBankName();
					dept_loan_amount = PersonalList.get(i).getAccountAmount();
				}
				
				assetVO asvo = new assetVO(user_id, bank_name, account_balance, dept_card_name, dept_card_amount,
						dept_loan_name, dept_loan_amount);

				DAO_Z daoz = new DAO_Z();

//				cnt = daoz.assetAdd(asvo);
//				System.out.println(PersonalList.get(i).toString());
//				System.out.println(asvo.toString());



			} // for문 종료
			
			
			
			System.out.println("내자산 완료");
			System.out.println();
			
		} // tb_income_expense 자료 보내기 while
		
		
		
		System.out.println("끝");

	} // main

} // class
