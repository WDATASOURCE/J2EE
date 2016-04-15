package cn.edu.njust;

import java.sql.*;

public class CourseBean {
	private String cid;
	private String name;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;

	public CourseBean() {
		cid = null;
		name = null;
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
	}

	public CourseBean(String cid, String name) {
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
		this.cid = cid;
		this.name = name;
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
		sql = "select * from `course` where `cid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
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
		sql = "select * from `course` order by `cid`";
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

	public int addCourse() {
		if (isExists())
			return 0; // 已存在
		conn = DBConnection.getConnection();
		sql = "insert into `course`(`cid`, `name`)values(?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, name);
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

	public int deleteCourse() {
		if (!isExists())
			return 0; // 不存在
		conn = DBConnection.getConnection();
		sql = "delete from `course` where `cid` = ?";
		try {
			GradeBean grade = new GradeBean();
			grade.deleteGradeUsecid(cid);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
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

	public int changeCourse() {
		if (!isExists())
			return 0; // 不存在；
		conn = DBConnection.getConnection();
		sql = "update `course` set `name` = ? where `cid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, cid);
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
