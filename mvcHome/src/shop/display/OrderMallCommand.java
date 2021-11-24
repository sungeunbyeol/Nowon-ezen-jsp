package shop.display;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dto.ProductDTO;

public class OrderMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String select = req.getParameter("select");
		String qty = req.getParameter("qty");
		
		Hashtable<Integer, ProductDTO> ht = null;
		if (pnum == null){
			CartBean cart = new CartBean(req);
			ht = cart.listCart();
		}else {
			ProductList proList = ProductList.getInstance();
			ProductDTO dto = proList.getProduct(Integer.parseInt(pnum), select);
			dto.setPqty(Integer.parseInt(qty));
			ht = new Hashtable<>();
			ht.put(Integer.valueOf(pnum), dto);
		}
		req.setAttribute("order", ht);
		return "WEB-INF/shop/display/mall_order.jsp";
	}

}
