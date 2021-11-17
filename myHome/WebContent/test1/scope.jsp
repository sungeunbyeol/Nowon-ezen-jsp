<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty name="obj" property="*" />
<h2>request Scope</h2>
<b>obj의 getCount() 호출 값 : </b>
<jsp:getProperty property="count" name="obj" />
<br>
<jsp:forward page="result.jsp"/>
<%--
scope : 사용범위
page	: 현재 page에서만 사용 가능, default
request	: 두개의 page에서 사용 가능
session	: 브라우저가 유지되는 동안 사용 가능
application : 하나의 서버에서 사용 가능

page이동
html : a태그
javascript : 
 - location.href
 - window.location
 - history.back()
java :
 - response.sendRedirect
jsp 액션태그 :
 - forward : 이동한페이지에서 끝
   - 현재page에서의 출력값은 실행하지 않는다
 - include : 이동한페이지가 끝나면 다시 돌아온다
--%>
