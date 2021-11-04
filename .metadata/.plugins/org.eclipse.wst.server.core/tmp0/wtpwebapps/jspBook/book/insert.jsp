<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bdto" class="my.book.BookDTO" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.book.BookDAO" />
<%
		if (bdto.getBookname() == null || bdto.getBookname().trim().equals("") ||
					bdto.getPublisher() == null || bdto.getPublisher().trim().equals("") ||
					bdto.getWriter() == null || bdto.getWriter().trim().equals("")){%>
			<script type="text/javascript">
				alert("도서명, 출판사, 지은이를 모두 입력해 주세요!!");
				history.back()	
			</script>		
<%		return;
		}
	
		int res = bdao.insertBook(bdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("도서등록성공!! 도서목록페이지로 이동합니다.")
				location.href="list.jsp"
			</script>
<%	}else {%>
			<script type="text/javascript">
				alert("도서등록실패!! 도서등록페이지로 이동합니다.")
				location.href="book.jsp"			
			</script>
<%	}%>







