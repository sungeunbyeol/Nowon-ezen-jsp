package book.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.dao.BookDAO;

public class DeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bookname = req.getParameter("bookname");
		String msg = null, url = null;
		try {
			BookDAO dao = new BookDAO();
			int res = dao.deleteBook(bookname);
			if (res>0) {
				msg = "도서삭제성공!! 도서목록페이지로 이동합니다.";
				url = "book.do?command=list";
			}else {
				msg = "도서삭제실패!! 도서삭제페이지로 이동합니다.";
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






