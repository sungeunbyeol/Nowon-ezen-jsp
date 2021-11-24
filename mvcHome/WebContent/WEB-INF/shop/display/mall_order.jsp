<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, shop.admin.dto.*, java.text.*"%>
<!-- mall_order.jsp -->
<%
		Hashtable<Integer, ProductDTO> ht = (Hashtable)request.getAttribute("order");
%>
<%@ include file="mall_top.jsp"%>
<div align="center">
	<table width="100%" align="center" class="outline">
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
<%	DecimalFormat df = new DecimalFormat("###,###");
		int cartTotalPrice = 0;
		Enumeration<Integer> enu = ht.keys();
		while(enu.hasMoreElements()){
			ProductDTO dto = ht.get(enu.nextElement());%>		
		<tr>
			<td align="center"><%=dto.getPname()%></td>
			<td align="center"><%=dto.getPqty()%></td>
			<td align="center"><%=df.format(dto.getPqty()*dto.getPrice())%>원</td>
		</tr>
<%		cartTotalPrice += dto.getPqty() * dto.getPrice();
		} %>	
		<tr class="m1">
			<td colspan="3">
				<b>결재하실 총액 : </b>
				<font color="red">[<%=df.format(cartTotalPrice)%>]원</font>
			</td>
		</tr>	
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>


















