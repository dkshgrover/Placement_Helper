package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBConnection.ConnectionProvider;

@WebServlet("/updateRequest")
public class updateRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = request.getParameter("status");
		int uname = Integer.parseInt(request.getParameter("uname"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		try {
			Connection con = ConnectionProvider.provideConnection();
			HttpSession session = request.getSession();
			if(status.equals("accepted")) {
				String query = "update students set status='accepted' where s_id="+uname;
				String query2 = "update college_administrator set acceptedReq=acceptedReq+1, pendingReq=pendingReq-1 where cid="+cid;
//				System.out.println(query2);
				Statement st = con.createStatement();
				Statement st2 = con.createStatement();
				int rows = st.executeUpdate(query);
				int rows2 = st2.executeUpdate(query2);
				if(rows == 1 && rows2 == 1) {
					response.sendRedirect("getRequests");
				}else {
					response.sendRedirect("admin/requests.jsp?error=Some error occured**");
				}
			}else {
				String query = "delete from students where s_id="+uname;
				String query2 = "update college_administrator set pendingReq=pendingReq-1 where cid="+cid;
				String query3 = "delete from projects where s_id='csecec."+uname+"@gmail.com'";
//				System.out.println(query3);
				Statement st = con.createStatement();
				Statement st2 = con.createStatement();
				Statement st3 = con.createStatement();
				int rows = st.executeUpdate(query);
				int rows2 = st2.executeUpdate(query2);
				int rows3 = st3.executeUpdate(query3);
//				System.out.println(rows2);
				if(rows != 0 && rows2 != 0 && rows3 != 0) {
					response.sendRedirect("getRequests");
				}else {
					response.sendRedirect("admin/requests.jsp?error=Some error occured**");
				}
			}
		}catch(Exception e) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
