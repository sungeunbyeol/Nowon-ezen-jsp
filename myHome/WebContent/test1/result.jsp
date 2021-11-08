<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<h2>request scope Result.jsp 페이지 입니다.</h2>
<b>obj의 getCount() 값 호출 : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="testScope.html">처음으로</a>