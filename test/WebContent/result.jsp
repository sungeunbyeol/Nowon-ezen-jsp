<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	switch(addr){
	case "seoul" : addr="����"; break;
	case "busan" : addr="�λ�"; break;
	case "daegu" : addr="�뱸"; break;
	}
%>

<h2><%= name %>���� ��ȭ��ȣ�� <%=tel %>�� �̸�,
<%=addr %>�Դϴ�.</h2>