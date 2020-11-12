package Servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DBConnection.ConnectionProvider;
@WebServlet("/AddNewProject")
@MultipartConfig
public class AddNewProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		ArrayList<String> fileNames = new ArrayList<String>();
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
		if(images.size() != 13 ) {
			response.sendRedirect("getProjects?error=Some error occured **");
		}else {
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
				String url = "jdbc:mysql://localhost:3306/placement_helper"; // URL OF DATABASE
				String user = "root"; // USERNAME OF MYSQL (BY DEFAULT : ROOT)
				String passw = ""; // PASSWORD OF DATABASE
				Class.forName("com.mysql.jdbc.Driver"); // LOAD AND REGISTERING THE DRIVER
				Connection con = DriverManager.getConnection(url, user, passw);
				String query = "insert into final_year_projects(pname,pdesc,penv,ptech,mentor_name,mentor_email,madeby_name,madeby_id,no_of_members,company,photo1,photo2,photo3) "
						+ "values('"+pname+"','"+pdescr+"','"+penv+"','"+ptech+"','"+mentor_name+"','"+mentor_id+"','"+madeBy_name+"','"+madeBy_id+"',"+noOfMembers+",'"+company+"','"+fileNames.get(0)+"','"+fileNames.get(1)+"','"+fileNames.get(2)+"')";
				String qry = "update college_administrator set projects=projects+1 where cid=1 or cid=3 or cid=4";
				Statement st = con.createStatement();
				Statement st2 = con.createStatement();
				int rows = st.executeUpdate(query);
				int rows2 = st2.executeUpdate(qry);
	//			System.out.println(rows);
				if(rows == 1 && rows2 == 3) {
					response.sendRedirect("getProjects");
				}else {
					response.sendRedirect("admin/projects.jsp?error=Some error occured**");
				}
			}catch(Exception e) {
				
			}
		}
	}

}
