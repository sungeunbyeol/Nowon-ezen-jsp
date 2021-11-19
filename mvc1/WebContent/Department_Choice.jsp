<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--Department_Choice.jsp -->
<html>
<head>
<title>mvc1</title>
</head>
<body>
	<h1 align="center">과목 선택 페이지</h1>
	<form name="f" action="depart.do" method="post">
		 학과선택 : 
		 <select name="depart" size="1">
		 	<option value="c">C언어</option>
		 	<option value="java">JAVA</option>
		 	<option value="python">PYTHON</option>
		 	<option value="go">GO언어</option>
		 </select>
		 <input type="submit" value="전송">
	</form>
</body>
</html>