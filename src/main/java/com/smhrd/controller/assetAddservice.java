package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.DAO_Z;
import com.smhrd.model.assetVO;
import com.smhrd.model.userVO;

@WebServlet("/assetAddservice")
public class assetAddservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ㅏ너아ㅓ니ㅓ린ㄹㅇ");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String user_id = ((userVO)session.getAttribute("loginD")).getUser_id();
		
		String bank_name = request.getParameter("bank_name");
		String account_balance  = request.getParameter("account_balance") ;
		String dept_card_name = request.getParameter("dept_card_name");
		String dept_card_amount = request.getParameter("dept_card_amount") ;
		String dept_loan_name = request.getParameter("dept_loan_name");
		String dept_loan_amount = request.getParameter("dept_loan_amount") ;

		if (bank_name.equals("") ) {
			bank_name = null;
		}
		if (dept_card_name.equals("")) {
			dept_card_name = null ;
		}
		if (dept_loan_name.equals("")) {
			dept_loan_name = null;
		}
		if (account_balance.equals("")) {
			account_balance ="0" ; 
		}
		if (dept_card_amount.equals("")) {
			dept_card_amount ="0" ;
		}
		if (dept_loan_amount.equals("")) {
			dept_loan_amount ="0" ;
		}
		
		assetVO vo = new assetVO(user_id, bank_name,Integer.parseInt(account_balance), dept_card_name,
				Integer.parseInt(dept_card_amount), dept_loan_name, Integer.parseInt(dept_loan_amount));
		System.out.println( vo.toString());
		
		DAO_Z dao = new DAO_Z();
		
		int cnt = dao.assetAdd(vo);
		
		if(cnt>0) {
			System.out.println("자산추가성공");
			
			RequestDispatcher rd = request.getRequestDispatcher("UserAsset_Add.jsp");
			rd.forward(request, response);
		}
		else {
			System.out.println("자산추가실패");
		}
	
		
	
	
	
	}

}
