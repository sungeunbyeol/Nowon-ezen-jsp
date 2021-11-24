package login;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LoginOkBean {
	private int no;
	private String name;
	private String id;
	private String passwd;
	private String ssn1;
	private String ssn2;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String joindate;
	
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getSsn1() {
		return ssn1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public String getEmail() {
		return email;
	}
	public String getHp1() {
		return hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public String getJoindate() {
		return joindate;
	}
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println("lookup½ÇÆÐ!!" + e.getMessage());
		}
	}
	
	public boolean isMemberSetting() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			String sql = "select * from jspmember where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				no = rs.getInt("no");
				name = rs.getString("name");
				//id = rs.getString("id");
				passwd = rs.getString("passwd");
				ssn1 = rs.getString("ssn1");
				ssn2 = rs.getString("ssn2");
				email = rs.getString("email");
				hp1 = rs.getString("hp1");
				hp2 = rs.getString("hp2");
				hp3 = rs.getString("hp3");
				joindate = rs.getString("joindate");
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
		return false;
	}
}














