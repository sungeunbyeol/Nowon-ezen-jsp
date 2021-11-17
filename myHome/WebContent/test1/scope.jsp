<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty name="obj" property="*" />
<h2>request Scope</h2>
<b>obj�� getCount() ȣ�� �� : </b>
<jsp:getProperty property="count" name="obj" />
<br>
<jsp:forward page="result.jsp"/>
<%--
scope : ������
page	: ���� page������ ��� ����, default
request	: �ΰ��� page���� ��� ����
session	: �������� �����Ǵ� ���� ��� ����
application : �ϳ��� �������� ��� ����

page�̵�
html : a�±�
javascript : 
 - location.href
 - window.location
 - history.back()
java :
 - response.sendRedirect
jsp �׼��±� :
 - forward : �̵������������� ��
   - ����page������ ��°��� �������� �ʴ´�
 - include : �̵����������� ������ �ٽ� ���ƿ´�
--%>
