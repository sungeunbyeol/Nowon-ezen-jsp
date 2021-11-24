package shop.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.CategoryBean;

public class CateDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cnum = req.getParameter("cnum");
		CategoryBean dao = new CategoryBean();
		try {
			int res = dao.deleteCate(Integer.parseInt(cnum));
			if (res>0) {
				req.setAttribute("msg", "카테고리삭제성공!! 카테고리목록페이지로 이동합니다.");
				req.setAttribute("url", "cate_list.shop");
			}else {
				req.setAttribute("msg", "카테고리삭제실패!! 카테고리목록페이지로 이동합니다.");
				req.setAttribute("url", "cate_list.shop");
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}

}
