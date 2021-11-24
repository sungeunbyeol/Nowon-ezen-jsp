package shop.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.CategoryBean;
import shop.admin.dto.CategoryDTO;

public class CateListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryBean dao = new CategoryBean();
		try {
			List<CategoryDTO> list = dao.listCate();
			req.setAttribute("cateList", list);
		}catch(SQLException e) {}
		return "WEB-INF/shop/admin/cate_list.jsp";
	}
	

}









