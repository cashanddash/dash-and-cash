package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.DAO_Z;
import com.smhrd.model.assetVO;

@WebServlet("/assetservice")
public class assetservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String user_id = request.getParameter("user_id");
		
		DAO_Z dao = new DAO_Z();
		
		List<assetVO> asvo =dao.myAsset(user_id);
		
		
		if(asvo != null) {
			
			System.out.println("유저자산그래프 성공");
		}
		else {
			System.out.println("유저자산그래프 실패");
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
			System.out.println(Sum[0]+Sum[1]+Sum[2]);
			request.setAttribute("assetZ", Sum);
			RequestDispatcher rd = request.getRequestDispatcher("UserAsset.jsp");
			rd.forward(request, response);
			
		}
		
		List<assetVO> list =dao.myAsset(user_id);
		
		if(list == null) {
			System.out.println("성공");
			
			//session.setAttribute(string name, object value);
			 session.setAttribute("assetlist", user_id);
			 RequestDispatcher rd =  request.getRequestDispatcher("UserAsset.jsp"); 
				rd.forward(request, response);
			 
		}
		else {
			System.out.println("실패");
		}
		
		
		
		
		
		
		
		
		

		

		
		
		
		
	}

}
