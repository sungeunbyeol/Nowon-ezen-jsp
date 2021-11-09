<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.login.*"%>
<!-- login_ok.jsp -->
<jsp:useBean id="loginOk" class="my.login.LoginOkBean" scope="session" />
<jsp:useBean id="loginCheck" class="my.login.LoginCheck" />
<jsp:setProperty property="*" name="loginCheck"/>
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="loginCheck" value="<%=dbPool%>"/>
<jsp:setProperty property="pool" name="loginOk" value="<%=dbPool%>"/>
<%
		String saveId = request.getParameter("saveId");
		Cookie ck = new Cookie("saveId", loginCheck.getId());
		
	 	int res = loginCheck.checkLogin();
		String msg = null, url = null;
		switch(res){
		case LoginCheck.OK :
			if (saveId == null){
				ck.setMaxAge(0);
			}else {
				ck.setMaxAge(12*60*60);
			}
			response.addCookie(ck);
			loginOk.setId(loginCheck.getId());
			boolean isLogin = loginOk.isMemberSetting();
			session.setAttribute("mbId", loginOk.getId());
			session.setAttribute("mbName", loginOk.getName());
			msg = "�α��� �Ǿ����ϴ�.";
			url = request.getContextPath()+"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = "���� ���̵� �Դϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PWD :
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���";
			url = "login.jsp";
			break;
		case LoginCheck.ERROR :
			msg = "DB���� ���� �߻�!! �����ڿ��� ������ �ּ���!!";
			url = "login.jsp";
			break;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>



