<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_input.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<%
		//member_input.jsp �������� ���� ���������, �������� ���ؼ�
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}

		int res = mbdao.insertMember(mbdto);
		if (res>0){%>
		<script type="text/javascript">
			alert("ȸ�����Լ���!! ȸ�������� ���ϵ帳�ϴ�.")
			self.close()
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("ȸ�����Խ���!! ȸ�������������� �̵��մϴ�.")
			location.href="memberSsn.jsp"
		</script>
<%	} %>		








