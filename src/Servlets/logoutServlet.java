package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user = request.getParameter("as");
		if (user.equals("admin")) {
			if (session.getAttribute("unameAdmin") != null && session.getAttribute("resultSet") != null) {
				session.removeAttribute("unameAdmin");
				session.removeAttribute("resultSet");
			}
		} else {
			if (session.getAttribute("uname") != null && session.getAttribute("resultSet") != null
					&& session.getAttribute("resultSet2") != null && session.getAttribute("resultSet3") != null
					&& session.getAttribute("resultSet4") != null) {
				session.removeAttribute("uname");
				session.removeAttribute("resultSet");
				session.removeAttribute("resultSet2");
				session.removeAttribute("resultSet3");
				session.removeAttribute("resultSet4");
			}
		}
		session.invalidate();
		response.sendRedirect("assets/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
