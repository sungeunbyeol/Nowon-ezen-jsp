package my.shop.mall;

import java.util.Hashtable;

import my.shop.ProductDTO;

public class CartBean {
	Hashtable<Integer, ProductDTO> ht;
	ProductList productList;
	
	public CartBean() {
		ht = new Hashtable<>();
	}
	
	public void setProductList(ProductList productList) {
		this.productList = productList;
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
	
	public void deleteCart(int pnum) {
		ht.remove(pnum);
	}
}













