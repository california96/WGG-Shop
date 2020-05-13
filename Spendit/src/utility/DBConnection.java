package utility;
import java.sql.*;

import javax.servlet.ServletContext;

public class DBConnection {
	private static Connection connection;
	private DBConnection() {
		
	}
	private static Connection getConnectionInstance(ServletContext context) {
		if(connection == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(context.getInitParameter("JDBCUrl"), context.getInitParameter("JDBCUser"), context.getInitParameter("JDBCPass"));
			}catch(ClassNotFoundException cfne) {
				cfne.printStackTrace();
			}
			catch(SQLException sqle) {

				sqle.printStackTrace();
			}
		}
		return connection;
	}
	public static Connection getConnection(ServletContext context) {
		return (connection == null) ? getConnectionInstance(context) : connection;
	}
	private static Connection getConnectionInstance() {
		if(connection == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spenditdb", "root", "password");
			}catch(ClassNotFoundException cfne) {
				cfne.printStackTrace();
			}
			catch(SQLException sqle) {

				sqle.printStackTrace();
			}
		}
		return connection;
	}
	public static Connection getConnection() {
		return (connection == null) ? getConnectionInstance() : connection;
	}
}
