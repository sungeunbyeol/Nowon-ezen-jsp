<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<h2>request scope Result.jsp ������ �Դϴ�.</h2>
<b>obj�� getCount() �� ȣ�� : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="testScope.html">ó������</a>