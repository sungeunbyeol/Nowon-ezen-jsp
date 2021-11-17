package memo;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MemoDAO {
	private Connection con; 
	private PreparedStatement ps; 
	private ResultSet rs;
	
	static DataSource ds;			//javax.sql.*
	static {
		try {
			Context init = new InitialContext();		//javax.naming.*
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println("lookup실패!!" + e.getMessage());
		}
	}
	
	public int insertMemo(String id, String email, String memo) {
		try {
			con = ds.getConnection();
			String sql = "insert into memo values(?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			ps.setString(3, memo);
			int res = ps.executeUpdate();
			return res;
		}catch(SQLException e) {
			
			System.err.println("insertMemo메소드 실행 중 오류 발생!!" + e.getMessage()) ;
			return -1;
		}finally {
			try {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
	}
	
	public List<MemoDTO> listMemo() {
		try {
			con = ds.getConnection();
			String sql = "select * from memo";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemoDTO> list = new ArrayList<>();
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setMemo(rs.getString("memo"));
				list.add(dto);
			}
			return list;
		}catch(SQLException e) {
			System.err.println("listMemo() 메소드 실행 중 오류 발생!!");
			e.printStackTrace();
			return null;
		}finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e) {}
		}
	}
	
}
















