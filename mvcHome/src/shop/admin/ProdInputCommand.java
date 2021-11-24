package shop.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.CategoryBean;
import shop.admin.dto.CategoryDTO;

public class ProdInputCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryBean cdao = new CategoryBean();
		List<CategoryDTO> list = null;
		try {
			list = cdao.listCate();
		}catch(SQLException e) {}
		if (list == null || list.size()==0) {
			req.setAttribute("msg", "ī�װ��� ���� ����� �ּ���!!");
			req.setAttribute("url", "cate_input.shop");
			return "message.jsp";
		}
		req.setAttribute("cateList", list);
		return "WEB-INF/shop/admin/prod_input.jsp";
	}

}





