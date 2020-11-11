package Servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downloadMaterial")
public class downloadMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String basePath = request.getServletContext().getRealPath("/");
		String path = "";
		for (int i = 0; i < basePath.length(); i++) {
			if (basePath.charAt(i) == '.') {
				break;
			} else {
				path = path + basePath.charAt(i);
			}
		}
		String filename = (request.getParameter("fileName"));
		path = path + "Placement_Helper_Project/WebContent/iPortfolio/assets/material/"+filename;
//		System.out.println(path);
		File dwFile = new File(path);
		if (dwFile.exists()) {
			response.setContentType("APPLICATION/OCTET-STREAM");	
			//For File upload This Content Type is to be used
			
			response.setContentLength((int) dwFile.length());
			response.setHeader("Content-Disposition", "attachment; filename=" + filename + "");
			//Content-Disposition is used to add additional information about how to process the response payload
			// or attach additional metadata, such as the filename.
			
			FileInputStream in = new FileInputStream(dwFile);
			int i;
			while ((i = in.read()) != -1) {		//Until All chracters are readed
				response.getWriter().write(i);
			}
			in.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
