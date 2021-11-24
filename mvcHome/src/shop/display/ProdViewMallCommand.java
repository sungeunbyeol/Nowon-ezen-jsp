package shop.display;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dto.ProductDTO;

public class ProdViewMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String select = req.getParameter("select");
		ProductList proList = ProductList.getInstance();
		ProductDTO pdto = proList.getProduct(Integer.parseInt(pnum), select);
		String upPath = req.getServletContext().getRealPath("prodImages");
		req.setAttribute("pdto", pdto);
		req.setAttribute("upPath", upPath);
		return "WEB-INF/shop/display/mall_prodView.jsp";
	}

}
