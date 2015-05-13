package cn.edu.njust;

import java.sql.*;

public class DBConnection {

	public static Connection getConnection() {
		String classname = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sgm";
		String username = "root";
		String password = "";
		Connection conn = null;

		try {
			Class.forName(classname);
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return null;
		}
	}
}
