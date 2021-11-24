package shop.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.CategoryBean;
import shop.admin.dto.CategoryDTO;

public class CateInputOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryDTO dto = new CategoryDTO();
		dto.setCode(req.getParameter("code"));
		dto.setCname(req.getParameter("cname"));
		CategoryBean dao = new CategoryBean();
		try {
			int res = dao.insertCate(dto);
			if (res>0) {
				req.setAttribute("msg", "카테고리등록성공!! 카테고리목록페이지로 이동합니다.");
				req.setAttribute("url", "cate_list.shop");
			}else {
				req.setAttribute("msg", "카테고리등록실패!! 카테고리등록페이지로 이동합니다.");
				req.setAttribute("url", "cate_input.shop");
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}
}
