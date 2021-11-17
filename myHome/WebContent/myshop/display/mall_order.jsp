<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*, java.text.*"%>
<!-- mall_order.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" /> 
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="prodlist" name="cart" value="<%=prodlist%>" />

<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		String qty = request.getParameter("qty");
		
		Hashtable<String, ProductDTO> ht = null;
		if (pnum == null) {
			ht = cart.listCart();
		}else {
			ProductDTO dto = prodlist.getProduct(Integer.parseInt(pnum), select);
			ht = new Hashtable<>();
			dto.setPqty(Integer.parseInt(qty));
			ht.put(Integer.valueOf(pnum), dto);
		}
%>
<%@ include file="mall_top.jsp" %>
<table width="100%" border="1" align="center">
	<tr class="m2">
		<td colspan="3" align="center">
			<font size="3">결재 내역서 보기</font><br>
		</td>
	</tr>
	<tr class="m1">
		<th width="50%" align="center">상품명</th>
		<th width="15%" align="center">수량</th>
		<th width="35%" align="center">금액</th>
	</tr>
<%  
			DecimalFormat df = new DecimalFormat("###,###");
			int cartTotalPrice = 0;
			Enumeration<String> enu = ht.keys();
			while(enu.hasMoreElements()){
				String key = enu.nextElement();
				ProductDTO dto = ht.get(key);%>
	<tr>
		<td align="center"><%=dto.getPname()%></td>
		<td align="right"><%=dto.getPqty()%></td>
		<td align="right"><%=df.format(dto.getPrice()*dto.getPqty())%>원</td>
<%		cartTotalPrice += dto.getPrice() * dto.getPqty();%>			
	</tr>			
<%		}%>
	<tr class="m1">
		<td colspan="3">
			<b>결재하실 총액</b> : 
			<font color=" red">[<%=cartTotalPrice%>] 원</font>
		</td>
	</tr>
</table>
<%@ include file="mall_bottom.jsp" %>









