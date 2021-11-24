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
				msg = "������ϼ���!! ��������������� �̵��մϴ�.";
				url = "book.do?command=list";
			}else {
				msg = "������Ͻ���!! ��������������� �̵��մϴ�.";
				url = "book.do?command=start";
			}
		}catch(SQLException e) {
			msg = "DB���� �߻�!! �����ڿ��� �����ϼ���";
			url = "book.do?command=start";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}

	
	
	
	
	
	
	
	
	
	
	
	
	