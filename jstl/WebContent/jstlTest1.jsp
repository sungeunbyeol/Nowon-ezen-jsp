<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- jstl Test 1 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>jstl Test 1</title>
</head>
<body>
	<b>brower변수값 설정</b>
	<c:set var="browser" value="${header['User-Agent']}" /><br>
	<b>설정후 browser의 값 : <c:out value="${browser}"/></b><br>
	<c:remove var="browser"/>
	<b>삭제후 browser의 값 : <c:out value="${browser}"/></b>
</body>
</html>