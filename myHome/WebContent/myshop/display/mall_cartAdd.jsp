<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartAdd.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="proList" class="my.shop.mall.ProductList" scope="session" />
<jsp:setProperty property="productList" name="cart" value="<%=proList%>"/>

<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		if (pnum==null || select==null || pnum.trim().equals("") || select.trim().equals("") || qty<1){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		boolean isAddCart = cart.addCart(Integer.parseInt(pnum), select, qty);
		response.sendRedirect("mall_cartList.jsp");
%>
