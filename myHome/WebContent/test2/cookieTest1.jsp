<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		//��Ű �����
		Cookie ck = new Cookie("id" , "admin");
		Cookie ck2 = new Cookie("pwd", "1234");
		
		//��Ű ����ֱ�
		ck.setMaxAge(24*60*60); //�ʴ����� �Է�
		ck2.setMaxAge(7*24*60*60);
		//ck.setMaxAge(0); �ش��ϴ� ��Ű�� ������ ����
		
		//��Ű �����ϱ�
		response.addCookie(ck);
		response.addCookie(ck2);
%>
<h2>��Ű ���� ��!</h2>