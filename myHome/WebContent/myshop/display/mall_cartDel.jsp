<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartDel.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" />
<%
		String pnum = request.getParameter("pnum");
		if (pnum == null || pnum.trim().equals("")){
			response.sendRedirect("mall_cartList.jsp");
			return;
		}
		
		cart.deleteCart(pnum);
%>
<script type="text/javascript">
	alert("�ش� ��ǰ�� ��ٱ��Ͽ��� �����Ͽ����ϴ�.")
	location.href="mall_cartList.jsp"
</script>