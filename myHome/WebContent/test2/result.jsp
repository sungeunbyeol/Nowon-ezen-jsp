<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//로그인의 조건, id가 admin이고 pwd가 1234일때 로그인 된다 라고 가정하자
		String msg = null, url = null;
		if (id.equals("admin")){
			if (pwd.equals("1234")){
				session.setAttribute("id", id);
				session.setAttribute("pwd", pwd);
				msg = "로그인 되었습니다. 회원전용페이지로 이동합니다.";
				url = "sessionTest2.jsp";
			}else {
				msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요!!";
				url = "sessionTest1.jsp";
			}
		}else {
			msg = "아이디가 없습니다. 다시 입력해 주세요!!";
			url = "sessionTest1.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>