package book.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import book.dto.BookDTO;

public class BookDAO {
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

	public int insertBook(BookDTO dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "insert into jspBook values(?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getBookname());
			ps.setString(2, dto.getPublisher());
			ps.setString(3, dto.getWriter());
			ps.setInt(4, dto.getPrice());
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(5, sdf.format(date));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected ArrayList<BookDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<BookDTO> list = new ArrayList<>();
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookname(rs.getString("bookname"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setWriter(rs.getString("writer"));
			dto.setPrice(rs.getInt("price"));
			dto.setIndate(rs.getString("indate"));
			list.add(dto);
		}
		return list;
	}
	
	public ArrayList<BookDTO> listBook() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select * from jspBook";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteBook(String bookname) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "delete from jspbook where bookname = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, bookname);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<BookDTO> findBook(String search, String searchString) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select * from jspbook where " + search + " like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+searchString+"%");
			rs = ps.executeQuery();
			ArrayList<BookDTO> find = makeArrayList(rs);
			return find;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}


















