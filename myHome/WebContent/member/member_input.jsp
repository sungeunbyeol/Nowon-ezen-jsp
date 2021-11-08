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
		//member_input.jsp 페이지에 직접 들어왔을경우, 내보내기 위해서
		if (mbdto.getName() == null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}

		int res = mbdao.insertMember(mbdto);
		if (res>0){%>
		<script type="text/javascript">
			alert("회원가입성공!! 회원가입을 축하드립니다.")
			self.close()
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("회원가입실패!! 회원가입페이지로 이동합니다.")
			location.href="memberSsn.jsp"
		</script>
<%	} %>		








