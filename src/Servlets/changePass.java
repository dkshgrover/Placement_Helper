package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.ConnectionProvider;

@WebServlet("/changePass")
public class changePass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = request.getParameter("as");
		String oldPass = request.getParameter("oldP");
		String newPass = request.getParameter("newP");
		String query = "";
		if(user.equals("student")) {
			query = "update students set s_pass='"+newPass+"' where s_pass='"+oldPass+"'";
		}else {
			query = "update college_administrator set pass='"+newPass+"' where pass='"+oldPass+"'";
		}
		try {
			Connection con = ConnectionProvider.provideConnection();
			
			Statement st = con.createStatement();
			int rows = st.executeUpdate(query);
			if(user.equals("student")) {
				if(rows == 1) {
					response.sendRedirect("assets/index.jsp?passchanged=Password Changed**");
				}else {
					response.sendRedirect("assets/index.jsp?error=Wrong password entered**");
				}
			}else {
				if(rows == 1) {
					response.sendRedirect("admin/index.jsp");
				}else {
					response.sendRedirect("admin/index.jsp?error=Wrong password entered**");
				}
			}
			
		}catch(Exception e) {
			
		}
	}

}
