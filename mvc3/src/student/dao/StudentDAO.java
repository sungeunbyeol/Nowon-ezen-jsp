package student.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

import student.dto.StudentDTO;

public class StudentDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;			//javax.sql.*
	static {
		try {
			Context init = new InitialContext();		//javax.naming.*
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println("lookup½ÇÆÐ!!" + e.getMessage());
		}
	}
	
	public int insertStudent(StudentDTO dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "insert into student values(?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,  dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected ArrayList<StudentDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<StudentDTO> list = new ArrayList<>();
		while(rs.next()) {
			StudentDTO dto = new StudentDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setCname(rs.getString("cname"));
			list.add(dto);
		}
		return list;
	}
	
	public ArrayList<StudentDTO> listStudent() throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from student";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<StudentDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteStudent(String id) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "delete from student where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<StudentDTO> findStudent(String name) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select * from student where name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			ArrayList<StudentDTO> find = makeArrayList(rs);
			return find;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}
















