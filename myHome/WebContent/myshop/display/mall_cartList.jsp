<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_cartList.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" />
<%@ include file="mall_top.jsp"%>
<table width="100%" border="1" align="center">
	<tr class="m2">
		<td colspan="6" align="center">
			<h3>��ٱ��� ����</h3>
		</td>
	</tr>
	<tr class="m1">
		<th width="10%">��ȣ</th>
		<th width="30%">��ǰ��</th>
		<th width="14%">����</th>
		<th width="18%">�ܰ�</th>
		<th width="18%">�ݾ�</th>
		<th width="10%">����</th>
	</tr>
<%
		Hashtable<String, ProductDTO> ht = cart.listCart();
		if (ht==null || ht.size()==0){%>
	<tr>
		<td colspan="6">��ٱ��ϰ� ������ϴ�.</td>
	</tr>
<%	}else {
			DecimalFormat df = new DecimalFormat("###,###");
			int cartTotalPrice = 0;
			int cartTotalPoint = 0;
			Enumeration<String> enu = ht.keys();
			while(enu.hasMoreElements()){
				String key = enu.nextElement();
				ProductDTO dto = ht.get(key);
				String upPath = config.getServletContext().getRealPath("/myshop/files");%>
	<tr>
		<td align="center"><%=dto.getPnum()%></td>
		<td align="center">
			<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40"><br>
			<b><%=dto.getPname()%></b>
		</td>
		<td align="center">
			<form name="cartEdit" method="post" action="mall_cartEdit.jsp">
				<input type="text" size="3" name="pqty" value="<%=dto.getPqty()%>"/>��<br>
				<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>
				<input type="submit" value="����">
			</form>
		</td>
		<td align="right">
			<b><%=df.format(dto.getPrice())%>��</b><br>
			<b>[<%=dto.getPoint()%>]point</b>
		</td>
		<td align="right">
			<font color="red">
				<b><%=df.format(dto.getPrice()*dto.getPqty())%>��</b><br>
				<b>[<%=dto.getPoint()*dto.getPqty()%>]point</b>
			</font>
<%		cartTotalPrice += dto.getPrice() * dto.getPqty();
			cartTotalPoint += dto.getPoint() * dto.getPqty();%>			
		</td>
		<td align="center">
			<a href="mall_cartDel.jsp?pnum=<%=dto.getPnum()%>">����</a>
		</td>
	</tr>			
<%		}%>
	<tr class="m1">
		<td colspan="4">
			<b>��ٱ��� �Ѿ�</b> :
			<font color="red"><%=df.format(cartTotalPrice)%>��<br></font>
			<b>�� ���� ����Ʈ </b> : 
			<font color="green">[<%=cartTotalPoint%>] point</font>
		</td>
		<td colspan="2">
			<a href="mall_order.jsp">[�ֹ��ϱ�]</a>
			<a href="javascript:history.go(-2)">[��Ӽ���]</a>
		</td>
	</tr>
<%	}%>	
</table>
<%@ include file="mall_bottom.jsp"%>








