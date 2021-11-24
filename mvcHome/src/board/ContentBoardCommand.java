package board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDataBean;
import board.dto.BoardDBBean;

public class ContentBoardCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String num = req.getParameter("num");
		BoardDataBean dao = new BoardDataBean();
		try {
			BoardDBBean dto = dao.getBoard(Integer.parseInt(num), "content");
			req.setAttribute("getBoard", dto);
		}catch(SQLException e) {}
		
		return "WEB-INF/board/content.jsp";
	}
}
	
	
	
	
	
	
	
