package Servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
import java.util.*;
import DBConnection.ConnectionProvider;

@WebServlet("/studentDetails")
@MultipartConfig(maxFileSize = 169999999)

public class studentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uname = (String)session.getAttribute("uname");
		session.removeAttribute("resultSet");
		session.removeAttribute("uname");
		session.invalidate();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String s_name = fname + " " + lname;
		String contact = request.getParameter("contact");
		String git_profile = request.getParameter("github_profile");
		String dob = request.getParameter("dob");
		String tempAddress = request.getParameter("tempAddress");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String temp_address = tempAddress + ", " + city + ", " + state + " - " + zip;
		String permAddress = request.getParameter("permAddress");
		String city2 = request.getParameter("city2");
		String state2 = request.getParameter("state2");
		String zip2 = request.getParameter("zip2");
		String perm_address = permAddress + ", " + city2 + ", " + state2 + " - " + zip2;
		String sclname = request.getParameter("sclname");
		int sclleaving = Integer.parseInt(request.getParameter("sclleaving"));
		float marks_12th = Float.parseFloat(request.getParameter("12marks"));
		String clgname = request.getParameter("clgname");
		int clgleaving = Integer.parseInt(request.getParameter("clgleaving"));
		float avgmarks = Float.parseFloat(request.getParameter("avgmarks"));
		String course = request.getParameter("course");
		String stream = request.getParameter("stream");
		String skill1 = request.getParameter("skill1");
		int perc1 = Integer.parseInt(request.getParameter("perc1"));
		String skill2 = request.getParameter("skill2");
		int perc2 = Integer.parseInt(request.getParameter("perc2"));
		String skill3 = request.getParameter("skill3");
		int perc3 = Integer.parseInt(request.getParameter("perc3"));
		String skill4 = request.getParameter("skill4");
		int perc4 = Integer.parseInt(request.getParameter("perc4"));
		String skill5 = request.getParameter("skill5");
		int perc5 = Integer.parseInt(request.getParameter("perc5"));
		String skill6 = request.getParameter("skill6");
		int perc6 = Integer.parseInt(request.getParameter("perc6"));
		//System.out.println(perc6);
		Part fp = request.getPart("photo");
		InputStream is = fp.getInputStream();
		Part fp2 = request.getPart("photo2");
		InputStream is2 = fp2.getInputStream();
//		System.out.println(perc6);
		
//		System.out.println(s_name);
//		System.out.println(contact);
//		System.out.println(dob);
//		System.out.println(git_profile);
//		System.out.println(temp_address);
//		System.out.println(perm_address);
//		System.out.println(sclleaving);
//		System.out.println(sclname);
//		System.out.println(marks_12th);
//		System.out.println(clgleaving);
//		System.out.println(course);
//		System.out.println(stream);
//		System.out.println(clgname);
//		System.out.println(avgmarks);
		try {
			String query = "update students set s_name=?,contact=?,dob=?,github_profile=?,temp_address=?,perm_address=?,scl_leaving=?,scl_name=?,marks=?,clg_passingY=?,degree=?,stream=?,clg_name=?,sgpa=?,skill1=?,perc1=?,skill2=?,perc2=?,skill3=?,perc3=?,skill4=?,perc4=?,skill5=?,perc5=?,skill6=?,perc6=?,s_photo=?,s_photoBack=? where s_email=?";
			Connection con = ConnectionProvider.provideConnection();
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, s_name);
			st.setString(2, contact);
			st.setString(3, dob);
			st.setString(4, git_profile);
			st.setString(5, temp_address);
			st.setString(6, perm_address);
			st.setInt(7, sclleaving);
			st.setString(8, sclname);
			st.setFloat(9, marks_12th);
			st.setInt(10, clgleaving);
			st.setString(11, course);
			st.setString(12, stream);
			st.setString(13, clgname);
			st.setFloat(14, avgmarks);
			st.setString(15, skill1);
			st.setInt(16, perc1);
			st.setString(17, skill2);
			st.setInt(18, perc2);
			st.setString(19, skill3);
			st.setInt(20, perc3);
			st.setString(21, skill4);
			st.setInt(22, perc4);
			st.setString(23, skill5);
			st.setInt(24, perc5);
			st.setString(25, skill6);
			st.setInt(26, perc6);
			st.setBlob(27, is);
			st.setBlob(28, is2);
			st.setString(29, uname);
			int rows = st.executeUpdate();
			//System.out.println(rows);
			if(rows == 1) {
				try {
					request.setAttribute("details_filled","You have completely registered**" );
					request.getRequestDispatcher("register.jsp?loginAs=student").forward(request, response);;
				}catch(Exception e) {
					
				}
			}else {
				request.setAttribute("error", "Some Error Occured, Please Try Again**");
				RequestDispatcher rd = request.getRequestDispatcher("iPortfolio/form.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {

		}

	}

}
