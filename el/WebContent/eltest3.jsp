<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<html>
<head>
<title>EL test 3</title>
</head>
<body>
<%
	request.setAttribute("name","ȫ�浿");
	session.setAttribute("name","���缮");
	//pageScope > requestScope > sessionScope > applicationScope
	ArrayList<String> list = new ArrayList();
	list.add("ȫ�浿");
	list.add("���缮");
	request.setAttribute("list", list);
%>
	<h2> �Ѿ�� �ڷ� : ${name}</h2>
	<h2> �Ѿ�� �ڷ� : ${sessionScope.name}</h2>
	<h3>${list['0']}</h3>
	<h3>${list['1']}</h3>
</body>
</html>