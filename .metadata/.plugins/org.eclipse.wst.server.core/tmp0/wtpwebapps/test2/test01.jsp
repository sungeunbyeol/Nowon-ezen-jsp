<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<h2>안녕하세요  jsp 입니다.</h2>
<% 
	for(int i=0; i<10; ++i){
%>
	<h3>안녕 jsp <%=i %></h3>
<%
	}
%>