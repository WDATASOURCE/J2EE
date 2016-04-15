package cn.edu.njust;

import java.sql.*;

public class GradeBean {
	private String sid;
	private String cid;
	private double score;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;

	public GradeBean() {
		sid = null;
		cid = null;
		score = 0.0;
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
	}

	public GradeBean(String sid, String cid, double score) {
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
		this.sid = sid;
		this.cid = cid;
		this.score = score;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public void setScore(double score) {
		this.score = score;
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
		sql = "select * from `grade` where `sid` = ? and `cid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			pstmt.setString(2, cid);
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

	public boolean isExistsSid(String sid) {
		conn = DBConnection.getConnection();
		sql = "select * from `grade` where `sid` = ?";
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

	public boolean isExistsCid(String cid) {
		conn = DBConnection.getConnection();
		sql = "select * from `grade` where `cid` = ?";
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
		sql = "select * from `grade`";
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

	public int addGrade() {
		if (isExists())
			return 0; // 已存在
		conn = DBConnection.getConnection();
		sql = "insert into `grade`(`sid`, `cid`, `score`)values(?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			pstmt.setString(2, cid);
			pstmt.setDouble(3, score);
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

	public int deleteGrade() {
		if (!isExists())
			return 0; // 不存在
		conn = DBConnection.getConnection();
		sql = "delete from `grade` where `sid` = ? and `cid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			pstmt.setString(2, cid);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				return 1; // 操作成功；
			else
				return -1; // 失败
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			closeConnection();
			return -1;
		}
	}

	public int deleteGradeUsesid(String sid) {
		if (!isExistsSid(sid))
			return 0; // 不存在
		conn = DBConnection.getConnection();
		sql = "delete from `grade` where `sid` = ?";
		try {
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
			closeConnection();
			return -1;
		}
	}

	public int deleteGradeUsecid(String cid) {
		if (!isExistsCid(cid))
			return 0; // 不存在
		conn = DBConnection.getConnection();
		sql = "delete from `grade` where `cid` = ?";
		try {
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

	public int changeGrade() {
		if (!isExists())
			return 0; // 不存在；
		conn = DBConnection.getConnection();
		sql = "update `grade` set `score` = ? where `sid` = ? and `cid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, score);
			pstmt.setString(2, sid);
			pstmt.setString(3, cid);
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
