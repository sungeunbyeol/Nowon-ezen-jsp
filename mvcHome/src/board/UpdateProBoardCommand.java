package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDataBean;
import board.dto.BoardDBBean;

public class UpdateProBoardCommand implements CommandIf {

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
		BoardDataBean dao = new BoardDataBean();
		int res = 0;
		try {
			res = dao.updateBoard(dto);
		}catch(SQLException e) {}
		String msg = null, url = null;
		if (res>0){
			msg = "글수정성공!! 글목록페이지로 이동합니다.";
			url = "list.board";
		}else if (res<0){
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요!!";
			url = "updateForm.board?num=" + dto.getNum();
		}else {
			msg = "글수정실패!! 글내용보기페이지로 이동합니다.";
			url = "content.board?num=" + dto.getNum();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
