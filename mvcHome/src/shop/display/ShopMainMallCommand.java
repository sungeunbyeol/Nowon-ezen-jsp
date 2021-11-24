package shop.display;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.admin.dao.CategoryBean;
import shop.admin.dto.CategoryDTO;
import shop.admin.dto.ProductDTO;

public class ShopMainMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryBean cdao = new CategoryBean();
		List<CategoryDTO> list = null;
		try {
			list = cdao.listCate();
		}catch(SQLException e) {}
		HttpSession session = req.getSession();
		session.setAttribute("cateList", list);
		
		String upPath = req.getServletContext().getRealPath("prodImages");
		req.setAttribute("upPath",  upPath);
		ProductList productList = ProductList.getInstance();
		try {
			List<ProductDTO> plist = productList.selectBySpec("hit");
			List<ProductDTO> plist2 = productList.selectBySpec("new");
			List<ProductDTO> plist3 = productList.selectBySpec("best");
			req.setAttribute("hit", plist);
			req.setAttribute("new", plist2);
			req.setAttribute("best", plist3);
		}catch(SQLException e) {}
		
		return "WEB-INF/shop/display/mall.jsp";
	}

}
