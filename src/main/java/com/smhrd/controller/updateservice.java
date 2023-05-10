package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.DAO_G;
import com.smhrd.model.DAO_L;
import com.smhrd.model.userVO;


@WebServlet("/updateservice")
public class updateservice extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_nick =request.getParameter("user_nick");
		int user_salary =Integer.parseInt(request.getParameter("user_salary"));
		
		
		
		userVO vo = new userVO(user_id,user_nick,user_salary);
		
		DAO_G dao = new DAO_G();
		int cnt = dao.update(vo);
		
		if(cnt>0) {
			System.out.println("회원정보 수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("loginD" ,vo );
			response.sendRedirect("Mypage.jsp");
		}else {
			System.out.println("회원정보 수정 실패ㅠ.ㅠ");
		
		}
		
		
		
	}

}
