<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>EL 테스트 2</title>
</head>
<body>
	<h3>파라미터값 처리</h3>
	<form name="f" method="post">
		이름 : <input type="text" name="name">
		<input type="submit" value="전송">
	</form>
	<hr color="red">

	<h3>넘어온 자료 : ${param.name}</h3>
</body>
</html>