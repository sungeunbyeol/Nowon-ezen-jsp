package shop.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.ProductBean;
import shop.admin.dto.ProductDTO;

public class ProdViewCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		ProductBean pdao = new ProductBean();
		try {
			ProductDTO dto = pdao.getProduct(Integer.parseInt(pnum));
			String upPath = req.getServletContext().getRealPath("prodImages");
			req.setAttribute("pdto", dto);
			req.setAttribute("upPath", upPath);
		}catch(SQLException e) {}
		return "WEB-INF/shop/admin/prod_view.jsp";
	}

}
