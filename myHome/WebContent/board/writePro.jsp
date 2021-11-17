<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writePro.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bdto" class="my.board.BoardDBBean" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=dbPool%>"/>

<%	
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		bdto.setIp(request.getRemoteAddr());
		int res = bdao.insertBoard(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 등록 성공!! 게시글 목록 페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "게시글 등록 실패!! 게시글 등록 페이지로 이동합니다.";
			url = "writeForm.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>











