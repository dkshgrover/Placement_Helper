package CheckLoginDetails;

import LoginBean.LoginBean;
import java.sql.*;

import DBConnection.ConnectionProvider;

public class CheckLoginStudent {

	public static ResultSet checkLogin(LoginBean loginbean) throws Exception {
		String uname = loginbean.getUname();
		String pass = loginbean.getPass();
		String query = "select * from students inner join projects on students.s_email = projects.s_id where students.s_email='"+uname+"' and students.s_pass='"+pass+"'";
		//System.out.println(query);
		Connection con = ConnectionProvider.provideConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		return rs;
	}
}
