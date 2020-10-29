package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.ConnectionProvider;

@WebServlet("/addProject")
public class addProject extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = ConnectionProvider.provideConnection();
			HttpSession session = request.getSession();
			ResultSet rs = (ResultSet)session.getAttribute("resultSet");
			String qry = "";
			String s_id = rs.getString(9);
			String pno = request.getParameter("pno");
			String pname = request.getParameter("pname");
			String penv = request.getParameter("penv");
			String ptech = request.getParameter("ptech");
			String pdescr = request.getParameter("pdescr");
			if(pno.equals("2")) {
				qry = "update projects set pname2=?, penv2=?, ptech2=?, pdescr2=? where s_id=?";
			}else {
				qry = "update projects set pname=?, penv=?, ptech=?, pdescr=? where s_id=?";
			}
			PreparedStatement st = con.prepareStatement(qry);
			st.setString(1, pname);
			st.setString(2, penv);
			st.setString(3, ptech);
			st.setString(4, pdescr);
			st.setString(5, s_id);
			int rows = st.executeUpdate();
			if(rows == 1) {
				response.sendRedirect("assets/index.jsp?loginAgain=Details updated**");
			}
		}catch(Exception e) {
			
		}
		

	}

}
