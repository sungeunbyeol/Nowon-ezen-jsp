<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- bookShop.jsp -->
<html>
<head>
	<title>MVC2��°����</title>
</head>
<body>
	<h1>���� �ֹ� ������</h1>
	<form name="f" action="bookShop.do" method="post">
		<input type="hidden" name="command" value="ADD"/>
		<b>�������� : </b>
		<select name="book">
			<option>����� / �������丮 / 15000</option>
			<option>���ݼ��� / �Ŀ÷� �ڿ��� / 21000</option>
			<option>ȫ�浿�� / ��� / 25000</option>
			<option>�ڹ��� ���� / ���ü� / 32000</option>
			<option>1���ֽ��� ��� / ���Ͽ� / 20000</option>
		</select>
		<b>���� : </b>
		<input type="text" name="qty" size="2" value="1">
		<input type="submit" value="�����ֹ�">
	</form>
	<hr color="red">
	<jsp:include page="cartShop.jsp"/>
</body>
</html>








