package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.DAO_Z;

/**
 * Servlet implementation class check2
 */
@WebServlet("/check2")
public class check2 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8"); 
		String user_id = request.getParameter("user_id");
		
		DAO_Z dao = new DAO_Z();
		String userId = dao.checkIdz(user_id);
		String succ=null;
			if(userId == null){
				succ = "사용가능한 아이디입니다.";
			}
			else{
				succ = "사용불가능한 아이디다";
			}
			
		response.setContentType("text/html;charset=utf-8");	
		PrintWriter out=response.getWriter();
		out.println(succ);
		
	}

}
