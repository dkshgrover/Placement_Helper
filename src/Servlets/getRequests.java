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

@WebServlet("/getRequests")
public class getRequests extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con  = ConnectionProvider.provideConnection();
			String query = "select * from students where s_name IS NULL";
			Statement st = con.createStatement();
			ResultSet rs4 = st.executeQuery(query);
			HttpSession session = request.getSession();
			session.setAttribute("resultSet4", rs4);
			response.sendRedirect("admin/requests.jsp");
		}catch(Exception e) {
			
		}
	}
}
