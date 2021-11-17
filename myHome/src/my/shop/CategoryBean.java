package my.shop;

import java.sql.*;
import java.util.*;

import my.db.*;

public class CategoryBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public boolean check(CategoryDTO dto) throws SQLException{
		String sql = "select * from category where code=? or cname=?";
		try{
			con = pool.getConnection();
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
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int insertCate(CategoryDTO dto) throws SQLException {
		String sql = "insert into category values(cate_seq.nextval,?,?)";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<CategoryDTO> listCate() throws SQLException{
		String sql = "select * from category";
		List<CategoryDTO> list = new ArrayList<>();
		try{
			con = pool.getConnection();
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
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteCate(int cnum) throws SQLException {
		String sql = "delete from category where cnum=?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally{
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}
