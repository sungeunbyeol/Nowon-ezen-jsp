<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_edit_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="my.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=dbPool%>"/>
<%
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}

		int res = mbdao.updateMember(mbdto);
		if (res>0){%>  
		<script type="text/javascript">
			alert("ȸ����������!! ȸ������������� �̵��մϴ�.")
			location.href="memberAll.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("ȸ����������!! ȸ������������� �̵��մϴ�.")
			location.href="memberAll.jsp"
		</script>
<%	} %>		




