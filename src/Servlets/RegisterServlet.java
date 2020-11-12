package Servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CheckLoginDetails.CheckLoginCollege_Admin;
import CheckLoginDetails.CheckLoginStudent;
import DBConnection.ConnectionProvider;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uname = Integer.parseInt(request.getParameter("uname"));
		String pass = request.getParameter("pass");
		String repeatPass = request.getParameter("repeatPass");
		if (!pass.equals(repeatPass)) {
			request.setAttribute("passMismatch", "Passwords didn't matched **");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
		String email = request.getParameter("email");
		int college_id = 0;
		HttpSession session2 = request.getSession();
		String registerAs = session2.getAttribute("loginAs").toString();
		session2.removeAttribute("loginAs");
		session2.invalidate();
		if (uname >= 1801900 && uname <= 1803000) {
			college_id = 1;
		}
		if (uname >= 1803000 && uname <= 1803500) {
			college_id = 2;
		}
		if (uname >= 1803500 && uname <= 1804000) {
			college_id = 3;
		}
		if (uname >= 1804000 && uname <= 1804500) {
			college_id = 4;
		}
		if (uname >= 1804500 && uname <= 1805000) {
			college_id = 5;
		}
		if (uname >= 1805000 && uname <= 1805500) {
			college_id = 6;
		}
		try {
			Connection con = ConnectionProvider.provideConnection();
			if (registerAs.equalsIgnoreCase("Student")) {
				String query2 = "select * from students where s_id="+uname;
				Statement statement = con.createStatement();
				ResultSet rs = statement.executeQuery(query2);
				if(rs.next()) {
					statement.close();
					rs.close();
					request.setAttribute("alreadyReg", "You have already registered **");
					request.getRequestDispatcher("register.jsp?loginAs=student").forward(request, response);
				}else {
					String qry = "insert into projects(s_id) values(?)";
					String query = "insert into students (s_id,college_id,s_email,s_pass,status) values(?,?,?,?,?)";
					String qry2 = "update college_administrator set pendingReq=pendingReq+1 where cid="+college_id;
					PreparedStatement st = con.prepareStatement(query);
					PreparedStatement st2 = con.prepareStatement(qry);
					Statement st3 = con.createStatement();
					st2.setString(1, email);
					st.setInt(1, uname);
					st.setInt(2, college_id);
					st.setString(3, email);
					st.setString(4, pass);
					st.setString(5, "pending");
					st.executeUpdate();
					st2.executeUpdate();
					st3.executeUpdate(qry2);
					//System.out.println(rows + " Rows Updated");
					request.setAttribute("registered", "You have been registered **");
					RequestDispatcher rd = request.getRequestDispatcher("register.jsp?loginAs=student");
					rd.forward(request, response);
				}
			} 
			else if(registerAs.equalsIgnoreCase("college_administrator")) {
				String query = "insert into college_administrator (cid,c_email,pass) values(?,?,?)";
				PreparedStatement st = con.prepareStatement(query);
				st.setInt(1, uname);
				st.setString(2, email);
				st.setString(3, pass);
				st.executeUpdate();
//				System.out.println(rows + " Rows Updated");
				request.setAttribute("registered", "You have been registered **");
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp?loginAs=college_administrator");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("error", "Wrong url, Choose again **");
				request.getRequestDispatcher("chooseUser.jsp").forward(request, response);
			}
		} catch (Exception e) {

		}

	}

}
