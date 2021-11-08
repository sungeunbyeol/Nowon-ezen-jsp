package my.member;

import java.sql.*;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "javaapi";
		pass = "javaapi";
	}
}
