package shop.display;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dto.ProductDTO;

public class CgProdListMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String code = req.getParameter("code");
		String upPath = req.getServletContext().getRealPath("prodImages");
		req.setAttribute("upPath",  upPath);
		ProductList productList = ProductList.getInstance();
		try {
			List<ProductDTO> plist = productList.selectByCode(code);
			req.setAttribute(code, plist);
		}catch(SQLException e) {}
		
		return "WEB-INF/shop/display/mall_cgProdList.jsp";
	}

}
