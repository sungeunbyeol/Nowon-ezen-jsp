<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- CookieTest2.jsp -->
<html>
<head>
	<title>��Ű�׽�Ʈ2</title>
</head>
<body>
	<h2>Ŭ���̾�Ʈ���� �Ѿ�� ��Ű</h2>
<%
		Cookie[] cks = request.getCookies();
		if (cks != null && cks.length != 0){
			for(int i=0; i<cks.length; ++i){
				String name = cks[i].getName();
				String value = cks[i].getValue();
				out.println("<h3>name = " + name + " , value = " + value + "</h3>");
			}
		}
%>
</body>
</html>