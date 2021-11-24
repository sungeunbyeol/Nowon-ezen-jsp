package shop.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.ProductBean;
import shop.admin.dto.ProductDTO;

public class ProdListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ProductBean pdao = new ProductBean();
		try {
			List<ProductDTO> list = pdao.listProduct();
			req.setAttribute("prodList", list);
		}catch(SQLException e) {}
		return "WEB-INF/shop/admin/prod_list.jsp";
	}

}






