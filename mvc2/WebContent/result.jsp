<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, shop.*"%>
<!-- result.jsp -->
<html>
<head>
	<title>���</title>
</head>
<body>
	<h1>���� �ֹ� ���� ������</h1>
	<hr color="blue">
	<b>�ֹ��� ����ǰ��</b>
	<table border="1">
		<tr>
			<th>��������</th>
			<th>�۰�</th>
			<th>�ܰ�</th>
			<th>����</th>
			<th>����</th>
		</tr>
<%
		Hashtable<String, ShopDTO> ht = (Hashtable)request.getAttribute("cart");
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		int sum = 0;
		Enumeration<String> enu = ht.keys();
		while(enu.hasMoreElements()){
			ShopDTO dto = ht.get(enu.nextElement());
			int price = dto.getPrice() * dto.getQty();
			sum += price;%>
		<tr>
			<td align="center"><%=dto.getTitle()%></td>
			<td algin="center"><%=dto.getAuthor()%></td>
			<td algin="right"><%=dto.getPrice()%></td>
			<td align="right"><%=dto.getQty()%></td>
			<td algin="right"><%=df.format(price)%>��</td>
		</tr>	
<%	}%>
		<tr>
			<td colspan="4" align="center">�ѱ��Աݾ�</td>
			<td><%=df.format(sum)%>��</td>
		</tr>
	</table>
</body>
</html>		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		