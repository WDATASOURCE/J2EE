package cn.edu.njust;

import java.sql.*;

public class StudentBean {
	private String sid;
	private String name;
	private String sex;
	private String sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public StudentBean() {
		sid = null;
		name = null;
		sex = null;
		conn = null;
		pstmt = null;
		rs = null;
		sql = null;
	}

	public StudentBean(String sid, String name, String sex) {
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
		this.sid = sid;
		this.name = name;
		this.sex = sex;

	}

	public StudentBean(String id) {
		this.sid = id;
	}

	public void closeConnection() {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public boolean isExists() {
		conn = DBConnection.getConnection();
		sql = "select * from `student` where `sid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return false;
	}

	public ResultSet query() {
		conn = DBConnection.getConnection();
		sql = "select * from `student` order by `sid`";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return null;
		}
	}

	public int addStudent() {
		if (isExists())
			return 0; // 已存在
		conn = DBConnection.getConnection();
		sql = "insert into `student`(`sid`, `name`, `sex`)values(?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			pstmt.setString(2, name);
			pstmt.setString(3, sex);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				return 1; // 添加成功
			else
				return -1;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return -1;
		} finally {
			closeConnection();
		}
	}

	public int deleteStudent() {
		if (!isExists())
			return 0; // 不存在
		conn = DBConnection.getConnection();
		sql = "delete from `student` where `sid` = ?";
		try {
			GradeBean grade = new GradeBean();
			grade.deleteGradeUsesid(sid);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				return 1; // 操作成功；
			else
				return -1; // 失败
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return -1;
		} finally {
			closeConnection();
		}
	}

	public int changeStudent() {
		if (!isExists())
			return 0; // 不存在；
		conn = DBConnection.getConnection();
		sql = "update `student` set `name` = ?, `sex` = ? where `sid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, sex);
			pstmt.setString(3, sid);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				return 1;
			else
				return -1;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return -1;
		} finally {
			closeConnection();
		}
	}
}
