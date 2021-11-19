package shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShopServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
														throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		HttpSession session = req.getSession();
		List<ShopDTO> cart = (List)session.getAttribute("cart");
		String cmd = req.getParameter("command");
		
		if (cmd.equals("CHK")) {
			Hashtable<String, ShopDTO> ht = new Hashtable<>();
			for(ShopDTO dto : cart) {
				if (ht.containsKey(dto.getTitle())) {
					ShopDTO cartDTO = ht.get(dto.getTitle());
					cartDTO.setQty(cartDTO.getQty() + dto.getQty());
				}else {
					ht.put(dto.getTitle(), dto);
				}
			}
			req.setAttribute("cart", ht);
			RequestDispatcher view = req.getRequestDispatcher("result.jsp");
			view.forward(req, resp);
		}else {
			if (cmd.equals("ADD")) {
				ShopDTO dto = getShop(req);
				if (cart==null) {
					cart = new ArrayList<>();
				}
				cart.add(dto);
			}else if (cmd.equals("DEL")) {
				int index = Integer.parseInt(req.getParameter("index"));
				cart.remove(index);
			}
			session.setAttribute("cart", cart);
			RequestDispatcher view = req.getRequestDispatcher("bookShop.jsp");
			view.forward(req, resp);
		}
	}
	
	protected ShopDTO getShop(HttpServletRequest req) {
		//StringTokenizer, String클래스의 split(), Scanner
		ShopDTO dto = new ShopDTO();
		String data = req.getParameter("book");
		String qty = req.getParameter("qty");
		//dto에 data와 qty를 넣어주자
		Scanner scan = new Scanner(data).useDelimiter("\\s*/\\s*");
		dto.setTitle(scan.next());
		dto.setAuthor(scan.next());
		dto.setPrice(scan.nextInt());
		dto.setQty(Integer.parseInt(qty));
		return dto;
	}
}











