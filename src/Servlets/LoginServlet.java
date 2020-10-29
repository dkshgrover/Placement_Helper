package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CheckLoginDetails.CheckLoginCollege_Admin;
import CheckLoginDetails.CheckLoginStudent;
import DBConnection.ConnectionProvider;
import LoginBean.LoginBean;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String check = request.getParameter("check");
		//System.out.println(check);
		HttpSession session2 = request.getSession(); 
		String loginAs = session2.getAttribute("loginAs").toString();
		session2.removeAttribute("loginAs");
		session2.invalidate();
		LoginBean obj = new LoginBean();
		obj.setUname(uname);
		obj.setPass(pass);
		try {
			if (loginAs.equalsIgnoreCase("Student")) {
				ResultSet rs = CheckLoginStudent.checkLogin(obj);
				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("uname", uname);
					session.setAttribute("resultSet", rs);
					session.setMaxInactiveInterval(0);
					response.sendRedirect("assets/index.jsp");
				} else {
					request.setAttribute("error", "Incorrect Details Filled **");
					RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
					rd.forward(request, response);
				}
			} else {
				ResultSet rs = CheckLoginCollege_Admin.checkLogin(obj);
				if (rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("uname", uname);
					session.setAttribute("resultSet", rs);
					response.sendRedirect("");
				} else {
					request.setAttribute("error", "Incorrect Details Filled **");
					RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
					rd.forward(request, response);
				}
			}
		} catch (Exception e) {

		}

	}

}
