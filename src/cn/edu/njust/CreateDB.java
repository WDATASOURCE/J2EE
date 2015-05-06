package cn.edu.njust;

import java.sql.*;

public class CreateDB {
	private String username;
	private String password;
	private String classname;
	private String url;
	private String sql;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public void BuildDB(){
		username = "root";
		password = "";
		classname = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306";
		try {
			Class.forName(classname);
			conn = DriverManager.getConnection(url, username, password);
			sql = "drop database if exists `sgm`";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "create database `sgm`";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			url = "jdbc:mysql://localhost:3306/sgm";
			conn = DriverManager.getConnection(url, username, password);
			sql = "drop table if exists `teacher`";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "create table `teacher`("
					+ "`tid` char(20),"
					+ "`name` char(20),"
					+ "`password` char(20),"
					+ "primary key(`tid`)"
					+ ")ENGINE=InnoDB DEFAULT CHARSET=gbk";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "insert into `teacher`(`tid`, `name`, `password`) values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "123456");
			pstmt.setString(2, "徐建");
			pstmt.setString(3, "123456");
			pstmt.executeUpdate();
			sql = "drop table if exists `student`";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "create table `student`("
					+ "`sid` char(20),"
					+ "`name` char(20),"
					+ "`sex` char(10),"
					+ "primary key(`sid`)"
					+ ")ENGINE=InnoDB DEFAULT CHARSET=gbk";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "drop table if exists `course`";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "create table `course`("
					+ "`cid` char(20),"
					+ "`name` char(20),"
					+ "primary key(`cid`)"
					+ ")ENGINE=InnoDB DEFAULT CHARSET=gbk";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "drop table if exists `grade`";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql = "create table `grade`("
					+ "`sid` char(20),"
					+ "`cid` char(20),"
					+ "`score` double,"
					+ "primary key(`sid`, `cid`)"
					+ ")ENGINE=InnoDB DEFAULT CHARSET=gbk";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
