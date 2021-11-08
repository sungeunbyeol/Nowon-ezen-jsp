<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest2.jsp -->
<%
		String id = (String)session.getAttribute("id");
		String pwd = (String)session.getAttribute("pwd");
		if (id == null || id.trim().equals("") || pwd == null || pwd.trim().equals("")){%>
		<script type="text/javascript">
			alert("로그인을 먼저 해 주세요!!")
			location.href="sessionTest1.jsp"
		</script>		
<%		return;
		}
%>
<h2>회 원 전 용 페 이 지</h2>
<h3>회원들만 볼 수 있어야 합니다. 회원이 아니면 볼 수 없도록 만들어야 합니다.</h3>
<a href="sessionTest3.jsp">로그아웃</a>