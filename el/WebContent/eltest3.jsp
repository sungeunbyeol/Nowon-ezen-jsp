<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<html>
<head>
<title>EL test 3</title>
</head>
<body>
<%
	request.setAttribute("name","홍길동");
	session.setAttribute("name","유재석");
	//pageScope > requestScope > sessionScope > applicationScope
	ArrayList<String> list = new ArrayList();
	list.add("홍길동");
	list.add("유재석");
	request.setAttribute("list", list);
%>
	<h2> 넘어온 자료 : ${name}</h2>
	<h2> 넘어온 자료 : ${sessionScope.name}</h2>
	<h3>${list['0']}</h3>
	<h3>${list['1']}</h3>
</body>
</html>