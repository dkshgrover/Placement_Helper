package Servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
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

@WebServlet("/uploadMaterial")
@MultipartConfig
public class uploadMaterial extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con = null;
		String type = request.getParameter("type");
		int cid = Integer.parseInt(request.getParameter("cid"));
		int ctid = Integer.parseInt(request.getParameter("ctid"));
		String query = "update companies set ";
		Collection<Part> files = request.getParts();
		if(files.size() != 5) {
			response.sendRedirect("getCompanies?type="+ctid+"&error=Upload 5 files **");
		}else {
			String basePath = request.getServletContext().getRealPath("/");
			String realPath = "";
			for (int i = 0; i < basePath.length(); i++) {
				if (basePath.charAt(i) == '.') {
					break;
				} else {
					realPath = realPath + basePath.charAt(i);
				}
			}
			basePath = realPath + "Placement_Helper_Project/WebContent/iPortfolio/assets/material";
			realPath = "";
			ArrayList<String> fileNames = new ArrayList<String>();
			for (Part p : files) {
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
				con = ConnectionProvider.provideConnection();
				for(int i=0;i<fileNames.size();i++) {
					if(i == fileNames.size() - 1) {
						query = query + type+(i+1)+"='"+fileNames.get(i)+"' where comp_id="+cid;
						break;
					}
					query = query + type+(i+1)+"='"+fileNames.get(i)+"' , ";
				}
				Statement st = con.createStatement();
				int rows = st.executeUpdate(query);
				if(rows != 0) {
					response.sendRedirect("getCompanies?type="+ctid);
				}else {
					response.sendRedirect("admin/companies.jsp?error=Some error occured**");
				}
			}catch(Exception ex) {
				
			}
		}	
	}
}
