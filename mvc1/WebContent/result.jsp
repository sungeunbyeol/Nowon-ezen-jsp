<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html>
<%
		List<String> advice = (List)request.getAttribute("list");
		if(advice == null || advice.size()==0){%>
		<h1>�����Ǵ� ������ �����ϴ�.</h1>

<%}	else{
	for(String str : advice){%>
	<h2><%=str %></h2>
<%} 
}%>