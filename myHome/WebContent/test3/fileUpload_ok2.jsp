<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>    
<!-- fileUpload_ok2.jsp -->
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/test3");
		int len = 10*1024*1024;//byte단위
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
			//매개변수 순서 : 1. reqeust(파라미터 값만 나옴), 2. 저장할위치, 3. 최대크기, 4.글꼴 			
			//객체가 만들어 지면, 저장할 위치에 파일이름과 같은 이름으로 기록이 된다
		}catch(IOException e){
			e.printStackTrace();//서버에만 기록이 남는다
		}
%>
<hr color="blue">
<ul>
	<li>올린이 : <%=mr.getParameter("name")%><br>
	<li>파일명 : <%=mr.getFilesystemName("filename")%><br>
	<li>파일내용 : <%=mr.getParameter("content")%><br>
	<li>컨텐트타입 : <%=mr.getContentType("filename")%><br>
	<li>파일크기 :
	<%
			File file = mr.getFile("filename");
			int filesize = 0;
			if (file != null){
				filesize = (int)file.length();
			}
	%><%=filesize%>Bytes</li>
</ul>














