package CheckLoginDetails;
import LoginBean.LoginBean;
import java.sql.*;

import DBConnection.ConnectionProvider;


public class CheckLoginCollege_Admin {

	public static ResultSet checkLogin(LoginBean loginbean) throws Exception{
		String uname = loginbean.getUname();
		String pass = loginbean.getPass();
		String query = "select * from college_administrator where c_email='" + uname + "' and pass='" + pass + "'";
		Connection con = ConnectionProvider.provideConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		return rs;
	}
}
