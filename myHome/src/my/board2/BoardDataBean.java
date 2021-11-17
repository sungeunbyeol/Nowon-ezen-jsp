package my.board2;

import java.io.File;
import java.sql.*;
import my.db.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class BoardDataBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	public List<BoardDBBean> listBoard() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from board2 order by num desc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<BoardDBBean> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<BoardDBBean> makeList(ResultSet rs) throws SQLException {
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
			dto.setFilename(rs.getString("filename"));
			dto.setFliesize(rs.getInt("filesize"));
			list.add(dto);
		}
		return list;
	}
	
	public int insertBoard(MultipartRequest mr, String ip) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "insert into board2 values(board_seq.nextval, ?,?,?,?, sysdate, 0, ?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("passwd"));
			ps.setString(5, mr.getParameter("content"));
			ps.setString(6, ip);
			ps.setString(7, mr.getFilesystemName("filename"));
			int filesize = 0;
			File file = mr.getFile("filename");
			if (file != null) {
				filesize = (int)file.length();
			}
			ps.setInt(8, filesize);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	protected void plusReadcount(int num) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "update board2 set readcount = readcount+1 where num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public BoardDBBean getBoard(int num, String mode) throws SQLException {
		try {
			if (mode.equals("content")) {
				plusReadcount(num);
			}			
			con = pool.getConnection();
			String sql = "select * from board2 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<BoardDBBean> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	protected boolean isPassword(int num, String passwd) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select passwd from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(passwd)) {
					return true;
				}
			}
			return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	public int deleteBoard(int num, String passwd) throws SQLException {
		try {
			if (!isPassword(num, passwd)) {
				return -1;
			}
			con = pool.getConnection();
			String sql = "delete from board where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int updateBoard(BoardDBBean dto) throws SQLException {
		if (!isPassword(dto.getNum(), dto.getPasswd())) {
			return -1;
		}
		try {
			con = pool.getConnection();
			String sql = "update board set writer=?, email=?, subject=?, content=? where num=?";
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
			if (con != null) pool.returnConnection(con);
		}
	}
}













