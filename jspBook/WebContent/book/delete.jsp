<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp -->
<jsp:useBean id="bdao" class="my.book.BookDAO" />
<%
		request.setCharacterEncoding("EUC-KR");
		String bookname = request.getParameter("bookname");
		if (bookname == null || bookname.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
		
		int res = bdao.deleteBook(bookname);
		String msg = null, nextPage = null;
		if (res>0){
			msg = "도서삭제성공!! 도서목록페이지로 이동합니다.";
			nextPage = "list.jsp";
		}else {
			msg = "도서삭제실패!! 도서관리페이지로 이동합니다.";
			nextPage = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=nextPage%>"
</script>









