package shop.display;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.admin.dto.ProductDTO;

public class CartBean {
	Hashtable<Integer, ProductDTO> ht;
	ProductList productList = ProductList.getInstance();
	HttpSession session;
	
	public CartBean(HttpServletRequest req) {
		session = req.getSession();
		ht = (Hashtable)session.getAttribute("cart");
		if (ht == null) {
			ht = new Hashtable<>();
		}
	}
	
	public boolean addCart(int pnum, String select, int qty) {
		if (ht.containsKey(pnum)) {
			ProductDTO dto = ht.get(pnum);
			dto.setPqty(dto.getPqty() + qty);
		}else {
			ProductDTO pdto = productList.getProduct(pnum, select);
			pdto.setPqty(qty);
			ht.put(pnum, pdto);
		}
		session.setAttribute("cart", ht);
		return true;
	}
	
	public Hashtable<Integer, ProductDTO> listCart(){
		return ht;
	}
	
	public void editCart(int pnum, int pqty) {
		if (pqty == 0) {
			deleteCart(pnum);
		}else {
			ProductDTO dto = ht.get(pnum);
			dto.setPqty(pqty);
		}
	}
	
	public int deleteCart(int pnum) {
		if (ht.remove(pnum) == null) {
			return 0;
		}else {
			return 1;
		}
	}
}













