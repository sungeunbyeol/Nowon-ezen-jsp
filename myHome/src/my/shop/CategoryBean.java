package my.shop;

import java.util.*;
import java.sql.*;

import my.db.ConnectionPoolBean;

public class CategoryBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int insertCate(CategoryDTO dto) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "insert into category values(cate_seq.nextval, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<CategoryDTO> listCate() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from category order by cnum asc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<CategoryDTO> clist = new ArrayList<>();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCnum(rs.getInt("cnum"));
				dto.setCode(rs.getString("code"));
				dto.setCname(rs.getString("cname"));
				clist.add(dto);
			}
			return clist;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteCate(int cnum) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "delete from category where cnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}








