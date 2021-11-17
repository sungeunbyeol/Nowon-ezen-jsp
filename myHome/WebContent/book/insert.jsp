<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dto" class="my.book.BookDTO" />
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="my.book.BookDAO" />
<%
		if (dto.getBookname()==null || dto.getWriter()==null || dto.getPublisher()==null
		|| dto.getBookname().trim().equals("") || dto.getWriter().trim().equals("") 
		|| dto.getPublisher().trim().equals("") || dto.getPrice()==0){
			response.sendRedirect("book.jsp");
			return;
		}

		int res = dao.insertBook(dto);
		String msg = null, url = null;
		if (res>0){
			msg = "������ϼ���!! ��������������� �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "������Ͻ���!! ���������������� �̵��մϴ�.";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




