package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.DAO_L;

@WebServlet("/targetdeleteservice")
public class targetdeleteservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			int target_seq = Integer.parseInt(request.getParameter("num"));

			DAO_L dao = new DAO_L();
			int cnt = dao.target_name_del(target_seq);

			if (cnt > 0) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
			response.sendRedirect("TargetList.jsp");

	}

}
