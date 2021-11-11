package my.shop.mall;

import java.util.*;

import my.db.ConnectionPoolBean;

import java.sql.*;
import my.shop.*;

public class ProductList {
	Hashtable<String, List<ProductDTO>> ht = new Hashtable<>();
	//String : spec or categoryfk, List : �ش�Ű�� ��ǰ��
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public List<ProductDTO> selectBySpec(String pspec) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from product where pspec = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			List<ProductDTO> list = makeList(rs);
			ht.put(pspec, list);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
		
	}
	
	public List<ProductDTO> makeList(ResultSet rs) throws SQLException {
		List<ProductDTO> list = new ArrayList<>();
		while(rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPnum(rs.getInt("pnum"));
			dto.setPname(rs.getString("pname"));
			dto.setPcategory_fk(rs.getString("pcategory_fk"));
			dto.setPcompany(rs.getString("pcompany"));
			dto.setPimage(rs.getString("pimage"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setPspec(rs.getString("pspec"));
			dto.setPcontents(rs.getString("pcontents"));
			dto.setPoint(rs.getInt("point"));
			dto.setPinputdate(rs.getString("pinputdate"));
			list.add(dto);
		}
		return list;
	}
	
	
	public List<ProductDTO> selectByCode(String code) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from product where pcategory_fk like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, code +"%");
			rs = ps.executeQuery();
			List<ProductDTO> list = makeList(rs);
			ht.put(code, list);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public ProductDTO getProduct(int pnum, String select) {
		List<ProductDTO> list = ht.get(select);
		for(ProductDTO dto : list) {
			if (dto.getPnum() == pnum) {
				return dto;
			}
		}
		return null;
	}
}














