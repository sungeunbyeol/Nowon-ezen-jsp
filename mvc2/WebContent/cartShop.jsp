<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,shop.admin.*"%>
<!-- cartShop.jsp -->
<%
		List<ShopDTO> cart = (List)session.getAttribute("cart");
		if (cart != null && cart.size() != 0){
%>
<b>���� �ֹ��� ����</b>
<table border="1">
	<tr>
		<th>��������</th>
		<th>�۰�</th>
		<th>����</th>
		<th>����</th>
	</tr>
<%	for(int i=0; i<cart.size(); ++i){
			ShopDTO dto = cart.get(i);
%>
	<tr>
		<td><%=dto.getTitle()%></td>
		<td><%=dto.getAuthor()%></td>
		<td><%=dto.getPrice()%></td>
		<td><%=dto.getQty()%></td>
		<td>
			<form name="del" action="bookShop.do" method="post">
				<input type="hidden" name="command" value="DEL"/>
				<input type="hidden" name="index" value="<%=i %>"/>
				<input type="submit" value="����">
			</form>
		</td>
	</tr>	
<%	} %>
</table>
<form name="check" action="bookShop.do" method="post">
	<input type="hidden" name="command" value="CHK"/>
	<input type="submit" value="���������������� �̵�">
</form>
<%} %>




