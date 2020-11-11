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


@WebServlet("/editCompanyFinal")
@MultipartConfig
public class editCompanyFinal extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> fileNames = new ArrayList<String>();
		try {
			HttpSession session = request.getSession();
			ResultSet rs6 = (ResultSet)session.getAttribute("resultSet6");
			rs6 = null;
			session.removeAttribute("resultSet6");
		}catch(Exception e) {
			
		}
		int cid = Integer.parseInt(request.getParameter("cid"));
		String cname = request.getParameter("cname");
		String ctype = request.getParameter("ctype");
		String founder = request.getParameter("founder");
		int ctid = Integer.parseInt(request.getParameter("ctid"));
		String website = request.getParameter("website");
		String process = request.getParameter("process");
		int noOfReq = Integer.parseInt(request.getParameter("noofreq"));
		String test_platform = request.getParameter("platform");
		String Package = request.getParameter("package");
		String contact = request.getParameter("contact");
		String comp_email = request.getParameter("email");
		String cdescr = request.getParameter("cdescr");
		String date = request.getParameter("date");
		String headLoc = request.getParameter("location");
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
		basePath = realPath + "Placement_Helper_Project/WebContent/iPortfolio/assets/img/Companies";
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
			String query = "update companies set comp_name=?, type=?, founder=?, ctid=?, website=?, "
					+ "comp_process=?, no_of_req=?, test_platform=?, package=?,"
					+ "contact=?, comp_email=?, comp_desc=?, comp_visitingDate=?, head_location=?";
			if(fileNames.size() == 1) {
				query = query + " where comp_id=?";
			}else {
				query = query + " ,photo1=?, photo2=?, photo3=? where comp_id=?";
			}
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, cname);
			st.setString(2, ctype);
			st.setString(3, founder);
			st.setInt(4, ctid);
			st.setString(5, website);
			st.setString(6, process);
			st.setInt(7, noOfReq);
			st.setString(8, test_platform);
			st.setString(9, Package);
			st.setString(10, contact);
			st.setString(11, comp_email);
			st.setString(12, cdescr);
			st.setString(13, date);
			st.setString(14, headLoc);
			if(fileNames.size() == 1) {
				st.setInt(15, cid);
			}else {
				st.setString(15, fileNames.get(0));
				st.setString(16, fileNames.get(1));
				st.setString(17, fileNames.get(2));
				st.setInt(18, cid);
			}
			int rows = st.executeUpdate();
//			System.out.println(rows);
			if(rows == 1) {
				response.sendRedirect("admin/companies.jsp?updated=Company details updated**");
			}else {
				response.sendRedirect("admin/companies.jsp?error=Some error occured**");
			}
		}catch(Exception e) {
			
		}
	}

}
