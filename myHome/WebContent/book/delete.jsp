<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp -->
<jsp:useBean id="dao" class="my.book.BookDAO" />
<%
		String bookname = request.getParameter("bookname");
		if (bookname==null || bookname.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
		int res = dao.deleteBook(bookname);
		String msg = null, url = null; 
		if (res>0){
			msg = "������������!! ��������������� �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "������������!! ���������������� �̵��մϴ�.";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>