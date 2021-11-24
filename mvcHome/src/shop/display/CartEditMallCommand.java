package shop.display;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartEditMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String pqty = req.getParameter("pqty");
		CartBean cart = new CartBean(req);
		cart.editCart(Integer.parseInt(pnum), Integer.parseInt(pqty));
		return "cartList.mall";
	}

}
