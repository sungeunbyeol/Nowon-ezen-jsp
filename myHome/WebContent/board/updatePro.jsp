<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- updatePro.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dto" class="my.board.BoardDBBean" />
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="my.board.BoardDataBean" />

<%
		if (dto.getWriter() == null || dto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
	
		int res =  dao.updateBoard(dto);
		String msg = null, url = null;
		if (res>0){
			msg = "�ۼ��� ����!! �۸���������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res<0){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!";
			url = "updateForm.jsp?num="+ dto.getNum();
		}else {
			msg = "�ۼ��� ����!! �ۺ��� �������� �̵��մϴ�.";
			url = "content.jsp?num="+dto.getNum();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>











