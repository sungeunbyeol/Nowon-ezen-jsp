package board.dao;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.dto.BoardDBBean;

public class BoardDataBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println("lookup실패!!" + e.getMessage());
		}
	}

	protected List<BoardDBBean> makeList(ResultSet rs) throws SQLException {
		List<BoardDBBean> list = new ArrayList<>();
		while(rs.next()) {
			BoardDBBean dto = new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			list.add(dto);
		}
		return list;
	}
	public List<BoardDBBean> listBoard(int start, int end) throws SQLException {
		try {  
			con = ds.getConnection();
			//String sql = "select * from board order by re_step asc";
			String sql = "select * from "
					+ "(select rownum rn, A.* from "
					+ "(select * from board order by re_step asc)A)"
					+ " where rn between ? and ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			List<BoardDBBean> listBoard = makeList(rs);
			return listBoard;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int insertBoard(BoardDBBean dto) throws SQLException {
		String sql = null;
		try {
			con = ds.getConnection();
			if (dto.getNum() == 0) {//새글쓰기 작업
				sql = "update board set re_step = re_step + 1";
				//dto.setRe_step(0);
				//dto.setRe_level(0);
			}else {							//답들쓰기 작업
				sql = "update board set re_step = re_step + 1 where re_step > " + dto.getRe_step();	
				dto.setRe_step(dto.getRe_step() + 1);
				dto.setRe_level(dto.getRe_level() + 1);
			}
			ps = con.prepareStatement(sql);
			ps.executeLargeUpdate();
			
			sql = "insert into board values(board_seq.nextval, ?,?,?,?,sysdate,0,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getPasswd());
			ps.setString(5, dto.getContent());
			ps.setString(6, dto.getIp());
			ps.setInt(7, dto.getRe_step());
			ps.setInt(8, dto.getRe_level());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	protected void plusReadcount(int num) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "update board set readcount=readcount+1 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public BoardDBBean getBoard(int num, String mode) throws SQLException {
		if (mode.equals("content")) {
			plusReadcount(num);
		}
		try {
			con = ds.getConnection();
			String sql = "select * from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<BoardDBBean> getBoard = makeList(rs);
			return getBoard.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}

	protected boolean isPassword(int num, String passwd) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select passwd from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("passwd").trim().equals(passwd)) {
					return true;
				}
			}
			return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int deleteBoard(int num, String passwd) throws SQLException {
		if (!isPassword(num, passwd)) {
			return -1;
		}
		try {
			con = ds.getConnection();
			String sql = "delete from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int updateBoard(BoardDBBean dto) throws SQLException {
		if (!isPassword(dto.getNum(), dto.getPasswd())) {
			return -1;
		}
		try {
			con = ds.getConnection();
			String sql = "update board set writer=?, email=?, subject=?, content=? where num = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getNum());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public int getCount() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select count(*) from board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}











