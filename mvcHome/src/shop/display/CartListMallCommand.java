package shop.display;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartListMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String upPath = req.getServletContext().getRealPath("prodImages");	
		req.setAttribute("upPath", upPath);
		return "WEB-INF/shop/display/mall_cartList.jsp";
	}

}
