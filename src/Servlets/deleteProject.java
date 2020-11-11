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

@WebServlet("/deleteProject")
public class deleteProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("id"));
		try {
			HttpSession session = request.getSession();
			ResultSet rs = (ResultSet)session.getAttribute("resultSet");
			Connection con = ConnectionProvider.provideConnection();
			String query = "update college_administrator set projects=projects-1 where ctid="+rs.getInt(9);
			String qry = "delete from final_year_projects where pid="+pid;
			Statement st = con.createStatement();
			Statement st2 = con.createStatement();
			int rows = st.executeUpdate(qry);
			int rows2 = st2.executeUpdate(query);
			if(rows == 1 && rows2 != 0) {
				response.sendRedirect("getProjects");
			}else {
				response.sendRedirect("admin/projects.jsp?error=Some error occured**");
			}
		}catch(Exception e) {
			
		}
	}
}
