package DBConnection;
import java.sql.*;
import java.lang.*;
public class ConnectionProvider {
	public static Connection provideConnection()throws Exception
	{
		String url = "jdbc:mysql://localhost:3306/placement_helper"; // URL OF DATABASE
		String user = "root"; // USERNAME OF MYSQL (BY DEFAULT : ROOT)
		String passw = ""; // PASSWORD OF DATABASE
		Class.forName("com.mysql.jdbc.Driver"); // LOAD AND REGISTERING THE DRIVER
		Connection con = DriverManager.getConnection(url, user, passw);
		//System.out.println(con);   // IT WILL CHECK WHETHER CONNECTION HAS ESTABLISHED OR NOT
		return con;
	}
}
