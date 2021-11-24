package shop.display;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartAddMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String select = req.getParameter("select");
		int qty = Integer.parseInt(req.getParameter("qty"));
		CartBean cart = new CartBean(req);
		boolean isAddCart = cart.addCart(Integer.parseInt(pnum), select, qty);
		return "cartList.mall";
	}

}
