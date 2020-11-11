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

@WebServlet("/getProjects")
public class getProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			ResultSet rs5 = (ResultSet)session.getAttribute("resultSet5");
			rs5 = null;
			session.removeAttribute("resultSet5");
		}catch(Exception e) {
			
		}
		try {
			Connection con = ConnectionProvider.provideConnection();
			String query = "select * from final_year_projects";
			Statement st = con.createStatement();
			ResultSet rs2 = st.executeQuery(query);
			HttpSession session = request.getSession();
			session.setAttribute("resultSet2", rs2);
			response.sendRedirect("admin/projects.jsp");
		}catch(Exception e) {
			
		}
	}
}
