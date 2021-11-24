package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import shop.dto.CategoryDTO;

public class CategoryBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println("lookup½ÇÆÐ!!" + e.getMessage());
		}
	}
	
	public boolean check(CategoryDTO dto) throws SQLException{
		String sql = "select * from category where code=? or cname=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			rs = ps.executeQuery();
			if (rs.next()){
				return true;
			}else {
				return false;
			}
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int insertCate(CategoryDTO dto) throws SQLException {
		String sql = "insert into category values(cate_seq.nextval,?,?)";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<CategoryDTO> listCate() throws SQLException{
		String sql = "select * from category";
		List<CategoryDTO> list = new ArrayList<>();
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				CategoryDTO dto = new CategoryDTO();
				dto.setCnum(rs.getInt("cnum"));
				dto.setCode(rs.getString("code"));
				dto.setCname(rs.getString("cname"));
				list.add(dto);
			}
			return list;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteCate(int cnum) throws SQLException {
		String sql = "delete from category where cnum=?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}
