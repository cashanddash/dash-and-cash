package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.DAO_Z;
import com.smhrd.model.userVO;

@WebServlet("/joinservice")
public class joinservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_age = request.getParameter("user_age");
		String user_nick = request.getParameter("user_nick");
		int user_salary = Integer.parseInt(request.getParameter("user_salary"));

		userVO vo = new userVO(user_id, user_pw, user_name, user_age, user_nick, user_salary);

		DAO_Z dao = new DAO_Z();
		
		
		int cnt = dao.join(vo);
		
		if(cnt>0) {
			System.out.println("회원가입 성공");
			//join_success.jsp 이동 (사용자가 작성한 이메일 화면에 출력)
			// response.sendRedirect("join_success.jsp");
			// ㄴ 이 방법 사용하지 않을 것임 : email값을 공유받아야하는데 request가 두번 일어나기때문에 공유 x -> forwarding 방식 사용
			RequestDispatcher rd =  request.getRequestDispatcher("signin.jsp"); 
			rd.forward(request, response);
		}
		else {
			System.out.println("회원가입 실패");
			//main.jsp 로 이동
			// response.sendRedirect("main.jsp");
		}
		
		

	}
	}
		
		

	


