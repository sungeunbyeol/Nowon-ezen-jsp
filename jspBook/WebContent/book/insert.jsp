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
				alert("������, ���ǻ�, �����̸� ��� �Է��� �ּ���!!");
				history.back()	
			</script>		
<%		return;
		}
	
		int res = bdao.insertBook(bdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("������ϼ���!! ��������������� �̵��մϴ�.")
				location.href="list.jsp"
			</script>
<%	}else {%>
			<script type="text/javascript">
				alert("������Ͻ���!! ��������������� �̵��մϴ�.")
				location.href="book.jsp"			
			</script>
<%	}%>







