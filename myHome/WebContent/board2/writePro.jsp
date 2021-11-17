<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<!-- writePro.jsp -->
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board2");
		int len = 10*1024*1024;
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		}catch(IOException e){
			e.printStackTrace();
			%>
			<script type="text/javascript">
				alert("파일 업로드 중 오류 발생!! 게시글 목록페이지로 이동합니다.")
				location.href="list.jsp"	
			</script>
<%		return;
		}
%>
<jsp:useBean id="dao" class="my.board2.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="dao" value="<%=pool%>"/>

<%
		String writer = mr.getParameter("writer");
		if (writer == null || writer.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
	
		String ip = request.getRemoteAddr();
		int res =  dao.insertBoard(mr, ip);  
		if (res>0){%>
		<script type="text/javascript">
			alert("게시글 등록 성공!! 게시글 목록 페이지로 이동합니다.")
			location.href="list.jsp"
		</script>
<%	}else {%>
		<script type="text/javascript">
			alert("게시글 등록 실패!! 게시글 등록 페이지로 이동합니다.")
			location.href="writeForm.jsp"
		</script>
<%	}%>











