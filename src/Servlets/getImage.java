package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import DBConnection.ConnectionProvider;

@WebServlet("/getImage")
public class getImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		try {
			Connection con = ConnectionProvider.provideConnection();
			String qry = "select s_photo from students where s_email='" + email + "'";
			//System.out.println(qry);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(qry);
			if(rs.next()) {
				byte[] img = rs.getBytes(1);
				ServletOutputStream os = response.getOutputStream();
				os.write(img);
			}

		} catch (Exception e) {

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
