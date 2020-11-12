package Servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
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


@WebServlet("/AddNewCompany")
@MultipartConfig
public class AddNewCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		ArrayList<String> fileNames = new ArrayList<String>();
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
		if(images.size() != 17) {
			response.sendRedirect("getCompanies?type="+ctid+"&error=Some error occured **");
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
				Connection con = ConnectionProvider.provideConnection();
				String query = "insert into companies(comp_name, type,founder,ctid,website,comp_process,no_of_req,test_platform,package,"
						+ "contact,comp_email,comp_desc,comp_visitingDate,photo1,photo2,photo3,head_location) "
						+ "values('"+cname+"','"+ctype+"','"+founder+"',"+ctid+",'"+website+"','"+process+"',"+noOfReq+",'"+test_platform+"','"+Package+"',"
								+ "'"+contact+"','"+comp_email+"','"+cdescr+"','"+date+"','"+fileNames.get(0)+"','"+fileNames.get(1)+"','"+fileNames.get(2)+"','"+headLoc+"')";
				String qry = "update college_administrator set companies=companies+1";
				if(ctid == 1) {
					qry = qry+" where cid=1 or cid=3 or cid=4";
				}else if(ctid == 2) {
					qry = qry+" where cid=2";
				}else if(ctid == 3) {
					qry = qry+" where cid=5";
				}else {
					qry = qry+" where cid=6";
				}
				Statement st = con.createStatement();
				Statement st2 = con.createStatement();
				int rows = st.executeUpdate(query);
				int rows2 = st2.executeUpdate(qry);
				if(rows == 1 && rows2 != 0) {
					response.sendRedirect("getCompanies?type="+ctid);
				}else {
					response.sendRedirect("admin/companies.jsp?error=Some error occured**");
				}
			}catch(Exception e) {
				
			}
		}
		
	}

}
