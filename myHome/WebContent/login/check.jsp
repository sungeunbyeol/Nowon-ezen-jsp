<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- check.jsp -->
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String id = request.getParameter("id");
		
		if (name==null || name.trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}
		
		String msg = mbdao.searchMember(name, ssn1, ssn2, id);
		if (id == null){
			if (msg == null){
				msg = "���̵� ã�� �� �����ϴ�. �ٽ� Ȯ���� �ּ���!!";
			}
		}else {
			if (msg == null){
				msg = "�ش��ϴ� ������ ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ���� �ּ���!!";
			}
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	self.close()
</script>



