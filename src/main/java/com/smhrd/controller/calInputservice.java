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
import com.smhrd.model.income_expenseVO;
import com.smhrd.model.userVO;

@WebServlet("/calInputservice")
public class calInputservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String item_type =request.getParameter("item_type");
		String item_content =request.getParameter("item_content");
		int amount =Integer.parseInt(request.getParameter("amount")) ;
		String item_tag =request.getParameter("item_tag");
		String item_dt =request.getParameter("item_dt");
		String user_id = ((userVO)session.getAttribute("loginD")).getUser_id();
		
		income_expenseVO vo = new income_expenseVO(item_type,item_content,
				amount,item_tag,item_dt,user_id);
		
		System.out.println(vo.toString());
		
		DAO_Z dao = new DAO_Z();
		
		int cnt = dao.calAddInput(vo);
		
		if(cnt>0) {
			System.out.println("입지출 입력 성공");
			RequestDispatcher rd = request.getRequestDispatcher("calendar1.jsp");
			rd.forward(request, response);
		}
		else {
			System.out.println("입지출 입력 실패");
		}
		
		
		
	}

}
