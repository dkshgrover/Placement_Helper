package Servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DBConnection.ConnectionProvider;

@WebServlet("/editProjectFinal")
@MultipartConfig
public class editProjectFinal extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> fileNames = new ArrayList<String>();
		try {
			HttpSession session = request.getSession();
			ResultSet rs5 = (ResultSet)session.getAttribute("resultSet5");
			rs5 = null;
			session.removeAttribute("resultSet5");
		}catch(Exception e) {
			
		}
		int pid = Integer.parseInt(request.getParameter("pid"));
		String pname = request.getParameter("pname");
		String pdescr = request.getParameter("pdescr");
		String penv = request.getParameter("penv");
		String ptech = request.getParameter("ptech");
		String mentor_name = request.getParameter("mentor_name");
		String mentor_id = request.getParameter("mentor_id");
		String madeBy_name = request.getParameter("madeBy_name");
		String madeBy_id = request.getParameter("madeBy_id");
		int noOfMembers = Integer.parseInt(request.getParameter("noOfMembers"));
		String company = request.getParameter("company");
		Collection<Part> images = request.getParts();
		String basePath = request.getServletContext().getRealPath("/");
		String realPath = "";
		for (int i = 0; i < basePath.length(); i++) {
			if (basePath.charAt(i) == '.') {
				break;
			} else {
				realPath = realPath + basePath.charAt(i);
			}
		}
		basePath = "";
		basePath = realPath + "Placement_Helper_Project/WebContent/iPortfolio/assets/img/projects";
		realPath = "";
		for (Part p : images) {
			String fileName = p.getSubmittedFileName();
			if (!(fileName == null)) {
				fileNames.add(fileName);
				realPath = basePath + "/" + fileName;
				InputStream is = p.getInputStream();
				try {
					byte[] file = new byte[is.available()];
					is.read(file);
					FileOutputStream fops = new FileOutputStream(realPath);
					fops.write(file);
					fops.flush();
					fops.close();
					
				} catch (Exception e) {

				}
			}
		}
		try {
			Connection con  = ConnectionProvider.provideConnection();
			String query = "update final_year_projects set pname=?, pdesc=? ,penv=? ,ptech=? ,mentor_name=? ,mentor_email=?, "
					+ "madeby_name=?, madeby_id=?, no_of_members=?, company=?";
			if(fileNames.size() == 1) {
				query = query + " where pid=?";
			}else {
				query = query + " ,photo1=?, photo2=?, photo3=? where pid=?";
			}
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, pname);
			st.setString(2, pdescr);
			st.setString(3, penv);
			st.setString(4, ptech);
			st.setString(5, mentor_name);
			st.setString(6, mentor_id);
			st.setString(7, madeBy_name);
			st.setString(8, madeBy_id);
			st.setInt(9, noOfMembers);
			st.setString(10, company);
			if(fileNames.size() == 1) {
				st.setInt(11, pid);
			}else {
				st.setString(11, fileNames.get(0));
				st.setString(12, fileNames.get(1));
				st.setString(13, fileNames.get(2));
				st.setInt(14, pid);
			}
			int rows = st.executeUpdate();
//			System.out.println(rows);
			if(rows == 1) {
				response.sendRedirect("admin/projects.jsp?updated=Project details updated**");
			}else {
				response.sendRedirect("admin/projects.jsp?error=Some error occured**");
			}
		}catch(Exception e) {
			
		}
	}

}
