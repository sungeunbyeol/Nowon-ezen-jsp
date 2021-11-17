package my.login;

import java.sql.*;

public class LoginOkBean {//�α����� �����ϸ� �� �������� ������ ���ǿ� �����ϱ� ���� Ŭ����
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
	
	public boolean isSetting() throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 con = DriverManager.getConnection
					 ("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
			 String sql = "select * from member where id = ?";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, id);
			 rs = ps.executeQuery();
			 if (rs.next()) {
				 no = rs.getInt("no");
				 name = rs.getString("name");
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
			 return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}













