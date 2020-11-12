package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.ConnectionProvider;

@WebServlet("/indexStudent")
public class indexStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uname = request.getParameter("id");
			String query = "select * from students inner join projects on students.s_email = projects.s_id where students.s_email='"+uname+"'";
	//		System.out.println(query);
			Connection con = ConnectionProvider.provideConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("resultSet", rs);
				response.sendRedirect("assets/index.jsp");
			}
		}catch(Exception e) {
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
