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

@WebServlet("/getCompanyDetails")
public class getCompanyDetails extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comp_id = Integer.parseInt(request.getParameter("comp_id"));
		try {
			HttpSession session = request.getSession();
			Connection con2 = ConnectionProvider.provideConnection();
			String qry = "select * from companies where comp_id=?";
			PreparedStatement st2 = con2.prepareStatement(qry);
			st2.setInt(1, comp_id);
			ResultSet rs2 = st2.executeQuery();
			if(rs2.next()) {
				String query = "select * from company_type where ctid="+rs2.getInt(5);
				Statement st3 = con2.createStatement();
				ResultSet rs3 = st3.executeQuery(query);
				if(rs3.next()) {
					session.setAttribute("resultSet2", rs2);
					session.setAttribute("resultSet3", rs3);
					response.sendRedirect("iPortfolio/company-details.jsp");
				}
			}else {
				session.setAttribute("error", "Some error occured, Try again**");
				response.sendRedirect("iPortfolio/index.jsp");
			}
		}catch(Exception e) {
			
		}
	}
}
