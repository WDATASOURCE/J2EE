package cn.edu.njust;
import java.sql.*;

public class TeacherBean {
	private String tid;
	private String name;
	private String password;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public TeacherBean(){
		tid = null;
		name = null;
		password = null;
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
	}
	
	public TeacherBean(String tid, String name, String Password){
		conn = null;
		pstmt = null;
		sql = null;
		rs = null;
		this.tid = tid;
		this.name = name;
		this.password = Password;
		
	}
	
	public void setTid(String tid){
		this.tid = tid;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getTid(){
		return this.tid;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void closeConnection(){
		try {
		 	if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();	
			if(rs != null) rs.close();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();		
		}
	}
	
	public int isExists(){
		conn = DBConnection.getConnection();
		sql = "select * from `teacher` where `tid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(password.compareTo(rs.getString("password")) == 0) return 1; // 登陆成功
				else return 0; // 密码错误
			}
			else return -1;   // 用户名错误
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally{
			closeConnection();
		}
		return -1;
	}
	
	public ResultSet query(){
		conn = DBConnection.getConnection();
		sql = "select * from `teacher` where `tid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tid);
			rs = pstmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return null;
		}
	}
	
	public int changeTeacher(){
		conn = DBConnection.getConnection();
		sql = "update `teacher` set `name` = ?, `password` = ? where `tid` = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  name);
			pstmt.setString(2, password);
			pstmt.setString(3, tid);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) return 1;
			else return -1;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return -1;
		}finally{
			closeConnection();
		}
	}
}
