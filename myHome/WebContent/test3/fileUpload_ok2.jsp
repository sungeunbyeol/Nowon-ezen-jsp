<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>    
<!-- fileUpload_ok2.jsp -->
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/test3");
		int len = 10*1024*1024;//byte����
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
			//�Ű����� ���� : 1. reqeust(�Ķ���� ���� ����), 2. ��������ġ, 3. �ִ�ũ��, 4.�۲� 			
			//��ü�� ����� ����, ������ ��ġ�� �����̸��� ���� �̸����� ����� �ȴ�
		}catch(IOException e){
			e.printStackTrace();//�������� ����� ���´�
		}
%>
<hr color="blue">
<ul>
	<li>�ø��� : <%=mr.getParameter("name")%><br>
	<li>���ϸ� : <%=mr.getFilesystemName("filename")%><br>
	<li>���ϳ��� : <%=mr.getParameter("content")%><br>
	<li>����ƮŸ�� : <%=mr.getContentType("filename")%><br>
	<li>����ũ�� :
	<%
			File file = mr.getFile("filename");
			int filesize = 0;
			if (file != null){
				filesize = (int)file.length();
			}
	%><%=filesize%>Bytes</li>
</ul>














