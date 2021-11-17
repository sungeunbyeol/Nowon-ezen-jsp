<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.login.*"%>
<!-- login_ok.jsp -->
<jsp:useBean id="loginCheck" class="my.login.LoginCheck" />
<jsp:setProperty property="*" name="loginCheck"/>
<jsp:useBean id="loginOk" class="my.login.LoginOkBean" scope="session" />
<%
		if (loginCheck.getId() == null || loginCheck.getId().trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}

		String saveId = request.getParameter("saveId");

		int res = loginCheck.loginCheck();
		String msg = null, url = null;
		switch(res){
		case LoginCheck.OK :
			loginOk.setId(loginCheck.getId());
			boolean isLogin = loginOk.isSetting();
			
			Cookie ck = new Cookie("saveId", loginOk.getId());
			if (saveId == null){
				ck.setMaxAge(0);
			}else {
				ck.setMaxAge(24*60*60);
			}
			response.addCookie(ck);
			
			session.setAttribute("id", loginOk.getId());
			session.setAttribute("name", loginOk.getName());
			msg = "�α����� �Ǿ����ϴ�.";
			url = request.getContextPath()+"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = "���̵� �����ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PW :
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���";
			url = "login.jsp";
			break;
		case LoginCheck.ERROR :
			msg = "DB ���� ���� �߻�!! �����ڿ��� ������ �ּ���.";
			url = request.getContextPath()+"/index.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>






