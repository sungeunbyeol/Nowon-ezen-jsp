<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- jstl Test 2 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>jstl Test 2</title>
</head>
<body>
	<c:set var="country" value="${'korea' }"/>
	<c:if test="${country !=null }">
		<c:out value="${country }"></c:out>
	</c:if>
	<c:choose>
		<c:when test="${country == 'canada' }">
			<c:out value="${country}"/>�� �ܿ��� �ſ� ����ϴ�.
		</c:when>
		<c:when test="${country == 'russia' }">
			<c:out value="${country}"/>�� �ܿ��� �ſ� �ſ� ����ϴ�.
		</c:when>
		<c:when test="${country == 'korea' }">
			<c:out value="${country}"/>�� �ܿ��� ����ϴ�.
		</c:when>
		<c:otherwise>
			�׿� ������ �� �� �����ϴ�.
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="1" end="100">
		<c:if test="${i%2==0}">
			<c:set var="sum" value="${sum+i }"></c:set>
		</c:if>
	</c:forEach>
	<br><br>
	1~100������ ¦������ : ${sum }
</body>
</html>