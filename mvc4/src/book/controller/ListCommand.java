package book.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.dao.BookDAO;
import book.dto.BookDTO;

public class ListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BookDAO dao = new BookDAO();
		try {
			ArrayList<BookDTO> list = dao.listBook();
			req.setAttribute("listBook", list);
			return "list.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB오류발생!! 관리자에게 문의해 주세요!!");
			req.setAttribute("url", "book.do?command=start");
			return "message.jsp";
		}
	}

}















