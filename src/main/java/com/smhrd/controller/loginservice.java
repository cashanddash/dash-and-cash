package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.DAO_G;
import com.smhrd.model.userVO;

@WebServlet("/loginservice")
public class loginservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		userVO vo = new userVO(user_id, user_pw);

		DAO_G dao = new DAO_G();

		userVO luser = dao.login(vo);
        int succ=-1;
		if (luser != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(1800);
			session.setAttribute("loginD", luser);
			System.out.println("로그인성공!");
		} else {
			System.out.println("아아악");
			System.out.println("로그인실패");

		}
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println(succ);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	 

	}
}
