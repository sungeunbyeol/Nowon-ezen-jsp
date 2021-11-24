package board;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDataBean;
import board.dto.BoardDBBean;

public class ListBoardCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDataBean dao = new BoardDataBean();
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int number = 0;
		int rowCount = 0;
		try {
			rowCount = dao.getCount();
			if (endRow>rowCount) endRow = rowCount;
			number = rowCount - startRow + 1;
			List<BoardDBBean> list = dao.listBoard(startRow, endRow);
			req.setAttribute("listBoard", list);
			req.setAttribute("number", number);
			req.setAttribute("rowCount", rowCount);
		}catch(SQLException e) {}
		
		if (rowCount>0){
			int pageBlock = 3;
			int pageCount = rowCount / pageSize;
			if (rowCount%pageSize != 0){
				pageCount++;
			}
			int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
		}
		
		return "WEB-INF/board/list.jsp";
	}

}








