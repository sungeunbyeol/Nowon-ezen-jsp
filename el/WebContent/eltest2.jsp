<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>EL �׽�Ʈ 2</title>
</head>
<body>
	<h3>�Ķ���Ͱ� ó��</h3>
	<form name="f" method="post">
		�̸� : <input type="text" name="name">
		<input type="submit" value="����">
	</form>
	<hr color="red">

	<h3>�Ѿ�� �ڷ� : ${param.name}</h3>
</body>
</html>