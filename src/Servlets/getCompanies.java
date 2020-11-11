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

@WebServlet("/getCompanies")
public class getCompanies extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			ResultSet rs6 = (ResultSet)session.getAttribute("resultSet6");
			rs6 = null;
			session.removeAttribute("resultSet6");
		}catch(Exception e) {
			
		}
		try {
			int ctid = Integer.parseInt(request.getParameter("type"));
			Connection con = ConnectionProvider.provideConnection();
			String query = "select * from companies where ctid="+ctid;
			Statement st = con.createStatement();
			ResultSet rs3 = st.executeQuery(query);
			HttpSession session = request.getSession();
			session.setAttribute("resultSet3", rs3);
			response.sendRedirect("admin/companies.jsp");
		}catch(Exception e) {
			
		}
	}
}
