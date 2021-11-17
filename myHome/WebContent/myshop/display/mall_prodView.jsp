<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_prodView.jsp -->
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		if (pnum==null || select==null){
			response.sendRedirect("mall.jsp");
			return;  
		}
		ProductDTO pdto = prodlist.getProduct(Integer.parseInt(pnum), select);
		String upPath = config.getServletContext().getRealPath("/myshop/files");
		DecimalFormat df = new DecimalFormat("###,###");
%>
<script type="text/javascript">
	function goCart(){
		document.cartAdd.action = "mall_cartAdd.jsp"
		document.cartAdd.submit()
	}
	function goOrder(){
		document.cartAdd.action = "mall_order.jsp"
		document.cartAdd.submit()
	}
</script>
<div align="center">
<table width="99%" border="0" class="outline">
	<tr class="m1">
		<td colspan="2" align="center">
			<b>[<%=pdto.getPname()%>] ��ǰ ����</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="200" height="200" border="0">
		</td>
		<td class="m3">
			<form name="cartAdd" method="post">
				��ǰ��ȣ : <%=pnum%><br>
				��ǰ�̸� : <%=pdto.getPname()%><br>
				��ǰ���� : <font color="red"><%=pdto.getPrice()%></font>��<br>
				��ǰ����Ʈ : <font color="red">[<%=pdto.getPoint()%>]</font>point<br>
				��ǰ���� : <input type="text" name="qty" size="3" value="1">��<br><br>
				<input type="hidden" name="pnum" value="<%=pnum%>"/>
				<input type="hidden" name="select" value="<%=select%>"/>
				<a href="javascript:goCart()">��ٱ���</a>
				<a href="javascript:goOrder()">��ñ���</a>
			</form>	
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="left">
			<b>��ǰ �� ����</b><br>
			<%=pdto.getPcontents()%>
		</td>
	</tr>		
</table>	
</div>
<%@ include file="mall_bottom.jsp" %>