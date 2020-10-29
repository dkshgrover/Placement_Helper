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

@WebServlet("/getProjectDetails")
public class getProjectDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("p_id"));
		try {
			HttpSession session = request.getSession();
			Connection con3 = ConnectionProvider.provideConnection();
			String query = "select * from final_year_projects where pid="+pid;
			Statement st4 = con3.createStatement();
			ResultSet rs4 = st4.executeQuery(query);
			if(rs4.next()) {
				session.setAttribute("resultSet4", rs4);
				response.sendRedirect("iPortfolio/project-details.jsp");
			}else {
				session.setAttribute("error", "Some error occured, Try again**");
				response.sendRedirect("iPortfolio/index.jsp");
			}
		}catch(Exception e) {
			
		}
	}
}
