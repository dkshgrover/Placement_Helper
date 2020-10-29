package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnection.ConnectionProvider;

import java.sql.*;

@WebServlet("/contactUs")
public class contactUs extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String email = request.getParameter("email");
		String descr = request.getParameter("descr");
		try {
			Connection con = ConnectionProvider.provideConnection();
			String qry = "insert into contactus(cname,c_email,subject,description) values(?,?,?,?)";
			PreparedStatement st = con.prepareStatement(qry);
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, subject);
			st.setString(4, descr);
			int rows = st.executeUpdate();
			//System.out.println(rows+" rows updated");
			request.setAttribute("saved", "Your response has been recorded **");
			RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			
		}
	}

}
