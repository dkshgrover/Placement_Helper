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

@WebServlet("/editProject")
public class editProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("id"));
		try {
			Connection con = ConnectionProvider.provideConnection();
			String qry = "select * from final_year_projects where pid="+pid;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(qry);
			if(rs.next()) {
				HttpSession session  = request.getSession();
				session.setAttribute("resultSet5", rs);
				response.sendRedirect("admin/addProject.jsp?pid="+pid);
			}else {
				response.sendRedirect("admin/projects.jsp?error=Some error occured**");
			}
			
		}catch(Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
