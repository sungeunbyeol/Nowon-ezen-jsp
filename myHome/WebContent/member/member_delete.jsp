<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_delete.jsp -->
<%
		String no = request.getParameter("no");
		if (no == null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg = null, url = "memberAll.jsp";
		if (res>0){
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}else {
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>