package shop.display;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartDelMallCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		CartBean cart = new CartBean(req);
		int res = cart.deleteCart(Integer.parseInt(pnum));
		String msg = null;
		String url = "cartList.mall";
		if (res>0){
			msg = "��ٱ��Ͽ��� ��ǰ�� �����Ͽ����ϴ�.";
		}else {
			msg = "��ٱ��Ͽ��� ��ǰ������ �����Ͽ����ϴ�.";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
