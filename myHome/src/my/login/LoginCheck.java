package my.login;

import my.db.ConnectionPoolBean;
import java.sql.*;

public class LoginCheck {
	
	public static final int OK =0;
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	
	public int checkLogin() {
		Connection con = null; //null 이 없으면 메모리에 안올라가는것
		PreparedStatement ps = null; // null이 있으면 값은 없지만 메모리에 올라가는 거
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			String sql = "select passwd from jspmember where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,id);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getString(1);
				if(dbPass.equals(passwd)) {
					return OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) pool.returnConnection(con);
			}catch(SQLException e) {}
		}
	}

}
