<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartEdit.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" />
<%
		String pnum = request.getParameter("pnum");
		String pqty = request.getParameter("pqty");
		if (pnum==null || pqty==null || pnum.trim().equals("") || pqty.trim().equals("")){
			response.sendRedirect("mall_cartList.jsp");
			return;
		}
		
		cart.editCart(pnum, Integer.parseInt(pqty));
%>
<script type="text/javascript">
	alert("��ǰ�� ������ �����Ͽ����ϴ�.")
	location.href="mall_cartList.jsp"
</script>