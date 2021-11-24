<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartList.jsp -->
<%@ include file="mall_top.jsp" %>
<div align="center">
	<table border="1" width="100%">
		<tr class="m2">
			<td colspan="6" align="center">
				<h3>��ٱ��� ����</h3>
			</td>
		</tr>
		<tr class="m1">
			<th width="10%">��ȣ</th>
			<th width="30%">��ǰ��</th>
			<th width="15%">����</th>
			<th width="15%">�ܰ�</th>
			<th width="20%">�ݾ�</th>
			<th width="10%">����</th>
		</tr>
<%	Hashtable<Integer, ProductDTO> ht = (Hashtable)session.getAttribute("cart");
		if (ht == null || ht.size() == 0){%>
		<tr>
			<td colspan="6">��ٱ��ϰ� ������ϴ�.</td>
		</tr>
<%	}else {
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
			String upPath = (String)request.getAttribute("upPath");
			int cartTotalPrice = 0;
			int cartTotalPoint = 0;
			Enumeration<Integer> enu = ht.keys();
			while(enu.hasMoreElements()){
				ProductDTO dto = ht.get(enu.nextElement());%>
		<tr>
			<td align="center"><%=dto.getPnum()%></td>
			<td align="center">
				<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40"><br>
				<b><%=dto.getPname()%></b>
			</td>
			<td align="center">
				<form name="f2" action="cartEdit.mall" method="post">
					<input type="text" size="3" name="pqty" value="<%=dto.getPqty()%>">��<br>
					<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>
					<input type="submit" value="����">
				</form>
			</td>
			<td algin="right">
				<b><%=df.format(dto.getPrice())%>��</b><br>
				<b>[<%=dto.getPoint()%>]point</b>
			</td>
			<td align="right">
				<b><%=df.format(dto.getPrice()*dto.getPqty())%>��</b><br>
				<b>[<%=dto.getPoint()*dto.getPqty()%>]point</b>
			</td>
<%		cartTotalPrice += dto.getPrice() * dto.getPqty();
			cartTotalPoint += dto.getPoint() * dto.getPqty();%>
			<td align="center">
				<a href="cartDel.mall?pnum=<%=dto.getPnum()%>">����</a>
			</td>			
		</tr>		
<%		}//end while%>
		<tr class="m1">
			<td colspan="4">
				<b>��ٱ��� �Ѿ� : </b>
				<font color="red"><%=df.format(cartTotalPrice)%>��</font><br>
				<b>�� ���� ����Ʈ : </b>
				<font color="green">[<%=cartTotalPoint%>]point</font>
			</td>
			<td colspan="2">
				<a href="order.mall">[�ֹ��ϱ�]</a> | 
				<a href="main.mall">[��Ӽ���]</a>
			</td>
		</tr>	


<%	}// end if%>				
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>				



















