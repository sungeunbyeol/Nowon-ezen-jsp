package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDataBean;
import board.dto.BoardDBBean;

public class WriteProBoardCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDBBean dto = new BoardDBBean();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setWriter(req.getParameter("writer"));
		dto.setEmail(req.getParameter("email"));
		dto.setSubject(req.getParameter("subject"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setContent(req.getParameter("content"));
		dto.setIp(req.getRemoteAddr());
		dto.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		BoardDataBean dao = new BoardDataBean();
		try {
			int res = dao.insertBoard(dto);
			if (res>0) {
				req.setAttribute("msg", "게시글등록성공!! 게시글목록페이지로 이동합니다.");
				req.setAttribute("url", "list.board");
			}else {
				req.setAttribute("msg", "게시글등록실패!! 게시글등록페이지로 이동합니다.");
				req.setAttribute("url", "writeForm.board");
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}

}






