<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	switch(addr){
	case "seoul" : addr="서울"; break;
	case "busan" : addr="부산"; break;
	case "daegu" : addr="대구"; break;
	}
%>

<h2><%= name %>님의 전화번호는 <%=tel %>번 이며,
<%=addr %>입니다.</h2>