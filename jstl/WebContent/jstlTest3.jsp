<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		
	</tr>


</table>
	<c:set var="sum"/>
	<c:forEach var="i" begin="2" end="9">
		<c:forEach var="j" begin="1" end="9"> 
			<c:set value="${sum=i*j}"/>
			<c:set var="sum" value="${i*j = sum}"></c:set>
		</c:forEach>
	</c:forEach>
	<c:out value="${i} * ${j} = ${sum }" ></c:out>
</body>
</html>
