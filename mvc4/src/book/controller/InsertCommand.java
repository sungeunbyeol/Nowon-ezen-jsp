package book.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.dao.BookDAO;
import book.dto.BookDTO;

public class InsertCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BookDTO dto = new BookDTO();
		dto.setBookname(req.getParameter("bookname"));
		dto.setPublisher(req.getParameter("publisher"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setWriter(req.getParameter("writer"));
		BookDAO dao = new BookDAO();
		String msg = null, url = null;
		try {
			int res = dao.insertBook(dto);
			if (res>0) {
				msg = "도서등록성공!! 도서목록페이지로 이동합니다.";
				url = "book.do?command=list";
			}else {
				msg = "도서등록실패!! 도서등록페이지로 이동합니다.";
				url = "book.do?command=start";
			}
		}catch(SQLException e) {
			msg = "DB오류 발생!! 관리자에게 문의하세요";
			url = "book.do?command=start";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}

	
	
	
	
	
	
	
	
	
	
	
	
	