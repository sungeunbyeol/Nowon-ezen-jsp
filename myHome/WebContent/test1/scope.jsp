<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty property="*" name="obj"/>
<h2>request Scope</h2>
<b>obj�� getCount() ȣ�� �� : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<jsp:forward page="result.jsp"/>
